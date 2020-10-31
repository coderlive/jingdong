package com.service.inner;


import com.page.PageInfo;
import com.vo.Categorys;
import com.vo.Users;

import java.io.FileNotFoundException;
import java.util.List;

public interface UserService {

    List<Users> selectByUsernameAndPassword(Users u);

    int getPageQueryByCount(Users users);

    List<Users> getPageQuery(PageInfo pageInfo, Users users);

    int updateActive(Users u);

    List selectUserBySql(String sql);

    void lockUser(String username);

    String sendEmail(String email);

    void registerUser(Users u);
}
