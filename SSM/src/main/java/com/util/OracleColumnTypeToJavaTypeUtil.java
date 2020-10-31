package com.util;

import java.util.HashMap;
import java.util.Map;

public class OracleColumnTypeToJavaTypeUtil {

    private static Map<String,String> map = new HashMap<String,String>();

    static {
        map.put("NUMBER","Int");
        map.put("VARCHAR2","String");
    }

    public static String toJavaType(String oracleColumnType){

        return map.get(oracleColumnType);
    }
}