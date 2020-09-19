package service.inner;
import vo.Category;

import java.util.List;

public interface CategoryService {
    public int addCategory(Category c) throws Exception;
    Category selectById(int id) throws Exception;
    List<Category> selectAll(String sql)throws Exception;
    int delete(Category c) throws Exception;
    int updateCate(Category c) throws Exception;
    int deleteNoId(Category c) throws Exception;
    int selectIsActive(String sql) throws Exception;

    int selectAllCount(String selectCount) throws Exception;
}
