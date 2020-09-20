package dao.impl;

import dao.inner.Dao;
import util.ConnOracle;
import util.InitCapUtil;
import util.OracleColumnTypeToJavaTypeUtil;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




public class DaoImpl<T> implements Dao<T> {

    // 组合Connection对象
    private Connection conn;

    private Class<?> voClazz;
    private String className;// 简单类名
    private int tableColumnCount;// 表的字段个数
    private List<String> columnNameList = new ArrayList<String>();// 存表的所有字段名
    private List<String> lowerColumnNameList = new ArrayList<String>();// 小写的所有字段名
    private List<String> columnTypeList = new ArrayList<String>();// 存表的所有字段的类型

    public DaoImpl() {
        conn = ConnOracle.getConnection();
        //设置事务自动提交
//        try {
////            conn.setAutoCommit(true);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

    public void init(Class<?> voClazz) throws Exception {

        className = voClazz.getSimpleName();// 得到简单类名
        //System.out.println("className:" + className);
        String queryFieldTypeAndName = "select * from " + className + " where rownum<1";
        //System.out.println(queryFieldTypeAndName);// 为了后面得到ResultSetMetaData
        // 来获得表的字段信息
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(queryFieldTypeAndName);
        ResultSetMetaData rsmd = rs.getMetaData();

        tableColumnCount = rsmd.getColumnCount();// 获得表中字段个数

        // 把字段名存到集合中
        for (int i = 0; i < tableColumnCount; i++) {

            String columnName = rsmd.getColumnName(i + 1);
            String columnType = rsmd.getColumnTypeName(i + 1);
            columnNameList.add(InitCapUtil.initCap(columnName));
            lowerColumnNameList.add(InitCapUtil.toLowerCase(columnName));

            columnTypeList.add(OracleColumnTypeToJavaTypeUtil.toJavaType(columnType));
        }
    }
    public int deleteNoById(T object)
    {
        voClazz = object.getClass();
        try {
            init(voClazz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String sql = "delete from " + className + " where ";
        int count = 0;
        // 反射调方法
        try {
            System.out.println(columnNameList.get(0));
            for (int i = 1; i <= tableColumnCount - 1; i++) {

                // 相当于 pstmt.setString(1, product.getPname());
                sql+=columnNameList.get(i);
                String voGetMethodStr = "get" + columnNameList.get(i);
                Method voGetMethod = null;
                sql+="=";
                voGetMethod = voClazz.getDeclaredMethod(voGetMethodStr);
                String voGetMethodResult = (String) voGetMethod.invoke(object);
                sql+=voGetMethodResult==null?"''":"'"+voGetMethodResult+"'";
                if (i!=tableColumnCount - 1)
                    sql+=" and ";
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        PreparedStatement pst=null;
        try {
            pst=conn.prepareStatement(sql);
            count=pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return count;
    }
    @Override
    public int add(T object) throws Exception {
        voClazz = object.getClass();
        init(voClazz);
        // 产生insert语句
        // String sql = "insert into category values(seq_category.nextval,?,?)";

        String sequenceName = "seq_" + className + ".nextval";// 得到序列名

        String sql = "insert into " + className + " values(" + sequenceName;

        for (int i = 1; i <= tableColumnCount - 1; i++) {
            sql = sql + ",?";
        }

        sql = sql + ")";

        System.out.println(sql);

        PreparedStatement pstmt = null;

        // 三.建立通道
        int count = 0;
        try {
            pstmt = conn.prepareStatement(sql);

            // 反射调方法
            for (int i = 1; i <= tableColumnCount - 1; i++) {

                // 相当于 pstmt.setString(1, product.getPname());

                String voGetMethodStr = "get" + columnNameList.get(i);
                Method voGetMethod = voClazz.getDeclaredMethod(voGetMethodStr);

                Object voGetMethodResult = voGetMethod.invoke(object);

                pstmt.setObject(i, voGetMethodResult);// pstmt.setInt(1,10)
            }

            // 四.执行并返回结果集
            count = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("建立通道失败");
            e.printStackTrace();
            throw new Exception("添加失败");
        }
        //根本就不用关闭这个东西，你个坑爹的玩意
        finally {
            // 五.关闭
            ConnOracle.closeConnection(null, pstmt, null);

        }

        return count;

    }

    public int delete(T object) throws Exception {
        int count = 0;

        voClazz = object.getClass();
        init(voClazz);
        String primaryKeyName = columnNameList.get(0);
        System.out.println("primaryKeyName=" + primaryKeyName);
        // String sql = "delete from product where pid=?";

        String sql = "delete from " + className + " where " + primaryKeyName + "=?";
        System.out.println(sql);

        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);

            String voGetMethodStr = "get" + primaryKeyName;

            Method voGetMethod = voClazz.getDeclaredMethod(voGetMethodStr);

            Object id = voGetMethod.invoke(object);
            pstmt.setObject(1, id);// 相当于pstmt.setInt(1, category.getCid());

            // 4.执行并返回结果集
            count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
            // DCL或DDL语句 返回值是0

            if (count >= 1) {
                System.out.println("删除成功!");
            } else {
                System.out.println("没有删除!");
            }
        } catch (SQLException e) {
            System.out.println("建立通道或删除失败");
            e.printStackTrace();
            throw new Exception("删除失败!");
        }
        finally {
            // 5.关闭
            ConnOracle.closeConnection(null, pstmt, null);
        }

        return count;

    }

    public int update(T object) throws Exception {
        int count = 0;
        voClazz = object.getClass();
        init(voClazz);

        String primaryKeyName = columnNameList.get(0);
        // 3.建立通道
        // String sql = "update category set cname=?,cdesc=? where cid=?";
        String sql = "update " + className + " set ";

        for (int i = 1; i <= tableColumnCount - 2; i++) {
            sql += columnNameList.get(i) + "=?,";
        }

        sql += columnNameList.get(tableColumnCount - 1) + "=? where " + primaryKeyName + "=?";
        System.out.println(sql);
        // 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);

            // 反射调方法
            for (int i = 1; i <= tableColumnCount - 1; i++) {

                // 相当于
                // pstmt.setString(1, category.getCname());
                // pstmt.setString(2, category.getCdesc());

                String voGetMethodStr = "get" + columnNameList.get(i);
                Method voGetMethod = voClazz.getDeclaredMethod(voGetMethodStr);

                Object voGetMethodResult = voGetMethod.invoke(object);

                pstmt.setObject(i, voGetMethodResult);
            }

            String voGetIdMethodStr = "get" + primaryKeyName;
            Method voGetIdMethod = voClazz.getDeclaredMethod(voGetIdMethodStr);

            Object voGetIdMethodResult = voGetIdMethod.invoke(object);

            // pstmt.setInt(3, category.getCid());
            pstmt.setObject(tableColumnCount, voGetIdMethodResult);
            // 4.执行并返回结果集
            count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
            // DCL或DDL语句 返回值是0

        } catch (SQLException e) {
            System.out.println("建立通道或修改失败");
            e.printStackTrace();
            throw new Exception("修改失败!");
        }
//        finally {
//            // 5.关闭
//            ConnOracle.closeConnection(null, pstmt, conn);
//        }

        return count;
    }

    public T getOneById(int id, Class<?> clazz) throws Exception {

        Object object = clazz.newInstance();
//        System.out.println(object);
        init(clazz);
        // 3.建立通道
        String sql = "select * from " + className + " where " + lowerColumnNameList.get(0) + "=?";
        System.out.println(sql);
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, id);
            // 4.执行并返回结果集
            rs = pstmt.executeQuery();

            while (rs.next()) {

                /*
                 * category.setCid(rs.getInt("cid"));
                 * category.setCname(rs.getString("cname"));
                 * category.setCdesc(rs.getString("cdesc"));
                 */

                // 反射调方法
                for (int i = 0; i < tableColumnCount; i++) {

                    String columnName = lowerColumnNameList.get(i);

                    Field field = clazz.getDeclaredField(columnName);
                    field.setAccessible(true);

                    Class<?> resultSetClazz = rs.getClass();

                    String rsGetMethodName = "get" + columnTypeList.get(i);
                    Method rsGetMethod = resultSetClazz.getMethod(rsGetMethodName, String.class);
                    rsGetMethod.setAccessible(true);
                    Object rsGetMethodResult = rsGetMethod.invoke(rs, columnName);

                    field.set(object, rsGetMethodResult);

                }
            }
        } catch (SQLException e) {
            System.out.println("建立通道或查询单个商品种类失败");
            e.printStackTrace();
            throw new Exception("查询单个一级商品种类失败");
        }
//        finally {
//            // 5.关闭
//            ConnOracle.closeConnection(rs, pstmt, conn);
//        }

        return (T)object;
    }

    public List<T> getPageByQuery(String sql, Class<?> clazz) throws Exception {

        init(clazz);

        List<T> list = new ArrayList<>();
        Object object = null;
        ResultSet rs = null;
        Statement stmt = null;
        // 3.建立通道
        try {
            stmt = conn.createStatement();
            // 4.执行并返回结果集
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                object = clazz.newInstance();

                for (int i = 0; i < tableColumnCount; i++) {

                    String columnName = lowerColumnNameList.get(i);

                    Field field = clazz.getDeclaredField(columnName);
                    field.setAccessible(true);

                    Class<?> resultSetClazz = rs.getClass();

                    String rsGetMethodName = "get" + columnTypeList.get(i);
                    Method rsGetMethod = resultSetClazz.getMethod(rsGetMethodName, String.class);
                    rsGetMethod.setAccessible(true);
                    Object rsGetMethodResult = rsGetMethod.invoke(rs, columnName);

                    field.set(object, rsGetMethodResult);

                }

                list.add((T)object);

            }
        } catch (SQLException e) {
            System.out.println("创建通道或查询结果集失败");
            e.printStackTrace();

            throw new Exception("查询一级商品种类失败!");

        }
        finally {
            // 5.关闭
            ConnOracle.closeConnection(rs, stmt, null);
        }

        return list;
    }

    public int getTotalRecordCount(String sql) throws Exception{
        int totalRecordCount = -1;

        ResultSet rs = null;
        Statement stmt = null;
        // 3.建立通道
        try {
            stmt = conn.createStatement();
            // 4.执行并返回结果集
            rs = stmt.executeQuery(sql);

            while (rs.next()) {

                totalRecordCount = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("创建通道或查询结果集失败");
            e.printStackTrace();

            throw new Exception("查询总共有多少条记录失败!");

        }
        finally {
            // 5.关闭
            ConnOracle.closeConnection(rs, stmt, null);
        }

        return totalRecordCount;
    }

}