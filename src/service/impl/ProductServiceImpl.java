package service.impl;

import dao.impl.CateDaoImpl;
import dao.impl.ProductDaoImpl;
import dao.inner.CategoryDao;
import dao.inner.ProductDao;
import page.PageInfo;
import service.inner.CategoryService;
import service.inner.ProductService;
import vo.Categorys;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductDao cd=new ProductDaoImpl();
}
