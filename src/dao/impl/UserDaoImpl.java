package dao.impl;

import dao.inner.UserDao;
import vo.Users;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl extends DaoImpl<Users> implements UserDao {

    @Override
    public int updateOrLower(Integer action, String userid) {
        String sql="update users set uenable="+action+" where userid="+userid;
        System.out.println("禁用解锁的sql语句为"+sql);
        PreparedStatement pst=null;
        int count=0;
        try {
            pst=conn.prepareStatement(sql);
            count=pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public int upActive(Integer action, String userid) {
        String sql="update users set active="+action+" where userid="+userid;
        System.out.println("激活状态的sql语句为"+sql);
        PreparedStatement pst=null;
        int count=0;
        try {
            pst=conn.prepareStatement(sql);
            count=pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
