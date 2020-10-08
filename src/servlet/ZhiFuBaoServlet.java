package servlet;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.google.gson.Gson;
import util.AlipayConfig;
import vo.Products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//支付宝支付
@WebServlet("/ZhiFuBaoServlet")
public class ZhiFuBaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action=request.getParameter("action");
        if ("toPay".equals(action))
        {
            toPay(request,response);
        }
    }

    public String toPay(HttpServletRequest request, HttpServletResponse response) {
        String subject= request.getParameter("subject");
        String total_amount=request.getParameter("total_amount");
        String no_id=request.getParameter("out_trade_no");//获取订单编号
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数,并把配置类中的两个路径设置进去
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //根据pid获取购物车中的
        //如果想正常调用接口则需要传一些必要参数,out_trade_no:订单号,保证唯一性,支付宝根据该参数生成你的支付单号,total_amount:需要支付的金额,注意是String型,且金额计数的分割","不能存在(例如1,000就是错误的参数),subject:对物品进行描述,product_code:是支付类型.更多详细的参数信息参考链接: [https://docs.open.alipay.com/api_1/alipay.trade.page.pay](https://docs.open.alipay.com/api_1/alipay.trade.page.pay)
        try {
            alipayRequest.setBizContent("{\"out_trade_no\":\"" + no_id + "\","
                    + "\"total_amount\":\"" + Double.parseDouble(total_amount) + "\","
                    + "\"timeout_express\":\"90m\","//这个是设置超时时间
                    + "\"subject\":\"" + subject + "\","
                    + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
            //请求
//            request.getSession().setAttribute("pids",pids);//把这个东西先存进来先
            String result;
            //发送请求并返回
            result = alipayClient.pageExecute(alipayRequest).getBody();
            //System.out.println("*********************\n返回结果为："+result);
            response.setContentType("text/html;charset=UTF-8");
            response.setCharacterEncoding("utf-8");
            PrintWriter pw=response.getWriter();
            pw.write(result);
            pw.flush();
            pw.close();
            return null;
//            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
