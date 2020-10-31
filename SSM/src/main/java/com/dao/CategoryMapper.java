package com.dao;


import com.vo.Categorys;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.ArrayList;
import java.util.List;

public interface CategoryMapper extends Mapper<Categorys> {

    List<Categorys> getLevelCategory(Integer cparent);

    List<Categorys> selectLevelByGroup(@Param("arr") ArrayList arr);

    List<Categorys> selectByName(String searchCondition);
    @Select("${sql}")
    int getPageQueryByCount(String sql);
    @Select("${sql}")
    List<Categorys> getPageByQuery(String sql);
}
