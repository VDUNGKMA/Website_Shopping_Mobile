package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/category")
public class Category extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("categoryid"));
        HttpSession session =req.getSession();
        RequestDispatcher dispatcher =null;
        ProductDao productDao = null;
        try {
            productDao = new ProductDao(dbConnection.getConnection());
          List<Product> productListByCategoryId = productDao.getAllProductByCategoryId(categoryId);
          req.setAttribute("listProductByCategoryId",productListByCategoryId);
          dispatcher =req.getRequestDispatcher("category.jsp");
          dispatcher.forward(req,resp);
        } catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
        }


    }
}
