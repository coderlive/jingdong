package dao.impl;

import dao.inner.ProductDao;
import vo.Products;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDaoImpl extends DaoImpl<Products> implements ProductDao {
    @Override
    public int updateOrLower(Integer action, String pid) {
        String sql="update products set onsale="+action+" where pid="+pid;
        System.out.println("上下架的sql语句为"+sql);
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
