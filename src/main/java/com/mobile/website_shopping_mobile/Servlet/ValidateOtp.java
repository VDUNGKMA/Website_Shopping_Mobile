package com.mobile.website_shopping_mobile.Servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int value=Integer.parseInt(request.getParameter("otp"));
        HttpSession session=request.getSession();
        int otp=(int)session.getAttribute("otp");
        RequestDispatcher dispatcher=null;


        if (value==otp)
        {

            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            dispatcher=request.getRequestDispatcher("resetPassword.jsp");
            dispatcher.forward(request, response);

        }
        else
        {
            request.setAttribute("message","wrong otp");

            dispatcher=request.getRequestDispatcher("enterOtp.jsp");
            dispatcher.forward(request, response);

        }

    }
}
