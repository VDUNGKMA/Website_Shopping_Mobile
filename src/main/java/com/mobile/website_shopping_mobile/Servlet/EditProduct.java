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

@WebServlet("/edit-product")
public class EditProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id= Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String image = req.getParameter("image");
        double price = Double.parseDouble(req.getParameter("price"));
        String descriptionData =req.getParameter("descriptionData");
        int categoryid = Integer.parseInt(req.getParameter("category"));
        ProductDao productDao = null;
        try {
            productDao = new ProductDao(dbConnection.getConnection());
            productDao.EditProduct(name,categoryid,price,image,descriptionData,id);
            resp.sendRedirect("manager");
        } catch (Exception e) {

        }



    }
}
