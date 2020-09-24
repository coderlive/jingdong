package util;

import java.util.HashMap;
import java.util.Map;

//首字母大写工具类
public class InitCapUtil {


    /**
     * 作者: zhangzy
     * 时间: 2018年8月23日 上午10:45:40
     * 功能: 把输入的属性名 改成首字母大写,其余字母小写
     * 输入参数: 属性名  例如 CNAME
     * 返回值: 首字母大写的属性名  例如 Cname
     */
    public static String initCap(String columnName){
        String afterColumnName = "";

        char[] charArr = new char[columnName.length()];

        charArr[0] = columnName.charAt(0);//首字母不变 还是大写

        for(int i=1,length=charArr.length;i<length;i++){

            char perChar = columnName.charAt(i);
            if(perChar=='_'|| (perChar>=48 && perChar<=57)) {//'_' 和数字不要转化
                charArr[i] = columnName.charAt(i);
            }else{
                charArr[i] = (char)(columnName.charAt(i) + 32);
            }

        }

        afterColumnName = new String(charArr);

        return afterColumnName;
    }

    /**
     * 作者: zhangzy
     * 时间: 2018年8月24日 下午4:22:21
     * 功能: 把输入的属性名 改成小写
     * 输入参数: 属性名 例如CNAME
     * 返回值: 小写的属性名 cname
     */
    public static String toLowerCase(String columnName){
        String afterColumnName = "";

        char[] charArr = new char[columnName.length()];

        for(int i=0,length=charArr.length;i<length;i++){

            char perChar = columnName.charAt(i);
            if(perChar=='_'|| (perChar>=48 && perChar<=57)) {//'_' 和数字不要转化
                charArr[i] = columnName.charAt(i);
            }else{
                charArr[i] = (char)(columnName.charAt(i) + 32);
            }

        }

        afterColumnName = new String(charArr);

        return afterColumnName;
    }

    public static void main(String[] args) {
        System.out.println(InitCapUtil.toLowerCase("CID"));
    }
}