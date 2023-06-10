package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Category;
import com.mobile.website_shopping_mobile.model.Product;
import com.mobile.website_shopping_mobile.model.User;
import com.mysql.cj.jdbc.JdbcConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/manager")
public class ManagerControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();

        try {
            ProductDao productDao =new ProductDao(dbConnection.getConnection());
            List<Product> products= productDao.getAllProduct();
            req.setAttribute("ListProudct",products);
            List<Category> categories= productDao.getAllCategory();
            req.setAttribute("listCategory",categories);
            req.getRequestDispatcher("admin.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
