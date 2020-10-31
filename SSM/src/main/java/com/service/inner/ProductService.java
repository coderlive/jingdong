package com.service.inner;

import com.page.OrderCondition;
import com.page.PageInfo;
import com.vo.Products;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ProductService {


    List<Products> salesVolume(Integer row);

    int getPageQueryByCount(Products p);

    List<Products> getPageQuery(PageInfo pageInfo, Products p, OrderCondition oc);

    Products selectById(Integer pid);

    Products selectOne(Products p);

    void updateProduct(Products p);

    void upload(HttpServletRequest request, String productListUploadPath);

    void deleteById(Products p);

    void add(Products p);
}
