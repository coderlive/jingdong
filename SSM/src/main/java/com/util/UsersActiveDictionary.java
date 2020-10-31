package com.util;

//产品的字典类
public class UsersActiveDictionary {

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: active 数字------>中文
     *@param active 用户的状态  0表示未激活  1表示激活
     *@return lock状态对应的中文含义   如果是0  返回字符串"未激活"  如果是1 返回 "激活"
     */
    public static String activeIntToStr(Integer active){
        String strActive= "";
        if (active==null)
            return null;
        if(active==0){
            strActive = "未激活";
        }else if(active==1){
            strActive = "已激活";
        }

        return strActive;
    }

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: 根据传入的禁用状态返回对应的数字
     *      如果传入"激活" 返回 1 传入"未激活"  返回0
     *@param   String类型  可以传入"禁用"或者“不禁用” 文字
     *@return  Integer类型 对应的禁用架状态  0表示不禁用  1表示禁用
     */
    public static Integer activeStrToInt(String active){
        Integer intActive = null;
        if (active==null)
            return null;
        if("未激活".equals(active)){
            intActive = 0;
        }else if("已激活".equals(active)){
            intActive = 1;
        }

        return intActive;
    }
}

