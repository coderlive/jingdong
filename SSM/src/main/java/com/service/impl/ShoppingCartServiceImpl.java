package com.service.impl;


import com.dao.ProductMapper;
import com.service.inner.ShoppingCartService;

import javax.servlet.http.HttpSession;

public class ShoppingCartServiceImpl implements ShoppingCartService {
    private ProductMapper pd;

    @Override
    public void addToCart(HttpSession session, String pid, int modify) {

    }
}
