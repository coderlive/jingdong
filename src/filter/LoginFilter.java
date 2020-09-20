package filter;

import vo.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(urlPatterns = {"/JDDispatcherServlet/*","/WEB-INF/jsp/*","/CategoryServlet/*"})//拦截这个页面下的所有东西
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
//        System.out.println("拦截的路径是"+request.getRequestURL());
        Users u = (Users) request.getSession().getAttribute("user");
//        System.out.println(u);
        if (u==null)
        {
//            response.sendRedirect("/HelloWorld/jsp/login.jsp");
            response.getWriter().write("<script>window.top.location='jsp/login.jsp'</script>");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
