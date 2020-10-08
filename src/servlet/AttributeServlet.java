package servlet;

import org.apache.commons.beanutils.BeanUtils;
import page.PageInfo;
import service.impl.AttributeServiceImpl;
import service.inner.AttributeService;
import vo.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(value ="/AttributeServlet")
public class AttributeServlet extends HttpServlet {
    private AttributeService as = new AttributeServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("您执行了" + action + "操作");
        if (action.equals("addAttribute")) {
            addAttribute(request, response);//添加商品属性
        } else if (action.equals("getAttribute")) {
            getAttribute(request, response);//查询商品属性
        }else if (action.equals("getPageByQuery")) {
            getPageByQuery(request, response);//查询商品属性分页
        }
        else if (action.equals("delete")) {
            delete(request, response);//删除商品属性
        }
        else if (action.equals("update")) {
            update(request, response);//更新商品属性
        }
        else if (action.equals("getOneForUpdate")) {
            getOneForUpdate(request, response);//更新商品属性
        }
    }
    public void getOneForUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String target = "";
        //一.填充数据
        String prp_id = request.getParameter("prp_id");

        //二.调用业务逻辑
        AttributeService attributeService = new AttributeServiceImpl();

        try {
            Properties properties = attributeService.getPropertiesById(prp_id);
            request.setAttribute("properties",properties);
            target = "/WEB-INF/jsp/admin/product/updateProperties.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "查询商品属性失败");
            target = "/WEB-INF/jsp/msg.jsp";
        }

        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("在update里面");
        String target = "";
        String cid = request.getParameter("cid");
        String pname = request.getParameter("pname");
        //一.填充数据
        Properties properties = new Properties();

        Map<String, String[]> propertiesMap = request.getParameterMap();
        try {
            BeanUtils.populate(properties,propertiesMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //二.调用业务逻辑
        AttributeService attributeService = new AttributeServiceImpl();
        try {
            System.out.println(properties);
            attributeService.update(properties);
            request.setAttribute("msg", "修改商品属性成功");
            //0.8 搜索功能
            getPageByQuery(request, response);
        } catch (Exception e) {
            request.setAttribute("msg", "修改商品属性失败");
            e.printStackTrace();
            target = "/WEB-INF/jsp/msg.jsp";


        }

    }
    private void delete(HttpServletRequest request, HttpServletResponse response) {
        String target = "";
        //一.填充数据
        String prp_id = request.getParameter("prp_id");
        //二、调用业务逻辑
        AttributeService attributeService = new AttributeServiceImpl();
        try {
            attributeService.delete(Integer.parseInt(prp_id));
            this.getPageByQuery(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //查询所有商品属性
    public void getAttribute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in Attributd.getAttribute!!");
        String target = request.getParameter("target");
        //一.填充数据
        String requestPage = request.getParameter("requestPage");
        //二.调用业务逻辑

        //第1步:
        PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
        Properties p=new Properties();
        AttributeService service2 = new AttributeServiceImpl();
        try {
            int totalRecordCount = as.getTotalRecordCount(p);
            //第2步: 给pageInfo对象设置总共有多少条记录
            pageInfo.setTotalRecordCount(totalRecordCount);
            //第3步: 调用getAllByPage 查所有然后分页
            List<Properties> list = service2.getAllByPage(pageInfo);
            System.out.println("list="+list);
            request.setAttribute("list", list);
            request.setAttribute("pageInfo", pageInfo);

        } catch (Exception e) {
            e.printStackTrace();
            target = "/WEB-INF/jsp/msg.jsp";
            request.setAttribute("msg","查询商品属性失败");
        }

        //3.转发视图
        request.getRequestDispatcher("/WEB-INF/jsp"+target+".jsp").forward(request, response);
    }
    //添加商品属性功能
    private void addAttribute(HttpServletRequest request, HttpServletResponse response) {
        String target = request.getParameter("target");
        String cid = request.getParameter("cid");
        String list[] =request.getParameterValues("attribute");
        int i = list.length;
        for(int j=0;j<=i;j++){
            try {

                int result = as.addAttribute(Integer.parseInt(cid),list[j]);
                if(result>=1){
                    System.out.println("添加商品属性成功");
                    request.getRequestDispatcher("/WEB-INF/jsp"+target+".jsp").forward(request,response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
    //分页查询商品属性
    public void getPageByQuery(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String target = "";
        //1.填充数据
        String requestPage = request.getParameter("requestPage");
        if(requestPage==null){
            requestPage = "1";
        }
        String searchCondition = request.getParameter("searchCondition");

        Properties properties = new Properties();

        if(searchCondition!=null&&!searchCondition.trim().equals("")){
            //searchCondition
            properties.setCid(Integer.parseInt(searchCondition));
            properties.setPrp_id(Integer.parseInt(searchCondition));
        }
        try {

            PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));

            //根据查询条件  查询一共多少条记录


            int totalRecordCount = as.getTotalRecordCount(properties);
            System.out.println("一共有"+totalRecordCount+"条记录");
            pageInfo.setTotalRecordCount(totalRecordCount);

            //2.调用业务逻辑
            AttributeService service2 = new AttributeServiceImpl();
            List<Properties> list = service2.getPageByQuery(properties, pageInfo);
            request.setAttribute("list", list);
            request.setAttribute("searchCondition", searchCondition);
            request.setAttribute("pageInfo", pageInfo);
            target = "/WEB-INF/jsp/admin/product/getAttribute.jsp";

        } catch (Exception e) {
            request.setAttribute("msg", e.getMessage());
            e.printStackTrace();
            target = "/WEB-INF/jsp/msg.jsp";
        }
        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);

    }
}
