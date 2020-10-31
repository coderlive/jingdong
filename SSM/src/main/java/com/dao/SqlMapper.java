package com.dao;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SqlMapper<T> {
    @Select("${sql}")
    List<T> selectListBySql(String sql);
}
