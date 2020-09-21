package util;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class ConnOracle {
    //Oracle数据库配置的JNDI数据源连接名,后面跟的是DataSource名，DataSource名在web.xml文件中的<res-ref-name></res-ref-name>进行了配置
    private static final String ORACLE_DB_JNDINAME = "java:comp/env/jdbc/OracleDataSource";
    private static DataSource ds = null;

    static{
        try {
            //1、初始化名称查找上下文
            Context ctx = new InitialContext();
            //2、通过JNDI名称找到DataSource
            ds = (DruidDataSource) ctx.lookup(ORACLE_DB_JNDINAME);
//            System.out.println("-------------阿里巴巴druid连接池-------------");
//            System.out.println(ds);

        } catch (NamingException e) {
            e.printStackTrace();
        }
    }


    public static Connection getConnection() {
        Connection conn = null;
        try {
            conn = ds.getConnection();
        } catch (SQLException e) {
            System.out.println("获取Connection对象失败");
            e.printStackTrace();
        }
        return conn;
    }

    public static void closeConnection(ResultSet rs, Statement statement, Connection connection){
        if(rs!=null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(statement!=null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(connection!=null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        System.out.println(ConnOracle.getConnection());
    }
}