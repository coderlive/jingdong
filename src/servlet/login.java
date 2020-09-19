package servlet;

import service.impl.UserServiceImpl;
import service.inner.UserService;
import util.PreventSQLInjectionUtil;
import vo.Users;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/login")
public class login extends HttpServlet {

    private  UserService us=new UserServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        System.out.println("您执行了"+action+"操作");
        if (action.equals("LoginIn"))
        {
            LoginIn(request,response);
        }else if (action.equals("LoginOut"))
        {
            LoginOut(request,response);
        }
    }
    protected void LoginIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        System.out.println("用户的名字"+username);
        System.out.println("用户的密码"+password);
        String sql="select * from users where username='"+username+"' and password='"+password+"'";
        boolean isValie= PreventSQLInjectionUtil.isValid(username)||PreventSQLInjectionUtil.isValid(password);
        try {
            if (isValie) {
                List list = us.getPageByQuery(sql, Users.class);
                if (list.size() > 0) {
                    request.getSession().setAttribute("user",list.get(0));
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
//        response.sendRedirect("jsp/login.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
