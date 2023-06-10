package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Category;
import com.mobile.website_shopping_mobile.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/load-product")
public class LoadProduct extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id= Integer.parseInt(req.getParameter("pid"));
        try {
            ProductDao productDao =new ProductDao(dbConnection.getConnection());
            Product product =productDao.getProductById(id);
            List<Category> categories= productDao.getAllCategory();
            req.setAttribute("listCategory",categories);

            req.setAttribute("detail",product);
            req.getRequestDispatcher("editProduct.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
