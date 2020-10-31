package com.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.page.PageInfo;
import com.service.inner.CategoryService;


import com.vo.Categorys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController  {
    @Autowired
    private CategoryService categoryService;
    @RequestMapping("/selectAll")
    @ResponseBody
    public String test(ModelAndView mv)
    {

        return "what thefuck";
    }
    @RequestMapping("/getLevelCategory")
    @ResponseBody
    public List<Categorys> getLevelCategory(Integer cparent)
    {
        List<Categorys> list= categoryService.getLevelCategory(cparent);
        return list;
    }
    @PostMapping("/selectLevelByGroup")
    @ResponseBody
    public List<Categorys> selectLevelByGroup(String cparentArr)
    {
        ArrayList<String> arr=null;
        ObjectMapper mapper = new ObjectMapper();
        try {
            arr = (ArrayList<String>) mapper.readValue(cparentArr,new TypeReference<List<String>>() { });
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return categoryService.selectLevelByGroup(arr);
    }
    @RequestMapping("/getPageByQuery")//分类查询商品种类
    public String getPageByQuery(Model m, @RequestParam(defaultValue = "1") Integer requestPage, @RequestParam(defaultValue = "1") Integer clevel, String target, String searchCondition )
    {
        if (searchCondition==null)
            searchCondition="";
        System.out.println("查询条件为："+searchCondition);
        List<Categorys> list=new ArrayList<>();
        PageInfo pageInfo=new PageInfo(requestPage);
        Categorys c=new Categorys();
        c.setCname(searchCondition);
        c.setCdesc(searchCondition);
        c.setClevel(clevel);
        int count=categoryService.getPageQueryByCount(c);
        pageInfo.setTotalRecordCount(count);
        list=categoryService.getPageQuery(pageInfo,c);
        m.addAttribute("list",list);
        m.addAttribute("pageInfo",pageInfo);
        m.addAttribute("searchCondition",searchCondition);
        m.addAttribute("clevel",clevel);
        return target;
    }
    @RequestMapping("/addCategory")
    public String addCategory(Categorys c,Model m)
    {
        categoryService.addCategory(c);
        return getPageByQuery(m,1,c.getClevel(),"backend/category/categoryMain","");
    }
    @RequestMapping("/deleteById")
    public String deleteById(Categorys c,Model m)
    {
        categoryService.deleteById(c);
        return getPageByQuery(m,1,c.getClevel(),"backend/category/categoryMain","");
    }
    @RequestMapping("/updateCategory")
    public String updateCategory(Categorys c,@RequestParam(defaultValue = "1") Integer requestPage,Model m)
    {
        categoryService.updateCategory(c);
        return getPageByQuery(m,requestPage,c.getClevel(),"backend/category/categoryMain","");
    }
}
