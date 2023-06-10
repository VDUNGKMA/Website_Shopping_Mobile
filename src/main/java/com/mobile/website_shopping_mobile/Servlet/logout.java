package com.mobile.website_shopping_mobile.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/logout")
public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       HttpSession session =req.getSession();
       session.invalidate();
       //hoặc có thể dùng  session.removeAttribute("namesession"); voi namesession là tên sesion cần xóa
       resp.sendRedirect("index.jsp");
    }
}
