package dao.inner;

import vo.Products;

public interface ProductDao extends Dao<Products> {

    int updateOrLower(Integer action, String pid);
}
