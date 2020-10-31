package com.dao;


import com.page.PageInfo;
import com.vo.Categorys;
import com.vo.Users;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<Users>,SqlMapper<Users> {
    int updateOrLower(Integer action, String userid);

    int upActive(Integer action, String userid);


    List<Users> selectByUsernameAndPassword(Users u);

    int getPageQueryByCount(@Param("u") Users users);

    List<Users> getPageQuery(@Param("p") PageInfo pageInfo, @Param("u") Users users);

    int updateById(Users u);

    List<Categorys> getLevelCategory(Integer cparent);

}
