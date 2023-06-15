package com.mobile.website_shopping_mobile.Servlet;
import java.text.DecimalFormat;
import com.mobile.website_shopping_mobile.collection.dbConnection;
import com.mobile.website_shopping_mobile.dao.ProductDao;
import com.mobile.website_shopping_mobile.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.List;
import java.util.Locale;

@WebServlet("/load-more-product")
public class LoadMoreProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try( PrintWriter out = resp.getWriter();) {
            int amount = Integer.parseInt(req.getParameter("exitsLoadProduct"));

            ProductDao productDao = new ProductDao(dbConnection.getConnection());
            List<Product> products = productDao.getNextTop5Product(amount);
            for (Product o: products) {
                out.println("   <li class=\"sanPham\">\n" +
                        "                             <div>\n" +
                        "                    <a href=\"chitietsanpham?pid="+o.getId()+"\">\n" +
                        "                        <img src=\""+o.getImage()+"\"\n" +
                        "                        alt=\"\">\n" +
                        "                        <h3>"+o.getName()+"</h3>\n" +
                        "                        <div class=\"price\">\n" +
                        "                            <strong>"+new DecimalFormat("#,###$").format(o.getPrice())+"</strong>\n" +
                        "                        </div>\n" +
                        "                        <label class=\"giamgia\">\n" +
                        "                            <i class=\"fa fa-bolt\"></i> Featured products\n" +
                        "                                </label>   </a>\n" +
                        "                        <div class=\"tool\">\n" +
                        "    <button onclick=\"window.location.href='add-to-cart?id="+o.getId()+"';\"style=\"\n" +
                                "                                outline: none;\n" +
                                "                                background: #fe9203;\n" +
                                "                                border: none;\n" +
                                "                                padding: 10px 15px;\n" +
                                "                                border-radius: 30px;\n" +
                                "                                text-align: center;\n" +
                                "                                margin-left: 60px;\n" +
                                "                                margin-bottom: 20px;\n" +
                                "                                color: white;\n" +
                                "                                font-weight: 600;\n" +
                                "                                \">Add to Cart\n" +
                                "                            </button>\n" +
                        "                        </div>\n" +
                        "                             </div>\n" +
                        "                </li>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}