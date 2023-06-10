package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/quantity-inc-dec")
public class QuantityIncDec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(PrintWriter out =resp.getWriter()) {
            String action= req.getParameter("action");
            int id = Integer.parseInt(req.getParameter("id"));
            ArrayList<Cart> cartList= (ArrayList<Cart>) req.getSession().getAttribute("cart_list");
            if(action !=null && id >1){
                if(action.equals("inc")){
                    for (Cart c: cartList) {
                        if(c.getId() ==id){
                            int quantity =c.getQuantity();
                            quantity++;
                            c.setQuantity(quantity);

                            break;
                        }
                    }
                } else{
                    for (Cart c: cartList) {
                        if(c.getId() ==id){
                            int quantity =c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);

                            break;
                        }
                }
            }
        }
            resp.sendRedirect("giohang.jsp");
        }

    }
}
