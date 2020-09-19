package filter;

import vo.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//@WebFilter(urlPatterns = {"/WEB-INF/jsp/*","/CategoryServlet"})//拦截这个页面下的所有东西
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("是否拦截到");
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
//        System.out.println("过滤器里的action"+action);
        filterChain.doFilter(servletRequest, servletResponse);
        //在请求之后拦截，获取用户，如果用户存在就跳转，如果用户不存在就跳到登录页面
            HttpSession session=request.getSession();
            Users u = session==null?null: (Users) session.getAttribute("user");
            if (u == null)//用户名存在
            {
            request.getRequestDispatcher("/jsp/login.jsp").forward(servletRequest,servletResponse);
//                response.sendRedirect("login.jsp");
            }
    }

    @Override
    public void destroy() {

    }
}
