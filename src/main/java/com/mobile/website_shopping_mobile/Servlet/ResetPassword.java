package com.mobile.website_shopping_mobile.Servlet;

import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ResetPasswordDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/resetpassword")
public class ResetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String newPassword = req.getParameter("password");
        String confPassword = req.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                ResetPasswordDao resetpwddao;
                resetpwddao =new ResetPasswordDao(dbConnection.getConnection());
                int rowCount = resetpwddao.resetPassword((String) session.getAttribute("email"),newPassword);
                if (rowCount > 0) {
                    req.setAttribute("status", "resetSuccess");
                    dispatcher = req.getRequestDispatcher("login.jsp");
                } else {
                    req.setAttribute("status", "resetFailed");
                    dispatcher = req.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
