package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class ConnOracle2 {

    private static DataSource ds;

    static {
        try {
            Properties properties = new Properties();
            //FileInputStream fis = new FileInputStream("src/druid.properties");
            //从CLASSPATH(classes文件夹下)读druid.properties
            InputStream is = ConnOracle2.class.getClassLoader().getResourceAsStream("druid.properties");
            properties.load(is);
            ds = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
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
        System.out.println(ConnOracle2.getConnection());
    }
}