package dao.impl;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

public class JavaMailServiceImpl {
    private static String mailHost = "smtp.qq.com";//163 smtp服务器地址 如果使用其他邮箱 填对应邮箱的smtp服务器地址
    private static String mailPort = "25";//smtp服务器的端口号 一般都为25
    private static String username = "1029589750@qq.com";// 发送方邮箱地址
    private static String password = "ajaizeefdjirbahh";//这里填发送方邮箱的授权码 注意不是邮箱的密码
    private static String subject="京东商城";
    /**
     * 发送邮件
     * @param to 给谁发
     * @param text 发送内容
     */
    public static void sendMessage(String to,String text) throws MessagingException {
        //创建连接对象 连接到邮件服务器
        Properties properties = new Properties();
        //设置发送邮件的基本参数
        //发送邮件服务器(注意，此处根据你的服务器来决定，如果使用的是QQ服务器，请填写smtp.qq.com)
        properties.put("mail.smtp.host", mailHost);
        //发送端口（根据实际情况填写，一般均为25）
        properties.put("mail.smtp.port", mailPort);
        properties.put("mail.smtp.auth", "true");
        //设置发送邮件的账号和密码
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //两个参数分别是发送邮件的账户和密码(注意，如果配置后不生效，请检测是否开启了 POP3/SMTP 服务，QQ邮箱对应设置位置在: [设置-账户-POP3/IMAP/SMTP/Exchange/CardDAV/CalDAV服务])
                return new PasswordAuthentication(username,password);
            }
        });

        //创建邮件对象
        Message message = new MimeMessage(session);
        //设置发件人
        message.setFrom(new InternetAddress(username));
        //设置收件人
        message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
        //设置主题
        message.setSubject(subject);
        //设置邮件正文  第二个参数是邮件发送的类型
        message.setContent(text,"text/html;charset=UTF-8");
        //发送一封邮件
        Transport.send(message);
}

    public static void main(String[] args) {
        try {
            sendMessage("1470957364@qq.com","fuck you");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

