package com.mobile.website_shopping_mobile.Servlet;
import java.io.OutputStreamWriter;
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
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Currency;
import java.util.Locale;

@WebServlet("/load-more-cheapeat")
public class LoadMoreProductCheapeat extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = new PrintWriter(new OutputStreamWriter(resp.getOutputStream(), "UTF-8"), true);) {
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html; charset=UTF-8");
            String amount = req.getParameter("exits_load");
            int iamount = Integer.parseInt(amount);
            ProductDao productDao = new ProductDao(dbConnection.getConnection());
            List<Product> listproduct = productDao.getNextProductChepeat(iamount);
            DecimalFormat decimalFormat = new DecimalFormat("#,###");
            decimalFormat.setDecimalFormatSymbols(new DecimalFormatSymbols(new Locale("vi", "VN")));
                for (Product p: listproduct) {
                    if(p.getPrice() !=0){
                    // Convert and format the price to Vietnamese currency
                    String formattedPrice = decimalFormat.format(p.getPrice()) + "đ";
                    out.println("  <li class=\"sanPham\" id=\"amount\">\n" +
                            "                        <div>\n" +
                            "                            <a href=\"chitietsanpham?pid="+p.getId()+"\">\n" +
                            "                                <img src=\""+p.getImage()+"\"\n" +
                            "                                     alt=\"\">\n" +
                            "                                <h3>"+p.getName()+"</h3>\n" +
                            "                                <div class=\"price\">\n" +
                            "                                   <strong>"+formattedPrice+"</strong>\n" +
                            "                                </div>\n" +

                            "                                <label class=\"giamgia\">\n" +
                            "                                    <i class=\"fa fa-bolt\"></i> Sale 20%\n" +
                            "                                </label>   </a>\n" +
                            "                            <div class=\"tool\">\n" +
                            "                           <button onclick=\"window.location.href='add-to-cart?id="+p.getId()+"';\" style=\"\n" +
                            "                                    outline: none;\n" +
                            "                                    background: #fe9203;\n" +
                            "                                    border: none;\n" +
                            "                                    padding: 10px 15px;\n" +
                            "                                    border-radius: 30px;\n" +
                            "                                    text-align: center;\n" +
                            "                                    margin-left: 60px;\n" +
                            "                                    margin-bottom: 20px;\n" +
                            "                                    color: white;\n" +
                            "                                    font-weight: 600;\n" +
                            "                                \">\n" +
                            "                                    Add to Cart\n" +
                            "                                </button>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </li>");
                }else{
                        out.println("  <li class=\"sanPham\" id=\"amount\">\n" +
                                "                        <div>\n" +
                                "                            <a href=\"chitietsanpham?pid="+p.getId()+"\">\n" +
                                "                                <img src=\""+p.getImage()+"\"\n" +
                                "                                     alt=\"\">\n" +
                                "                                <h3>"+p.getName()+"</h3>\n" +
                                "                                <div class=\"price\">\n" +
                                "                                   <strong>Contact</strong>\n" +
                                "                                </div>\n" +
                                "                                <label class=\"giamgia\">\n" +
                                "                                    <i class=\"fa fa-bolt\"></i> Sale 20%\n" +
                                "                                </label>   </a>\n" +
                                "                            <div class=\"tool\">\n" +
                                "                           <button onclick=\"window.location.href='add-to-cart?id="+p.getId()+"';\" style=\"\n" +
                                "                                    outline: none;\n" +
                                "                                    background: #fe9203;\n" +
                                "                                    border: none;\n" +
                                "                                    padding: 10px 15px;\n" +
                                "                                    border-radius: 30px;\n" +
                                "                                    text-align: center;\n" +
                                "                                    margin-left: 60px;\n" +
                                "                                    margin-bottom: 20px;\n" +
                                "                                    color: white;\n" +
                                "                                    font-weight: 600;\n" +
                                "                                \">\n" +
                                "                                    Add to Cart\n" +
                                "                                </button>\n" +
                                "                            </div>\n" +
                                "                        </div>\n" +
                                "                    </li>");
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
        }

        }
    }
