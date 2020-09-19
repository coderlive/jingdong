package service.impl;

import dao.impl.CateDaoImpl;
import dao.inner.CategoryDao;
import service.inner.CategoryService;
import vo.Category;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao cd=new  CateDaoImpl();
    @Override
    public int addCategory(Category c) throws Exception {
        return cd.add(c);
    }
    @Override
    public Category selectById(int id) throws Exception {
        return cd.getOneById(id, Category.class);
    }

    @Override
    public List<Category> selectAll(String sql) throws Exception {
        return cd.getPageByQuery(sql,Category.class);
    }

    @Override
    public int delete(Category c) throws Exception {
        return cd.delete(c);
    }

    @Override
    public int updateCate(Category c) throws Exception {
        return cd.update(c);
    }

    @Override
    public int deleteNoId(Category c) throws Exception {
        return cd.deleteNoById(c);
    }

    @Override
    public int selectIsActive(String sql) throws Exception {
        return cd.getTotalRecordCount(sql);
    }

    @Override
    public int selectAllCount(String selectCount) throws Exception {
        return cd.getTotalRecordCount(selectCount);
    }


}
