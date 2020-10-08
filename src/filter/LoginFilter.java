package filter;

import vo.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(urlPatterns = {"/ProductServlet/*","/ShoppingCartServlet/*","/OrderServlet/*","/WEB-INF/jsp/*"})//拦截这个页面下的所有东西
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        if ("salesVolume".equals(request.getParameter("action")))
        {
            filterChain.doFilter(servletRequest, servletResponse);
            return;//如果是订单销售页面的话就不拦截直接跳过
        }
        System.out.println("拦截的路径是"+request.getRequestURL());
        Users u = (Users) request.getSession().getAttribute("frontuser");//拦截前台页面
        System.out.println(u);
        if (u==null)
        {
//            response.sendRedirect("/HelloWorld/jsp/login.jsp");
            response.getWriter().write("<script>window.top.location='JDDispatcherServlet?target=admin/user/frontLogin.jsp'</script>");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
