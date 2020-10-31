package com.controller;

import com.page.PageInfo;
import com.service.inner.AttributeService;
import com.vo.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/attribute")
public class AttributeController {
    @Autowired
    private AttributeService attributeService;
    @RequestMapping("/addAttribute")
    public String addAttribute(Integer cid,String [] attributes)
    {
       for (String s :attributes)
       {
           if (s!=null&&!"".equals(s)) {
               Properties p = new Properties();
               p.setCid(cid);
               p.setPname(s);
               attributeService.addAttribute(p);
           }
       }
        return "/backend/product/productMainAttribute";
    }
    @RequestMapping("/getAttribute")
    public String getAttribute(@RequestParam(defaultValue = "1") Integer requestPage, HttpServletRequest request,String searchCondition )
    {
        System.out.println("in Attributd.getAttribute!!");
        //一.填充数据
        //第1步:
        PageInfo pageInfo = new PageInfo(requestPage);
        Properties p=new Properties();
        if(searchCondition!=null&&!searchCondition.trim().equals("")){
            //searchCondition
            p.setCid(Integer.parseInt(searchCondition));
            p.setPrp_id(Integer.parseInt(searchCondition));
        }
        try {
            int totalRecordCount = attributeService.getTotalRecordCount(p);
            //第2步: 给pageInfo对象设置总共有多少条记录
            pageInfo.setTotalRecordCount(totalRecordCount);
            //第3步: 调用getAllByPage 查所有然后分页
            List<Properties> list = attributeService.getAllByPage(pageInfo,p);
            System.out.println("list="+list);
            request.setAttribute("list", list);
            request.setAttribute("pageInfo", pageInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/backend/product/getAttribute";
    }
    @RequestMapping("/delete")
    public String deletePropertiesById(@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1")Integer requestPage,Properties p,HttpServletRequest request)
    {
        attributeService.deletePropertiesById(p);
        return getAttribute(requestPage,request,searchCondition);
    }
    @RequestMapping("/getOneForUpdate")
    public String getOneForUpdate(Model m, String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage, Properties p)
    {
        p=attributeService.selectOne(p);
        m.addAttribute("properties",p);
        m.addAttribute("searchCondition",searchCondition);
        m.addAttribute("requestPage",requestPage);
        return "backend/product/updateProperties";
    }
    @RequestMapping("/update")
    public String update(HttpServletRequest request,String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage,Properties p)
    {
        attributeService.update(p);
        return getAttribute(requestPage,request,searchCondition);
    }

}
