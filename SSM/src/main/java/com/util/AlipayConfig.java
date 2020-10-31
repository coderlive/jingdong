package com.util;

import java.util.Random;

public class AlipayConfig  {

        // 应用ID,支付宝提供的APPID，上面截图中有提到
        public static String app_id = "2016102500757986";

        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC8+oKQNA3KEhelpefKKodpbz93g1rYqC7pGXt62wF2CH3NVFRZCPRGhufAtLA2xZDkVy1jij7j3Eq0dDhhgigUdZs20ezEZUkCNNrxtJQAOkEhPd1aN9wlrl+LNxRZwd6N+R28wbWdBw2RnhyZDZs6KG5J/UJHLZg5ldUaYXgKdGgmOb+1d/l/uY6IBwoOHSFmmVIKw6xFbCX9yVKDkqaU0/Z3hV1xsZ/88M/ep6+ykdIx8Pcuq/iCSTYja2elu2CG3cKN4FZtuT2W2znkgvi8Z3E33A6MfZZ+WQZIuTvxUasgpsOVUfTGRsTfOobV20p+2fNlHyJnj0gOTOUsciTFAgMBAAECggEAe2gnzN2BR70K3ix6MiYVqX9xda08rREfGS9/2FmeGaMv698u+bmEM24zdz9Hd20K0mIvjLohmZEo47ClhN+HJt0qD+GEeTgfNian94FRyNhB4eBRZXHm/GBjmjjMvFSC7jmI9tOUsseBT99tk3E0NgVjCEQvfOXEa45xzDlsN35vh5EpZ9bi8+5AXpoVCY8tmSH9h3lvocENjqw15aMsR+Q/DIOgQRFDGEYsWs7z8iapKUJEH4vzbSkff34SvyLxk7NCulLEobjd50T3y/pdWKyan0x/TaXkD8RYl9uq719K76abLjsfAl5t/l+in3dYMGtvbUcw9dv9KvfL1NyFQQKBgQDiIWdox8RZAhXt2FnvEtE4FmmK6qSHsVFstVT7hdHvWEVpMrev/a8NXGvW5vBBqisEUF5MofMIayMH426kiPZ5ZhPpQAWBmcl+Qet2sVjLwQXj+FJIVdhv+F1YKFrbCQYrCKNfZAUcHfmLH9J4kbX6albiwJFCn0IUmYzU9pvhtQKBgQDV8NCKCtlQI6qyP9zv/LNxMsJNYfBV0aiDRQjHaaghoI5kA6PzTbrZ0wcMI6HtTi/P9RCXXIb17xSK5zoglOPcKOOCBW/iYrGFjzeh75B0kKfGhJEM6R7qkIhO9j/wUzeJmV7vzpyhEPkphTr7whRKdvYkdLuJiBaIqPiP2z9g0QKBgDxK78mOShn5ZmNuZjxKZiJwR1/UxF2xt6YmiywtOBZ7ELbF4Rg5qa0EUXSRSsoXVzTlQN9p5uT9u+9kgqG4Kw+fWfu9KDqwCHtzlBannqdlJe7szPOgf/8K18ijqeXw+AYNXZIXlw0yKNEhgPrIzx6fr97xvUloMTRQ5K37uwBpAoGBAMPl8G6WpIqXPjRd+gbeU8lxey20YoeSpUUeL325p7Sy+e9mzfd504CllSxubFWJZIp9kiWnGgWUWDEgrb8r1sG/xyNFqz+Ws4riq0RiwtmZo6dJuDAkPqT2l3oGTmHXMWGTyLS5cf6iNiTo1Cu3eTD+YUDciuTSch/M6V2AmzYhAoGBAJX6hZ957nmzUlBtTh0+dhiEuz58e+MA/zCIpR0sxsugkxok1xnRL/qESLf6v4OP4oGzp4f4iE6tbe09Mxm8kIcjjGQGa9xMhOFf5jbj8og2vON8qbkKiq3f1mymjZ7j7v7KdctJMbnH5MDEC5+F6ltlXgIkPKrQVWZ9fb8DdTQw";

        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/appDaily.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvPqCkDQNyhIXpaXnyiqHaW8/d4Na2Kgu6Rl7etsBdgh9zVRUWQj0RobnwLSwNsWQ5FctY4o+49xKtHQ4YYIoFHWbNtHsxGVJAjTa8bSUADpBIT3dWjfcJa5fizcUWcHejfkdvMG1nQcNkZ4cmQ2bOihuSf1CRy2YOZXVGmF4CnRoJjm/tXf5f7mOiAcKDh0hZplSCsOsRWwl/clSg5KmlNP2d4VdcbGf/PDP3qevspHSMfD3Lqv4gkk2I2tnpbtght3CjeBWbbk9lts55IL4vGdxN9wOjH2WflkGSLk78VGrIKbDlVH0xkbE3zqG1dtKftnzZR8iZ49IDkzlLHIkxQIDAQAB";

        // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问.如果只是测试使用,那么设置成自己项目启动后可以访问到的一个路径,作为支付宝发送通知的路径(有什么用暂时没发现)
        public static String notify_url = "http://localhost:8080/pay/alipay-callback-notify-url";
         //请求成功后会返回的路径
        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问.如果只是测试使用,那么设置成自己项目启动后可以访问到的一个路径.是支付正常完成后,会访问的路径.
        public static String return_url = "http://localhost:8080/jingdong/shopcart/buyShop";//跳转完后就直接去京东首页
        // 签名方式，注意这里，如果步骤设置的是RSA则用RSA,如果按照扇面步骤做的话,选择RSA2
        public static String sign_type = "RSA2";
        // 字符编码格式
        public static String charset = "utf-8";
        // 支付宝网关
        public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
        //格式
        private static String format="json";

        public static final int MACHINE_ID = 1;
        /**
         * 生成订单号
         */
        public static long getNumber(int length) {
                StringBuilder buf = new StringBuilder();
                Random random = new Random();
                /*开头不为0,建议数据量较少时只放开部分，比如1至3开头的数，等业务达到一定数量时，再逐步放开剩余的号码段，由于是固定位数，总数量一定，生成的数越多，重复的几率越大**/
                int firstNumber = random.nextInt(9) + 1;
                buf.append(firstNumber);

                for(int i = 0; i < length - 1; ++i) {
                        buf.append(random.nextInt(10));
                }

                return Long.valueOf(buf.toString());
        }

        public static void main(String[] args) {
                System.out.println(getNumber(6));
        }
}