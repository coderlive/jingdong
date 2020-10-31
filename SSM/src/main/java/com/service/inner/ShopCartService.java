package com.service.inner;

import javax.servlet.http.HttpSession;

public interface ShopCartService {
    String addToCart(HttpSession session, Integer pid, Integer modify);
}
