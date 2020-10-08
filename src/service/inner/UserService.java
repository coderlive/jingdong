package service.inner;

import page.PageInfo;
import vo.Users;

import java.util.List;

public interface UserService {
    List<Users> getPageByQuery(String sql, Class<?> clazz) throws Exception;

    void add(Users u) throws Exception;

    int getPageQueryByCount(Users users) throws Exception;

    List<Users> getPageQuery(PageInfo pageInfo, Users users) throws Exception;

    int upperOrLower(Integer action,String userid);

    int updateActive(Integer action,String userid);

    //查所有然后分页
    public List<Users> getAllByPage(PageInfo pageInfo) throws Exception;

    //查询总共有多少条记录
    public int getTotalRecordCount() throws Exception;
}
