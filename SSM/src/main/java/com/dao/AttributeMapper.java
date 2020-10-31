package com.dao;


import com.vo.Properties;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AttributeMapper extends Mapper<Properties> {
    int addAttributes(Integer cid, String pname);
    @Select("${sql}")
    int getTotalRecordCount(String sql);
    @Select("${sql}")
    List<Properties> getPageByQuery(String sql);

    int delete(Properties properties);

    int update(Properties properties);

    Properties getOneById(int parseInt, Class<Properties> propertiesClass);
}
