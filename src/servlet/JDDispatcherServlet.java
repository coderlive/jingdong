package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "JDDispatcherServlet",urlPatterns = "/JDDispatcherServlet")
public class JDDispatcherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prefix="/WEB-INF/jsp/";
        String target=  request.getParameter("target");
        request.getRequestDispatcher(prefix+target).forward(request,response);
    }
}
