package com.controller;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.service.inner.AttributeService;
import com.service.inner.CategoryService;
import com.service.inner.ProductService;
import com.service.inner.ProperselectService;
import com.util.ProductDictionary;
import com.vo.Categorys;
import com.vo.Products;
import com.vo.Properties;
import com.vo.Properties_select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController implements ServletConfigAware {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AttributeService attributeService;

    @Autowired
    private ProperselectService properselectService;

    private ServletConfig servletConfig;

    @Override
    public void setServletConfig(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }
    //商品销量排行榜
    @RequestMapping("/salesVolume")
    @ResponseBody
    public List<Products> salesVolume(Integer row)
    {
        return productService.salesVolume(row);
    }

    @RequestMapping("/getPageByQuery")
    public String getPageByQuery(@RequestParam(defaultValue = "") String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage, @RequestParam(defaultValue = "8") Integer perPageRecordCount, Integer cid, String target, String ascOrDesc, HttpServletRequest request, HttpServletResponse response,String orderCondition)
    {

        List<Products> list=new ArrayList<>();
        Integer intOnsale= ProductDictionary.onsaleStrToInt(searchCondition);//根据查询条件获取上下架的状态
        System.out.println("查询条件为："+searchCondition);
        PageInfo pageInfo=new PageInfo(requestPage);
        pageInfo.setPerPageRecordCount(perPageRecordCount);//设置分页的记录数大小
        Products p=new Products();
        try {
            List<Categorys> lc_list=categoryService.selectByName(searchCondition);
            if (lc_list.size()!=0)//根据查询条件查看是不是有这个cid的商品
            {
                Categorys category = lc_list.get(0);
                p.setCid(lc_list.get(0).getCid());
                request.setAttribute("category", category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("cid的值"+cid);
        if (cid!=null) {
            p.setCid(cid);
        }
        p.setPname(searchCondition);
        p.setDianpu_name(searchCondition);
        p.setOnsale(intOnsale);
        OrderCondition oc=new OrderCondition();//这个是排序的类
        if (orderCondition!=null&&!orderCondition.equals(""))
        {
            oc.setOrderCondition(orderCondition);
        }if (ascOrDesc!=null&&!ascOrDesc.equals(""))
        {
            oc.setAscOrDesc(ascOrDesc);
        }
        try {
            int count=productService.getPageQueryByCount(p);
            pageInfo.setTotalRecordCount(count);
            list=productService.getPageQuery(pageInfo,p,oc);
            System.out.println(list);
            request.setAttribute("orderConditionObj",oc);
            request.setAttribute("list",list);
            if(list.size()!=0)
            {
                request.setAttribute("product",list.get(0));//把第一个放进去好算一点
            }
            request.setAttribute("pageInfo",pageInfo);
            request.setAttribute("requestPage",requestPage);
            request.setAttribute("searchCondition",searchCondition);
//            request.getRequestDispatcher(target).forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return target;
    }
    //查询一个商品
    @RequestMapping("/selectOne")
    public String selectOne(HttpServletRequest request,Integer pid,String target)
    {
        Properties properties = null;
        Properties_select properties_select =null;
        Products p= null;//查询出这个东西
        Categorys c = new Categorys();
        List<Properties> prop_list = new ArrayList<>();
//        List all_list=new ArrayList();//用来存储所有的数据
        Map<Properties,List<Properties_select>> map=new LinkedHashMap<>();
        try {
            p = productService.selectById(pid);//先查出这个商品
            c = categoryService.selectById(p.getCid());//再查出它的分类cid
            prop_list =  attributeService.getPropertiesByCid(c.getCid());//获取商品属性的集合
            for(Properties pp:prop_list){
                List<Properties_select> pro_selects = new ArrayList<>();
                Integer prp_id = pp.getPrp_id();//获取商品属性的选项
                pro_selects = properselectService.getPropertiesByPrp_id(prp_id);
                map.put(pp,pro_selects);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("target",target);
        request.setAttribute("product",p);
        request.setAttribute("all_map",map);
        return target;
    }
    @RequestMapping("/goManger")
    public String goManger(String target,Model m, @RequestParam(defaultValue = "") String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage)
    {
        List<Products> list=new ArrayList<>();
        Integer intOnsale= ProductDictionary.onsaleStrToInt(searchCondition);//根据查询条件获取上下架的状态
        System.out.println("查询条件为："+searchCondition);
        PageInfo pageInfo=new PageInfo(requestPage);
        Products p=new Products();//查询条件
        List<Categorys> lc_list=categoryService.selectByName(searchCondition);//按商品名字查询
        if (lc_list.size()!=0)//根据查询条件查看是不是有这个cid的商品
        {
            Categorys category = lc_list.get(0);
            p.setCid(lc_list.get(0).getCid());
        }
        int count=productService.getPageQueryByCount(p);//查询数量
        pageInfo.setTotalRecordCount(count);
        list=productService.getPageQuery(pageInfo,p,null);//查询集合
        for (Products product :list)
        {
            Categorys c=categoryService.selectById(product.getCid());
            product.setCname(c.getCname());
        }
        m.addAttribute("list",list);
        m.addAttribute("pageInfo",pageInfo);
        System.out.println(list);
        return target;
    }
    @RequestMapping("/getOneForUpdate")
    public String getOneForUpdate(Model m,@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1") Integer requestPage,Products p)
    {
        p=productService.selectOne(p);
        m.addAttribute("product",p);
        m.addAttribute("searchCondition",searchCondition);
        m.addAttribute("requestPage",requestPage);
        return "backend/product/updateProduct";
    }
    @RequestMapping("/updateProduct")
    public String updateProduct(Model m,@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1") Integer requestPage,Products p)
    {
        productService.updateProduct(p);
        return goManger("backend/product/productMain",m,searchCondition,requestPage);
    }
    @RequestMapping("/SelectOneForUpload")
    public String SelectOneForUpload(Model m,@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1") Integer requestPage,Products p)
    {
        p=productService.selectOne(p);
        m.addAttribute("product",p);
        m.addAttribute("searchCondition",searchCondition);
        m.addAttribute("requestPage",requestPage);
        return "backend/product/uploadProductImage";
    }
    @RequestMapping("/uploadImage")
    public String uploadImage(Model m,HttpServletRequest request,HttpServletResponse response)
    {

        String productListUploadPath = servletConfig.getServletContext().getRealPath("/img/productImage");
//       productListUploadPath=productListUploadPath.replace("\\","/");
        System.out.println("productListUploadPath=" + productListUploadPath);//获取页面上传的路径
        if(productListUploadPath==null||productListUploadPath.trim().equals("")){
            request.setAttribute("msg", "系统未指定上传路径");
        }else{
                productService.upload(request, productListUploadPath);
                request.setAttribute("msg", "上传图片成功");
        }
        return goManger("backend/product/productMain",m,"",1);
    }
    @RequestMapping("/delete")
    public String delete(Model m,String target,@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1") Integer requestPage,Products p)
    {
        productService.deleteById(p);
        return goManger(target,m,searchCondition,requestPage);
    }
    @RequestMapping("/add")
    public String add(Model m,Products p)
    {
        productService.add(p);
        return goManger("backend/product/productMain",m,"",1);
    }
    @RequestMapping("/upperOrLower")
    public String upperOrLower(String target,Model m,@RequestParam(defaultValue = "")String searchCondition,@RequestParam(defaultValue = "1")Integer requestPage,Products p)
    {
        productService.updateProduct(p);
        return goManger(target,m,searchCondition,requestPage);
    }
}
