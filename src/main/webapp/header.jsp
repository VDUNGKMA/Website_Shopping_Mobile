<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Category" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <%
    ProductDao pd = new ProductDao(dbConnection.getConnection());
    List<Product> products = pd.getTop5Product();
    List<Product> products_chepeat=pd.getAllProductChepeat();
    List<Category> categories=pd.getAllCategory();
    List<Product> newproducts=pd.getNewProduct();
%>
<body>
<div class="header group">
    <div class="logo">
        <a href="index.jsp">
            <img src="img/logo.jpg" alt="Trang chủ Smartphone Store" title="Trang chủ Smartphone Store">
        </a>
    </div> <!-- End Logo -->

    <div class="content">
        <div class="search-header" style="position: relative; left: 162px; top: 1px;">
            <form class="input-search" method="get" action="search">
                <div class="autocomplete">
                    <input id="search-box" name="search" VALUE="${input_search}" autocomplete="off" type="text" placeholder="Nhập từ khóa tìm kiếm...">
                    <button type="submit">
                        <i class="fa fa-search"></i>
                        Tìm kiếm
                    </button>
                </div>
            </form> <!-- End Form search -->
            <div class="tags">
                <strong>Từ khóa:
                    <%
                        int i=0;
                        for (Category c:categories ) {%>
                            <a href="category?categoryid=<%=c.getId()%>"> <%=c.getCategoryName()%> </a> <%
                            i++;
                            if(i==5){
                                break;
                            }
                        }

                    %>

                </strong>
            </div>
        </div> <!-- End Search header -->

        <div class="tools-member">
            <div class="member">
                <a href="login.jsp">
                    <i class="fa fa-user"></i>
                    <% if(session.getAttribute("name") !=null){ %>
                            <%=session.getAttribute("name")%>
                    <div class="menuMember ">
                        <a href="nguoidung.jsp">Trang người dùng</a>
                        <a href="logout">Đăng xuất</a>
                    </div>
                   <% } else { %>
                           Tài khoản của tôi
                   <% } %>
                </a>


            </div> <!-- End Member -->

            <div class="cart">
                <a href="giohang.jsp">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Giỏ hàng</span>
                    <span class="cart-number">${cart_list.size()}</span>
                </a>
            </div> <!-- End Cart -->

            <div class="check-order">
                <a href="manager">
                    <i class="fa fa-truck"></i>
                    <span>Đơn hàng</span>
                </a>
            </div>
        </div><!-- End Tools Member -->
    </div> <!-- End Content -->
</div> <!-- End Header -->
</body>