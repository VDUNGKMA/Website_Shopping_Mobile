package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out =resp.getWriter()) {
            ArrayList<Cart> ListCart = new ArrayList<>();
            int id = Integer.parseInt(req.getParameter("id"));
            Cart cart = new Cart();
            cart.setId(id);
            cart.setQuantity(1);
            cart.setOrderTime(System.currentTimeMillis());

            HttpSession session = req.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart_list");
            if (cart_list == null) {
                ListCart.add(cart);
                session.setAttribute("cart_list", ListCart);
                resp.sendRedirect("index.jsp");
            } else {
                ListCart = cart_list; // danh sach cart moi= danh sach cart cu
                boolean exit = false;
                for (Cart c : cart_list) {
                    if (c.getId() == id) {
                        exit = true;
                        out.println("<h3 style ='color:black; text-align:center'>Item aleredy>");
                    }

                }
                if (!exit ) {
                    ListCart.add(cart);
                    resp.sendRedirect("index.jsp");

                }

            }
        }
    }
}
