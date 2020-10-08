package service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import service.inner.JavaMailService;

public class JavaMailServiceImpl implements JavaMailService{

    private String mailHost = "smtp.qq.com";//163 smtp服务器地址 如果使用其他邮箱 填对应邮箱的smtp服务器地址
    private String mailPort = "25";//smtp服务器的端口号 一般都为25
    private String username = "1029589750@qq.com";// 发送方邮箱地址
    private String password = "izdbfsyzxwrobcee";//这里填发送方邮箱的授权码 注意不是邮箱的密码

    private Properties props = new Properties();
    @Override
    public boolean sendTextMail(String from, String to, String subject,
                                String content) {

        boolean flag = true;

        //设置一下javaMail 需要的基本配置信息
        props.put("mail.smtp.host", mailHost);
        // 如果设置,指定实现javax.net.SocketFactory接口的类的名称,这个类将被用于创建SMTP的套接字
        //props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        // 如果设置为true,未能创建一个套接字使用指定的套接字工厂类将导致使用java.net.Socket创建的套接字类。默认值为true。
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", mailPort);
        props.setProperty("mail.smtp.socketFactory.port", mailPort);
        props.setProperty("mail.smtp.auth", "true");


        try {
            Message message = getMessage(from,to,subject,content);
            Transport.send(message);
        } catch (AddressException e) {
            flag = false;
            e.printStackTrace();
        } catch (MessagingException e) {
            flag = false;
            e.printStackTrace();
        }

        return flag;
    }

    public Message getMessage(String from, String to, String subject,
                              String content) throws AddressException, MessagingException{
        Message message = null;

        //建立一个 邮件客户端  和  smtp服务器之间的会话
        Session session = Session.getDefaultInstance(props,
                new Authenticator(){

                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication(username,password);
                    }


                });

        message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(content);

        return message;
    }

    public static void main(String[] args) {
        JavaMailServiceImpl service = new JavaMailServiceImpl();

        String content = "请把下面的url粘贴到 地址栏中 即可激活用户!!! http://localhost:8080/jd/UserServlet?action=active&username=zzy";
        String subject = "京东商城用户账号激活";
        //(from, to, subject, content)
        service.sendTextMail("1029589750@qq.com", "1029589750@qq.com", subject, content);
    }
}
