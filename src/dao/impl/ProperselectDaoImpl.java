package dao.impl;

import dao.inner.ProperselectDao;
import vo.Properties_select;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProperselectDaoImpl extends DaoImpl<Properties_select> implements ProperselectDao {
    @Override
    public int add(Integer pid, String pvalues) {
        int count = 0;
        if(pvalues != null && !pvalues.trim().equals("")) {
            String sql = "insert into properties_select values(seq_properties_select.nextval,'"+pid+"','"+pvalues+"')";
            System.out.println("添加属性值的sql语句是"+sql);
            PreparedStatement pstmt = null;

            try {
                pstmt=conn.prepareStatement(sql);
                count=pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return count;
    }
}
