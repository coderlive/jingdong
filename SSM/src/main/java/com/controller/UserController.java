package com.controller;

import com.google.gson.Gson;
import com.page.PageInfo;
import com.service.inner.UserService;
import com.util.PreventSQLInjectionUtil;
import com.util.UsersActiveDictionary;
import com.util.UsersDictionary;
import com.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    //后台登录
    @RequestMapping("/backendLogin")
    public String backendLogin(Users u, HttpSession session)
    {
        List<Users> list=userService.selectByUsernameAndPassword(u);
        if (list.size() > 0) {
            session.setAttribute("backuser",list.get(0));//存储后台登录的角色
            return "/backend/index";
        }

        return "redirect:/login.jsp";
    }
    //获取所有的用户，分页获取
    @RequestMapping("/getPageByQuery")
    public String getPageByQuery(String target, String searchCondition, String perPageRecordCount, Integer requestPage, HttpServletRequest request, HttpServletResponse response)
    {
        List<Users> list = new ArrayList<>();
        //下面这个是设置分页的个数的,一页8个
        Integer intLock= UsersDictionary.lockStrToInt(searchCondition);//根据查询条件获取禁用解锁的状态
        Integer intActive= UsersActiveDictionary.activeStrToInt(searchCondition);//根据查询条件获取用户激活的状态
        Users users = new Users();

        System.out.println("查询条件为："+searchCondition);

        PageInfo pageInfo=new PageInfo(requestPage);
        if (perPageRecordCount!=null)
        {
            pageInfo.setPerPageRecordCount(Integer.parseInt(perPageRecordCount));
        }
        if(searchCondition!=null&&!searchCondition.trim().equals("")){

            users.setUsername(searchCondition);
            if (searchCondition.matches("[0-9]+"))
            {
                users.setUserid(Integer.parseInt(searchCondition));
            }
        }
        users.setActive(intActive);
        users.setUenable(intLock);

        try {
            int count=userService.getPageQueryByCount(users);//根据查询的条件查询总共有多少个用户数
            pageInfo.setTotalRecordCount(count);
            list=userService.getPageQuery(pageInfo,users);

            System.out.println(list);
            request.setAttribute("list",list);
            request.setAttribute("pageInfo",pageInfo);
            request.setAttribute("requestPage",requestPage);
            request.setAttribute("searchCondition",searchCondition);

        } catch (Exception e) {
            e.printStackTrace();
        }
            return target;
    }
    @RequestMapping("/updateActive")
    public String  updateActive(String target,Users u,String searchCondition,Integer requestPage,HttpServletRequest request,HttpServletResponse response)
    {
        userService.updateActive(u);
        return  getPageByQuery(target,searchCondition,null,requestPage,request,response);
    }
    @RequestMapping("/frontCheckLogin")
    public void frontCheckLogin(HttpServletRequest request,HttpServletResponse response,String username,String password)
    {
        Gson gson=new Gson();
        //在user表查询用户名和密码
        String sql = "select * from users where username ='"+username+"' and password ='"+password+"' and uenable=0 and active=1";
        //正则表达式防止sql注入验证用户名和密码
        response.setContentType("application/json");
        PrintWriter pw= null;
        try {
            pw = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        boolean isValid = PreventSQLInjectionUtil.isValid(username) || PreventSQLInjectionUtil.isValid(password);
        try {
            if (isValid) {
                List list = userService.selectUserBySql(sql);
                if (list.size()>0) {
                    request.getSession().setAttribute("frontuser",list.get(0));
                    pw.write(gson.toJson("true"));
//                    request.getRequestDispatcher("CategoryServlet?action=goJdIndex&target=/user/welcome&clevel=1").forward(request,response);
                }else {
//                    Users u=new Users();
//                    u.setPassword(password);
//                    list.add(u);
                    pw.write(gson.toJson("false"));

                }
            }
            pw.flush();
            pw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/frontLockUser")
    public void frontLockUser(String username,HttpServletResponse response)
    {
        //获取登录失败3次后用户的用户名和密码
        userService.lockUser(username);

        Gson gson = new Gson();
        response.setContentType("application/json;charset=utf-8");
        PrintWriter pw= null;
        try {
            pw = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        pw.write(gson.toJson("失败次数过多,账户已被禁用"));
        pw.flush();
        pw.close();
    }
    @RequestMapping("/frontLoginOut")
    public String frontLoginOut(HttpSession session)
    {
        session.setAttribute("frontuser",null);
        return "frontpage/user/frontLogin";
    }
    @RequestMapping("/sendEmail")
    public void sendEmail(String email,HttpServletRequest request,HttpServletResponse response)
    {
        String code=userService.sendEmail(email);
        request.getSession().setAttribute("code",code);
        response.setContentType("application/json");
        try {
            PrintWriter pw=response.getWriter();
            pw.write("true");
            pw.flush();
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/checkCode")
    public void checkCode(String code,HttpServletRequest request,HttpServletResponse response)
    {
        String sessionCode= (String) request.getSession().getAttribute("code");
        Gson gson=new Gson();
        PrintWriter pw= null;
        response.setContentType("application/json");
        try {
            pw = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (sessionCode!=null&&sessionCode.equals(code))
        {
            pw.write(gson.toJson("true"));
            request.getSession().setAttribute("code",null);
        }else{
            pw.write(gson.toJson("false"));
        }
        pw.flush();
        pw.close();
    }
    @RequestMapping("/registerUser")
    public String registerUser(Users u)
    {
        userService.registerUser(u);
        return "frontpage/user/frontLogin";
    }
}
