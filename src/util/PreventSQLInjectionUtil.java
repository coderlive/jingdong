package util;

import java.util.regex.Pattern;

public class PreventSQLInjectionUtil {

    /**
     * 功能: 验证某个字符串是否可用
     * @param str 需要验证的字符串
     * @return true 可用(不包含非法字符) false不可用(包含非法字符)
     */
    public static boolean isValid(String str) {


        String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"
                + "(\\b(select|update|union|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";

        // \\b  表示 限定单词边界  比如  select 不通过   1select则是可以的
        Pattern sqlPattern = Pattern.compile(reg, Pattern.CASE_INSENSITIVE);
        if (sqlPattern.matcher(str).find()) {
            System.out.println("验证未通过");
            return false;
        } else {
            System.out.println("验证通过");
        }
        return true;
    }

    public static void main(String[] args) {
        String cname = "' or 1=1 --";
        PreventSQLInjectionUtil util = new PreventSQLInjectionUtil();
        System.out.println(util.isValid(cname));
    }
}
