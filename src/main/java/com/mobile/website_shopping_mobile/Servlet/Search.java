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

@WebServlet("/search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name =req.getParameter("search");
        req.setCharacterEncoding("UTF-8");
        HttpSession session =req.getSession();
        RequestDispatcher dispatcher =null;

        try {
            ProductDao productDao =new ProductDao(dbConnection.getConnection());
            List<Product> productListByName = productDao.getProductByName(name);
            req.setAttribute("listProductBySearch",productListByName);
            req.setAttribute("input_search",name);
            dispatcher =req.getRequestDispatcher("category.jsp");
            dispatcher.forward(req,resp);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }


    }
    }

