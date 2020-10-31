package com.dao;


import com.vo.Properties_select;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProperselectMapper extends Mapper<Properties_select> {
    int add(Integer pid, String pvalues);
    @Select("${sql}")
    int getTotalRecordCount(String sql);
    @Select("${sql}")
    List<Properties_select> getPageByQuery(String sql);
}
