<%@ page import="com.mobile.website_shopping_mobile.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mobile.website_shopping_mobile.dao.ProductDao" %>
<%@ page import="com.mobile.website_shopping_mobile.collection.dbConnection" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
        ProductDao productDao = new ProductDao(dbConnection.getConnection());
        List<Category> category = productDao.getAllCategory();


%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thế giới điện thoại</title>
    <link rel="shortcut icon" href="img/favicon.ico"/>

    <!-- Load font awesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          crossorigin="anonymous">

    <!-- owl carousel libraries -->
    <link rel="stylesheet" href="js/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="js/owlcarousel/owl.theme.default.min.css">
    <script src="js/Jquery/Jquery.min.js"></script>
    <script src="js/owlcarousel/owl.carousel.min.js"></script>

    <!-- tidio - live chat -->
    <!-- <script src="//code.tidio.co/bfiiplaaohclhqwes5xivoizqkq56guu.js"></script> -->

    <!-- our files -->
    <!-- css -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/topnav.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/banner.css">
    <link rel="stylesheet" href="css/taikhoan.css">
    <link rel="stylesheet" href="css/trangchu.css">
    <link rel="stylesheet" href="css/home_products.css">
    <link rel="stylesheet" href="css/pagination_phantrang.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="header.jsp">
    <!-- js -->
    <script src="data/products.js"></script>
    <script src="js/classes.js"></script>
    <script src="js/dungchung.js"></script>
    <script src="js/trangchu.js"></script>

</head>
    <body>
    <section>
        <%@ include file="header.jsp" %>

        <div class="banner">
            <div class="owl-carousel owl-theme"></div>
        </div> <!-- End Banner -->

        <img src="img/banners/blackFriday.gif" alt="" style="width: 100%;">

        <br>
        <div class="companyMenu group flexContain">

             <% for (Category c: category) { %>
                  <a href="category?categoryid=<%=c.getId()%>">

                <img src="<%=c.getLogo()%>"></a> <%
             }%>
        </div>
        <ul id="products" class="homeproduct group flexContain">
<%--        // Dùng thư viện jstl cho foreach ta chỉ cần lấy ra phần autribute rồi lấy phần tử đó trỏ tới các thành phần có trong bảng--%>
        <c:forEach var="p" items="${listProductBySearch}">
            <c:if test="${not empty listProductBySearch}">
                <li class="sanPham">
                    <a href="chitietsanpham?pid=${p.id}">
                        <img src="${p.image}" alt="">
                        <h3>${p.name}</h3>
                        <div class="price">
                            <strong>${p.price}₫</strong>
                            <span>${p.price-100000}₫</span>
                        </div>
                        <div class="ratingresult">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><span>10 đánh giá</span>
                        </div>
                        <label class="giareonline">
                            Giá rẻ online
                        </label>
                        <div class="tooltip">
                            <button class="themvaogio" onclick="themVaoGioHang('App0', 'iPhone X 256GB Silver'); return false;">
                                <span class="tooltiptext" style="font-size: 15px;">Thêm vào giỏ</span>
                                +
                            </button>
                        </div>
                    </a>
                </li>
            </c:if>
            <c:if test="${empty listProductBySearch}">
                <h3>no product find</h3>

            </c:if>
        </c:forEach>
    <c:forEach var="p" items="${listProductByCategoryId}">
        <li class="sanPham">
            <a href="chitietsanpham?pid=${p.id}">
                <img src="${p.image}" alt="">
                <h3>${p.name}</h3>
                <div class="price">
                    <strong>${p.price}₫</strong>
                    <span>${p.price-100000}₫</span>
                </div>
                <div class="ratingresult">
                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><span>10 đánh giá</span>
                </div>
                <label class="giareonline">
                    Giá rẻ online
                </label> </a>
                <div class="tool">
                    <button onclick="window.location.href='add-to-cart?id=${p.id}';">
                        Add to Cart
                    </button>
                </div>
                </div>

        </li>

    </c:forEach>
        </ul>

        </section>
    </body>
    <div class="footer">
        <script>addFooter();</script>
    </div>
</html>