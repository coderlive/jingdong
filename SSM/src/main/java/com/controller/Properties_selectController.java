package com.controller;

import com.page.PageInfo;
import com.service.inner.ProperselectService;
import com.vo.Properties_select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/properties_select")
public class Properties_selectController {
    @Autowired
    private ProperselectService properselectService;
    @RequestMapping("/add")
    public String add(Integer pid,String [] pvalues)
    {
        for (String s :pvalues)
        {
            if (s!=null&&!"".equals(s)) {
                Properties_select p = new Properties_select();
                p.setPid(pid);
                p.setPsname(s);
                properselectService.addAttribute(p);
            }
        }
        return "backend/product/Properties_selectMain";
    }
    @RequestMapping("/getPropertiesvalues")
    public String getPropertiesvalues(@RequestParam(defaultValue = "1") Integer requestPage, Model m,String searchCondition)
    {
        System.out.println("in Attributd.getAttribute!!");
        //一.填充数据
        //第1步:
        PageInfo pageInfo = new PageInfo(requestPage);
        Properties_select p=new Properties_select();
        if(searchCondition!=null&&!searchCondition.trim().equals("")){
            //searchCondition
            p.setPid(Integer.parseInt(searchCondition));
            p.setPsid(Integer.parseInt(searchCondition));
        }
        int totalRecordCount = properselectService.getTotalRecordCount(p);
        //第2步: 给pageInfo对象设置总共有多少条记录
        pageInfo.setTotalRecordCount(totalRecordCount);
        //第3步: 调用getAllByPage 查所有然后分页
        List<Properties_select> list = properselectService.getAllByPage(p,pageInfo);
        System.out.println("list="+list);
        m.addAttribute("list", list);
        m.addAttribute("pageInfo", pageInfo);
        return "backend/product/showPropertiesvalues";
    }
    @RequestMapping("/delete")
    public String delete(Model m,@RequestParam(defaultValue = "") String searchCondition,@RequestParam(defaultValue = "1")Integer requestPage,Properties_select ps )
    {
        properselectService.delete(ps);
        return getPropertiesvalues(requestPage,m,searchCondition);
    }
    @RequestMapping("/getOneForUpdate")
    public String getOneForUpdate(Model m, String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage, Properties_select ps)
    {

            Properties_select properties_select = properselectService.getPropertiesById(ps);
            m.addAttribute("properties_select",properties_select);
        return "backend/product/updateProperties_select";
    }
    @RequestMapping("/update")
    public String update(Model m,String searchCondition, @RequestParam(defaultValue = "1") Integer requestPage,Properties_select ps)
    {
        properselectService.update(ps);
        return getPropertiesvalues(requestPage,m,searchCondition);
    }
}
