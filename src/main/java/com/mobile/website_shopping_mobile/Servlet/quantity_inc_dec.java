package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.OrderDao;
import com.mobile.website_shopping_mobile.model.Cart;
import com.mobile.website_shopping_mobile.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/inc-dec-order")
public class quantity_inc_dec extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(PrintWriter out =resp.getWriter()) {
            String action= req.getParameter("action");
            int id = Integer.parseInt(req.getParameter("id"));
            List<Order> orders= (List<Order>) req.getSession().getAttribute("listorder");
            if(action !=null && id >1){
                if(action.equals("inc")){
                    for (Order c: orders ) {
                        if(c.getId()== id){
                            int quantity =c.getQuantity();
                            quantity++;
                            c.setQuantity(quantity);


                            break;
                        }
                    }
                } else{
                    for (Order c: orders) {
                        if(c.getId() ==id){
                            int quantity =c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);

                            break;
                        }
                    }
                }
            }
            resp.sendRedirect("order.jsp");
        }

    }

}
