package service.inner;

import javax.servlet.http.HttpSession;

public interface ShoppingCartService {
    void addToCart(HttpSession session, String pid, int modify);
}
