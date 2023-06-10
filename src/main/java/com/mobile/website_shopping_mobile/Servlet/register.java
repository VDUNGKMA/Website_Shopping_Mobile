package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.RegisterDao;
import com.mobile.website_shopping_mobile.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
@WebServlet("/register")
public class register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String ho =req.getParameter("ho");
       String ten =req.getParameter("ten");
       String email=req.getParameter("email");
       String username=req.getParameter("newUser");
       String password =req.getParameter("password");
       Connection connection = null;
       RequestDispatcher dispatcher =null;
        if(username == null || username.equals("")) {
            req.setAttribute("status", "Username_invalid");
            dispatcher =req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
        if(password == null || password.equals("")) {
            req.setAttribute("status", "Pwd_invalid");
            dispatcher=req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        } else if(password.length() <10) {
            req.setAttribute("status", "passwordLength");
            dispatcher=req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
        if(email == null || email.equals("")) {
            req.setAttribute("status", "Email_invalid");
            dispatcher=req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
        try {
            RegisterDao registerDao =new RegisterDao(dbConnection.getConnection());
            User user = registerDao.checkAccountExit(username);
            if(user ==null){
                int rowcount = registerDao.addUser(ho,ten,email,username,password);
                dispatcher=req.getRequestDispatcher("login.jsp");
                if(rowcount >0) {
                    req.setAttribute("status", "success");

                }else {
                    req.setAttribute("status", "fail");
                }
                dispatcher.forward(req, resp);
            } else{
                        req.setAttribute("status","account_exit");
                        req.getRequestDispatcher("login.jsp").forward(req,resp);
//                        resp.sendRedirect("login.jsp");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }


    }
}
