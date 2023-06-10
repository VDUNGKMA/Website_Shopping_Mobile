package com.mobile.website_shopping_mobile.Servlet;

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
import java.util.List;

@WebServlet("/load-more-cheapeat")
public class LoadMoreProductCheapeat extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter();) {
                resp.setCharacterEncoding("UTF-8");
                String amount = req.getParameter("exits_load");
                int iamount = Integer.parseInt(amount);
                ProductDao productDao = new ProductDao(dbConnection.getConnection());
                List<Product> listproduct = productDao.getNextProductChepeat(iamount);
                for (Product p: listproduct) {
                    out.println("  <li class=\"sanPham\" id=\"product_amount\">\n" +
                            "                        <div>\n" +
                            "                            <a href=\"chitietsanpham?pid="+p.getId()+"\">\n" +
                            "                                <img src=\""+p.getImage()+"\"\n" +
                            "                                     alt=\"\">\n" +
                            "                                <h3>"+p.getName()+"</h3>\n" +
                            "                                <div class=\"price\">\n" +
                            "                                    <strong>"+p.getPrice()+">₫</strong>\n" +
                            "                                </div>\n" +
                            "                                <div class=\"ratingresult\">\n" +
                            "                                    <i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><i\n" +
                            "                                        class=\"fa fa-star\"></i><i class=\"fa fa-star\"></i><span>9999 đánh giá</span>\n" +
                            "                                </div>\n" +
                            "                                <label class=\"giamgia\">\n" +
                            "                                    <i class=\"fa fa-bolt\"></i> Giảm 20%\n" +
                            "                                </label>   </a>\n" +
                            "                            <div class=\"tool\">\n" +
                            "                                <button onclick=\"window.location.href='add-to-cart?id="+p.getId()+"';\">\n" +
                            "                                    Add to Cart\n" +
                            "                                </button>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </li>");
                }
            }catch(Exception e){
                e.printStackTrace();
        }

        }
    }
