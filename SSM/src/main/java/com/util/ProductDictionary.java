package com.util;

//产品的字典类
public class ProductDictionary {

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: onsale 数字------>中文
     *@param intOnsale 产品的状态  0表示下架  1表示上架
     *@return onsale状态对应的中文含义   如果是0  返回字符串"下架"  如果是1 返回 "上架"
     */
    public static String onsaleIntToStr(int onsale){
        String strOnsale= "";

        if(onsale==0){
            strOnsale = "下架";
        }else if(onsale==1){
            strOnsale = "上架";
        }

        return strOnsale;
    }

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: 根据传入的上下架状态返回对应的数字
     *      如果传入"上架" 返回 1 传入"下架"  返回0
     *@param   String 类型  可以传入"上架"或者“下架” 文字
     *@return  Integer类型 对应的上下架状态  0表示下架  1表示上架
     */
    public static Integer onsaleStrToInt(String onsale){
        Integer intOnsale = null;

        if("下架".equals(onsale)){
            intOnsale = 0;
        }else if("上架".equals(onsale)){
            intOnsale = 1;
        }

        return intOnsale;
    }
}

