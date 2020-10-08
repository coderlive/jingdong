package servlet;

import org.apache.commons.beanutils.BeanUtils;
import page.PageInfo;
import service.impl.ProperselectServiceImpl;
import service.inner.ProperselectService;
import vo.Properties;
import vo.Properties_select;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet(value= "/Properties_selectServlet")
public class Properties_selectServlet extends HttpServlet {
    public ProperselectService properselectService = new ProperselectServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("您执行了" + action + "操作");
        if (action.equals("add")) {
            add(request, response);//添加商品属性内容
        }else if(action.equals("getPropertiesvalues"))  {
            getPropertiesvalues(request,response);
        }else if (action.equals("getPageByQuery")) {
            getPageByQuery(request, response);//查询商品属性分页
        }
        else if (action.equals("delete")) {
            delete(request, response);
        }
        else if (action.equals("getOneForUpdate")) {
            getOneForUpdate(request, response);
        }
        else if (action.equals("update")) {
            update(request, response);
        }
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = request.getParameter("target");
        String pid = request.getParameter("pid");
        String list[] = request.getParameterValues("pvalues");
        int i = list.length;
        for(int j=0;j<=i;j++){
            try {
                int result = properselectService.add(Integer.parseInt(pid),list[j]);
                if(result>=1){
                    System.out.println("添加属性值成功");
                    request.getRequestDispatcher("/WEB-INF/jsp"+target+".jsp").forward(request,response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
    protected void getPropertiesvalues(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("in getPropertiesvalues!!");
        String target = request.getParameter("target");
        //一.填充数据
        String requestPage = request.getParameter("requestPage");
        //二.调用业务逻辑

        //第1步:
        PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
        Properties_select properties_select=new Properties_select();

        try {
            int totalRecordCount = properselectService.getTotalRecordCount(properties_select);
            //第2步: 给pageInfo对象设置总共有多少条记录
            pageInfo.setTotalRecordCount(totalRecordCount);
            //第3步: 调用getAllByPage 查所有然后分页
            List<Properties_select> list = properselectService.getAllByPage(pageInfo);
            System.out.println("list="+list);
            request.setAttribute("list", list);
            request.setAttribute("pageInfo", pageInfo);

        } catch (Exception e) {
            e.printStackTrace();
            target = "/WEB-INF/jsp/msg.jsp";
            request.setAttribute("msg","查询商品属性失败");
        }

        //3.转发视图
        request.getRequestDispatcher("/WEB-INF/jsp"+target+".jsp").forward(request, response);

    }
    protected void getPageByQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        String searchCondition = null;
        //1.填充数据
        String requestPage = request.getParameter("requestPage");
        if(requestPage==null){
            requestPage = "1";
        }
        searchCondition = request.getParameter("searchCondition");

        Properties_select properties_select = new Properties_select();

        if(searchCondition!=null&&!searchCondition.trim().equals("")){
            //searchCondition
            properties_select.setPid(Integer.parseInt(searchCondition));
            properties_select.setPsid(Integer.parseInt(searchCondition));
        }
        try {

            PageInfo pageInfo = new PageInfo(Integer.parseInt(requestPage));
            //根据查询条件  查询一共多少条记录
            int totalRecordCount = properselectService.getTotalRecordCount(properties_select);
            System.out.println("一共有"+totalRecordCount+"条记录");
            pageInfo.setTotalRecordCount(totalRecordCount);

            //2.调用业务逻辑
            ProperselectService service2 = new ProperselectServiceImpl();
            List<Properties_select> list = service2.getPageByQuery(properties_select, pageInfo);
            request.setAttribute("list", list);
            request.setAttribute("searchCondition", searchCondition);
            request.setAttribute("pageInfo", pageInfo);
            target = "/WEB-INF/jsp/admin/product/getPropertiesvalues.jsp";
//            List<Properties_select> list = properselectService.getPageByQuery(properties_select, pageInfo);
//            request.setAttribute("list", list);
//            request.setAttribute("searchCondition", searchCondition);
//            request.setAttribute("pageInfo", pageInfo);
//            target = "/WEB-INF/jsp/admin/product/getPropertiesvalues.jsp";

        } catch (Exception e) {
            request.setAttribute("msg", e.getMessage());
            e.printStackTrace();
            target = "/WEB-INF/jsp/msg.jsp";
        }
        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);


    }
    protected void getOneForUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        //一.填充数据
        String psid = request.getParameter("psid");

        //二.调用业务逻辑
        try {
            Properties_select properties_select = properselectService.getPropertiesById(psid);
            request.setAttribute("properties_select",properties_select);
            target = "/WEB-INF/jsp/admin/product/updateProperties_select.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "查询商品属性失败");
            target = "/WEB-INF/jsp/msg.jsp";
        }

        //3.转发视图
        request.getRequestDispatcher(target).forward(request, response);
    }
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String target = "";
        //一.填充数据
        String psid = request.getParameter("psid");
        //二、调用业务逻辑

        try {
            properselectService.delete(Integer.parseInt(psid));
            this.getPageByQuery(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("在update里面");
        String target = "";
        String pid = request.getParameter("pid");
        String psname = request.getParameter("psname");
        //一.填充数据
        Properties_select properties_select = new Properties_select();

        Map<String, String[]> properties_selectMap = request.getParameterMap();
        try {
            BeanUtils.populate(properties_select,properties_selectMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //二.调用业务逻辑

        try {
            System.out.println(properties_select);
            properselectService.update(properties_select);
            request.setAttribute("msg", "修改商品属性值成功");
            //0.8 搜索功能
            this.getPageByQuery(request,response);
        } catch (Exception e) {
            request.setAttribute("msg", "修改商品属性值失败");
            e.printStackTrace();

        }



    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
