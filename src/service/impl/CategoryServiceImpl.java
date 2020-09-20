package service.impl;

import dao.impl.CateDaoImpl;
import dao.inner.CategoryDao;
import service.inner.CategoryService;
import vo.Categorys;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao cd=new  CateDaoImpl();
    @Override
    public int addCategory(Categorys c) throws Exception {
        return cd.add(c);
    }
    @Override
    public Categorys selectById(int id) throws Exception {
        return cd.getOneById(id, Categorys.class);
    }

    @Override
    public List<Categorys> selectAll(String sql) throws Exception {
        return cd.getPageByQuery(sql,Categorys.class);
    }

    @Override
    public int delete(Categorys c) throws Exception {
        return cd.delete(c);
    }

    @Override
    public int updateCate(Categorys c) throws Exception {
        return cd.update(c);
    }

    @Override
    public int deleteNoId(Categorys c) throws Exception {
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
