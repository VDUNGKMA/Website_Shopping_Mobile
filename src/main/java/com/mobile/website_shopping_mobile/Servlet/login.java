package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.UserLoginDao;
import com.mobile.website_shopping_mobile.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/login")
public class login extends HttpServlet {
    @Override
    //404 -> url
    //500 -> jsp properties
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname =req.getParameter("username");
        String pwd =req.getParameter("password");
        HttpSession session =req.getSession();
        RequestDispatcher dispatcher =null;
        if(uname == null || uname.equals("") ) {
            req.setAttribute("status", "invalidUname");
            dispatcher=req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
        if(pwd == null || pwd.equals("")) {
            req.setAttribute("status", "invalidPwd");
            dispatcher=req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }

        try {
            UserLoginDao udao;
            udao= new UserLoginDao(dbConnection.getConnection());
            User user =udao.getUser(uname,pwd);
            if(user != null){
                session.setAttribute("auth",user);
                session.setAttribute("name",user.getUname() );
                resp.sendRedirect("index.jsp");
            } else {
                req.setAttribute("status", "error");
                dispatcher=req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException e) {
           e.printStackTrace();
        }

    }
}
