package util;

//产品的字典类
public class UsersDictionary {

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: lock 数字------>中文
     *@param intLock 用户的状态  0表示不禁用  1表示禁用
     *@return lock状态对应的中文含义   如果是0  返回字符串"不禁用"  如果是1 返回 "禁用"
     */
    public static String lockIntToStr(int lock){
        String strLock= "";

        if(lock==0){
            strLock = "可用";
        }else if(lock==1){
            strLock = "禁用";
        }

        return strLock;
    }

    /**
     *
     *公司: 蓝桥杯软件学院
     *作者: 张兆亿
     *功能: 根据传入的禁用状态返回对应的数字
     *      如果传入"禁用" 返回 1 传入"不禁用"  返回0
     *@param   String 类型  可以传入"禁用"或者“不禁用” 文字
     *@return  Integer类型 对应的禁用架状态  0表示不禁用  1表示禁用
     */
    public static Integer lockStrToInt(String lock){
        Integer intLock = null;

        if("可用".equals(lock)){
            intLock = 0;
        }else if("禁用".equals(lock)){
            intLock = 1;
        }

        return intLock;
    }
}

