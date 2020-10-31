package com.dao;


import com.vo.Products;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProductMapper extends Mapper<Products> {

    int updateOrLower(Integer action, String pid);

    void updateProductByOid(String sql);

    List<Products> salesVolume(Integer row);

    int getPageQueryByCount(@Param("p") Products p);

    List<Products> getPageQuery(String sql);
    @Select("${sql}")
    Products selectBySql(String sql);
}
