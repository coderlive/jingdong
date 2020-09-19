package dao.inner;

import java.util.List;

//通用的DAO接口
//泛型的实质: 类型形参
public interface Dao<T> {
    //一.增加
    int add(T object) throws Exception;
    //二.删除
    int delete(T object) throws Exception;
    //三.修改
    int update(T object) throws Exception;
    //四.查1
    T getOneById(int id, Class<?> clazz) throws Exception;
    //五.按SQL语句查
    List<T> getPageByQuery(String sql, Class<?> clazz) throws Exception;
    //六.查询总共有多少条记录
    int getTotalRecordCount(String sql) throws Exception;
    int deleteNoById(T object);
}
