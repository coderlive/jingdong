package dao.impl;

import dao.inner.AttributeDao;
import vo.Properties;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AttributeDaoImpl extends DaoImpl<Properties> implements AttributeDao {
    public int addAttributes(Integer cid,String pname){
        int count = 0;
        if(pname != null && !pname.trim().equals("")){
            String sql = "insert into properties values(seq_properties.nextval,'"+cid+"','"+pname+"')";
            System.out.println("添加商品属性的sql语句是"+sql);
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
