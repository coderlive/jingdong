package service.inner;
import vo.Categorys;

import java.util.List;

public interface CategoryService {
    public int addCategory(Categorys c) throws Exception;
    Categorys selectById(int id) throws Exception;
    List<Categorys> selectAll(String sql)throws Exception;
    int delete(Categorys c) throws Exception;
    int updateCate(Categorys c) throws Exception;
    int deleteNoId(Categorys c) throws Exception;
    int selectIsActive(String sql) throws Exception;

    int selectAllCount(String selectCount) throws Exception;
}
