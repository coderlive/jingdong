package servlet;

import com.google.gson.Gson;
import page.PageInfo;
import service.impl.JavaMailServiceImpl;
import service.impl.UserServiceImpl;
import service.inner.UserService;
import util.AlipayConfig;
import util.PreventSQLInjectionUtil;
import util.UsersActiveDictionary;
import util.UsersDictionary;
import vo.Users;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/login")
public class login extends HttpServlet {

    private  UserService us=new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
//        System.out.println("您执行了"+action+"操作");
        if (action.equals("LoginIn"))
        {
            LoginIn(request,response);
        }else if (action.equals("LoginOut"))
        {
            LoginOut(request,response);
        }else if(action.equals("frontLogin"))//frontuser这个是检测前台登录的界面的
        {
            frontLogin(request,response);
        }else if(action.equals("frontLoginOut"))
        {
            frontLoginOut(request,response);
        }else if(action.equals("sendEmail"))//这个是发送邮箱注册的信息
        {
            sendEmail(request,response);
        }else if(action.equals("checkCode"))
        {
            checkCode(request,response);
        }else if(action.equals("addUser"))
        {
            addUser(request,response);
        }else if (action.equals("getPageByQuery")) {
            getPageByQuery(request,response);
        }else if (action.equals("upperOrLower")) {
            upperOrLower(request,response);
        }else if (action.equals("updateActive")) {
            updateActive(request,response);
        }else if (action.equals("getAllByPage")) {
            getAllByPage(request,response);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        Users u=new Users();
        u.setMail(email);
        u.setUsername(username);
        u.setPassword(password);
        try {
            us.add(u);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            request.getRequestDispatcher("JDDispatcherServlet?target=admin/user/frontLogin.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void checkCode(HttpServletRequest request, HttpServletResponse response) {
        String resCode=request.getParameter("code");
        String code= (String) request.getSession().getAttribute("code");
        Gson gson=new Gson();
        PrintWriter pw= null;
        response.setContentType("application/json");
        try {
            pw = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (resCode.equals(code))
        {
            pw.write(gson.toJson("true"));
        }else{
            pw.write(gson.toJson("false"));
        }
        pw.flush();
        pw.close();
    }

    private void sendEmail(HttpServletRequest request, HttpServletResponse response) {
            String email=request.getParameter("email");
        JavaMailServiceImpl jms=new JavaMailServiceImpl();
        String subject="京东商城注册";
        String code= String.valueOf(AlipayConfig.getNumber(6));
        request.getSession().setAttribute("code",code);
        code="欢迎注册京东商城账户，您的验证码为:"+code+"，请谨慎保管好您的验证码，不要告诉其他人";
        jms.sendTextMail("1029589750@qq.com", email, subject, code);
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

    private void frontLogin(HttpServletRequest request, HttpServletResponse response) {
        //获取用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //在user表查询用户名和密码
        String sql = "select * from users where username ='"+username+"' and password ='"+password+"'  and uenable=0 and active=1";
        //正则表达式防止sql注入验证用户名和密码
        boolean isValid = PreventSQLInjectionUtil.isValid(username) || PreventSQLInjectionUtil.isValid(password);
        try {
            if (isValid) {
                List list = us.getPageByQuery(sql,Users.class);
                if (list.size()>0) {
                    request.getSession().setAttribute("frontuser",list.get(0));
                    request.getRequestDispatcher("WEB-INF/jsp/admin/user/welcome.jsp").forward(request,response);
                    return;
                }
                else {
                    request.getRequestDispatcher("WEB-INF/jsp/admin/user/frontLogin.jsp").forward(request,response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //这个是前台的退出功能
    protected void frontLoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("frontuser",null);
//        request.getRequestDispatcher("jsp/login.jsp").forward(request,response);
        request.getRequestDispatcher("WEB-INF/jsp/user/frontLogin.jsp").forward(request,response);
    }

    protected void LoginIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
//        System.out.println("用户的名字"+username);
//        System.out.println("用户的密码"+password);
        String sql="select * from users where username='"+username+"' and password='"+password+"' and uenable=0 and active=1";
        boolean isValie= PreventSQLInjectionUtil.isValid(username)||PreventSQLInjectionUtil.isValid(password);
        try {
            if (isValie) {
                List list = us.getPageByQuery(sql, Users.class);
                if (list.size() > 0) {
                    request.getSession().setAttribute("backuser",list.get(0));//存储后台登录的角色
                    request.getRequestDispatcher("WEB-INF/jsp/index.jsp").forward(request, response);
                    return;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("jsp/login.jsp").forward(request,response);
    }
    protected void LoginOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("user",null);
//        request.getRequestDispatcher("jsp/login.jsp").forward(request,response);
        response.sendRedirect("jsp/login.jsp");
    }

    private void upperOrLower(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updowm=request.getParameter("updowm");
        String userid=request.getParameter("userid");
        Integer action=Integer.parseInt(updowm);//1表示禁用,0表示解锁
        int count=us.upperOrLower(action,userid);//更新用户禁用状态
        getPageByQuery(request,response);
    }

    private void updateActive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isActive=request.getParameter("isActive");
        String userid=request.getParameter("userid");
        Integer action=Integer.parseInt(isActive);//1表示激活,0表示未激活
        int count=us.updateActive(action,userid);//更新用户激活状态
        getPageByQuery(request,response);
    }

    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> list = new ArrayList<>();
        String searchCondition=request.getParameter("searchCondition");
        String target=request.getParameter("target");
        //下面这个是设置分页的个数的,一页8个
        String perPageRecordCount=request.getParameter("perPageRecordCount");

        Integer intLock= UsersDictionary.lockStrToInt(searchCondition);//根据查询条件获取禁用解锁的状态
        Integer intActive= UsersActiveDictionary.activeStrToInt(searchCondition);//根据查询条件获取用户激活的状态
        if (searchCondition==null)
            searchCondition="";
        System.out.println("查询条件为："+searchCondition);
        String Page=request.getParameter("requestPage");
        int requestPage;
        if (Page==null) {
            requestPage= 1;
        }else {
            requestPage=Integer.parseInt(Page);
        }
        PageInfo pageInfo=new PageInfo(requestPage);
        if (perPageRecordCount!=null)
        {
            pageInfo.setPerPageRecordCount(Integer.parseInt(perPageRecordCount));
        }
        Users users = new Users();

        users.setUsername(searchCondition);
        users.setActive(intActive);
        users.setUenable(intLock);

        try {
            int count=us.getPageQueryByCount(users);
            pageInfo.setTotalRecordCount(count);
            list=us.getPageQuery(pageInfo,users);

            System.out.println(list);
            target="WEB-INF/jsp"+target+".jsp";
            request.setAttribute("list",list);
            if(list.size()!=0)
            {
                request.setAttribute("users",list.get(0));//把第一个放进去好算一点
            }
            request.setAttribute("pageInfo",pageInfo);
            request.setAttribute("requestPage",requestPage);
            request.setAttribute("searchCondition",searchCondition);
            request.getRequestDispatcher(target).forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    //查所有并分页
    protected void getAllByPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String target=request.getParameter("target");
        //一.填充数据
        String requestPage = request.getParameter("requestPage");
        //二.调用业务逻辑

        //第1步:
        PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
        try {
            int totalRecordCount = us.getTotalRecordCount();
            //第2步: 给pageInfo对象设置总共有多少条记录
            pageInfo.setTotalRecordCount(totalRecordCount);
            //第3步: 调用getAllByPage 查所有然后分页
            List<Users> list = us.getAllByPage(pageInfo);
            request.setAttribute("list", list);
            request.setAttribute("pageInfo", pageInfo);
            target="/WEB-INF/jsp/admin"+target+".jsp";
        } catch (Exception e) {
            e.printStackTrace();
            target = "/WEB-INF/msg.jsp";

        }

        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


}
