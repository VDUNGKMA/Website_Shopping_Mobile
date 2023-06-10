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

@WebServlet("/add-product")
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String image = req.getParameter("image");
        double price = Double.parseDouble(req.getParameter("price"));
//        String description = req.getParameter("description");
        String descriptionData = req.getParameter("descriptionData");

        int categoryid = Integer.parseInt(req.getParameter("category"));
        try {
            ProductDao productDao = new ProductDao(dbConnection.getConnection());
            productDao.InsertProduct(name, categoryid, price, image, descriptionData);
            resp.sendRedirect("manager");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
