package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete")
public class DeleteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int p_id= Integer.parseInt(req.getParameter("pid"));
        try {
            ProductDao productDao =new ProductDao(dbConnection.getConnection());
            productDao.deleteProduct(p_id);
            resp.sendRedirect("manager");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
