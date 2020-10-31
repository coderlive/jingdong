package com.util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class SessionUtil {
    private static  SqlSessionFactory factory;
    static {
        InputStream in=SessionUtil.class.getClassLoader().getResourceAsStream("mybatis.xml");
        factory=new SqlSessionFactoryBuilder().build(in);
    }
    public static SqlSession getSqlSessionWithTransation()
    {
        SqlSession session=null;
        session=factory.openSession();
        return session;
    }
    public static SqlSession getSqlSessionAutoCommit()
    {
        SqlSession session=null;
        session=factory.openSession(true);
        return session;
    }
    public static void closeSqlSession(SqlSession session)
    {
        if (session!=null)
        {
            session.close();
        }
    }
}
