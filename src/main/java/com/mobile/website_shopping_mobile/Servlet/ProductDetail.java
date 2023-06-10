package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Product;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/chitietsanpham")
public class ProductDetail extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher =null;
        HttpSession session =req.getSession();
        int id =Integer.parseInt(req.getParameter("pid"));
        try {
            ProductDao productDao =new ProductDao(dbConnection.getConnection());
            Product single_product =productDao.getProductById(id);
            req.setAttribute("detail",single_product);
            dispatcher=req.getRequestDispatcher("chitietsanpham.jsp");
            dispatcher.forward(req,resp);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
