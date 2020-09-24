package service.inner;
import page.PageInfo;
import service.impl.CategoryServiceImpl;
import vo.Categorys;
import vo.Products;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ProductService {

    int selectIsActive(String sql) throws Exception;

    void addProduct(Products p) throws Exception;

    int getPageQueryByCount(Products p) throws Exception;

    List<Products> getPageQuery(PageInfo pageInfo, Products p) throws Exception;

    Products selectById(int pid) throws Exception;

    int updateProduct(Products p) throws Exception;

    int deleteProduct(Products p) throws Exception;

    int upperOrLower(Integer action,String pid);

    void upload(HttpServletRequest request, String productListUploadPath);
}
