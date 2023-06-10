package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet("/remove-product-form-cart")
public class RemoveProductFromCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {
            String id = req.getParameter("id");
            if (id != null) {
                ArrayList<Cart> cartList = (ArrayList<Cart>) req.getSession().getAttribute("cart_list");
                if (cartList != null) {
                    for (Cart c : cartList) {
                        if (c.getId() == Integer.parseInt(id)) {
                            cartList.remove(cartList.indexOf(c));//Hàm indexOf() trả về vị trí của một phần tử trong mảng hoặc chuỗi
                            break;
                        }
                    }
                }
            } else {
                ArrayList<Cart> cartList = (ArrayList<Cart>) req.getSession().getAttribute("cart_list");
                if (cartList != null) {
                    cartList.removeAll(cartList);

                }
            }
            resp.sendRedirect("giohang.jsp");
        }
    }
}
