<%@ page import="com.mobile.website_shopping_mobile.dao.ProductDao" %>
<%@ page import="com.mobile.website_shopping_mobile.collection.dbConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Product" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Category" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <%
            for (Category c: categories) { %>
                 <a href="category?categoryid=<%=c.getId()%>">
            <img src="<%=c.getLogo()%>"></a> <%

            }
        %>


    </div>



    <!-- Div hiển thị khung sp hot, khuyến mãi, mới ra mắt ... -->
    <div class="contain-khungSanPham">


        <div class="khungSanPham" style="border-color: #ff9c00">
            <h3 class="tenKhung"
                style="background-image: linear-gradient(120deg, #ff9c00 0%, #ec1f1f 50%, #ff9c00 100%);">* NỔI BẬT NHẤT
                *</h3>
            <div id="content" class="listSpTrongKhung flexContain">
                <% if(!products.isEmpty()){
                    for (Product p: products) { %>
                         <li class="sanPham">
                             <div>
                    <a href="chitietsanpham?pid=<%=p.getId()%>">
                        <img src="<%=p.getImage()%>"
                        alt="">
                        <h3><%=p.getName()%></h3>
                        <div class="price">
                            <strong><%=p.getPrice()%>₫</strong>
                        </div>
                        <div class="ratingresult">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                        class="fa fa-star"></i><i class="fa fa-star"></i><span>9999 đánh giá</span>
                        </div>
                        <label class="giamgia">
                            <i class="fa fa-bolt"></i> Sản phẩm nổi bật
                                </label>   </a>
                        <div class="tool">
                            <button onclick="window.location.href='add-to-cart?id=<%=p.getId()%>';">
                                Add to Cart
                            </button>
                        </div>
                             </div>
                </li> <%
                    }
                }%>
            </div>

                <button onclick="LoadMore()" class="btn btn-primary">Xem thêm sản phẩm</button>

            </div>
            <hr>
            <div class="khungSanPham" style="border-color: #42bcf4">
                <h3 class="tenKhung"
                    style="background-image: linear-gradient(120deg, #42bcf4 0%, #004c70 50%, #42bcf4 100%);">* SẢN PHẨM
                    MỚI *</h3>
                <div class="listSpTrongKhung flexContain">
                    <%
                        if(!newproducts.isEmpty()){
                            for (Product newproduct: newproducts) { %>
                                 <li class="sanPham">
                        <a href="chitietsanpham?pid=<%=newproduct.getId()%>">
                            <img src="<%=newproduct.getImage()%>" alt="">
                            <h3><%=newproduct.getName()%></h3>
                            <div class="price">
                                <strong><%=newproduct.getPrice()%>₫</strong>
                            </div>
                            <div class="ratingresult">
                                <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                class="fa fa-star"></i><i class="fa fa-star-o"></i><span>372 đánh giá</span>
                            </div>
                            <label class="moiramat">
                                        Mới ra mắt
                            </label>

                        </a>
                                     <div class="tool">
                                         <button  onclick="window.location.href='add-to-cart?id=<%=newproduct.getId()%>';" >
                                       Add to Cart
                                         </button>
                                     </div>
                    </li> <%
                            }
                        }
                    %>


                </div>
            </div>
            <hr>
            <div class="khungSanPham" style="border-color: #5de272">
                <h3 class="tenKhung"
                    style="background-image: linear-gradient(120deg, #5de272 0%, #007012 50%, #5de272 100%);">* GIÁ RẺ
                    CHO MỌI NHÀ *</h3>
                <div id="content1" class="listSpTrongKhung flexContain" >
                    <% if(!products.isEmpty()){
                        for (Product p: products_chepeat) { %>
                    <li class="sanPham" id="amount"  >
                        <div>
                            <a href="chitietsanpham?pid=<%=p.getId()%>">
                                <img src="<%=p.getImage()%>"
                                     alt="">
                                <h3><%=p.getName()%></h3>
                                <div class="price">
                                    <strong><%=p.getPrice()%>₫</strong>
                                </div>
                                <div class="ratingresult">
                                    <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                        class="fa fa-star"></i><i class="fa fa-star"></i><span>9999 đánh giá</span>
                                </div>
                                <label class="giamgia">
                                    <i class="fa fa-bolt"></i> Giảm 20%
                                </label>   </a>
                            <div class="tool">
                                <button onclick="window.location.href='add-to-cart?id=<%=p.getId()%>';">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </li> <%
                        }
                    }%>
                </div>
                <button onclick="LoadMoreCheapeat()" class="btn btn-primary">Xem thêm sản phẩm</button>
            </div>
            <hr>
        </div>
</section> <!-- End Section -->

<div class="footer">
    <script>addFooter();</script>
</div>

<i class="fa fa-arrow-up" id="goto-top-page" onclick="gotoTop()"></i>
</body>

</html>
<script type="text/javascript">

    var status = document.getElementById("status").value;
    if (status == "error") {
        swal({
            title: "Login Fail because username or password somthing went wrong!",
            text: "You clicked the button !",
            icon: "error",
        });
    } else if (status == "invalidUname") {
        swal({
            title: "invalid Username",
            text: "You clicked the button !",
            icon: "error",
        });
    } else if (status == "invalidPwd") {
        swal({
            title: "invalid Password",
            text: "You clicked the button !",
            icon: "error",
        });
    } else if (status == "resetSuccess") {
        swal({
            title: "Reset password succesfully",
            text: "You clicked the button !",
            icon: "success",
        });
    } else if (status == "resetSuccess") {
        swal({
            title: "Reset password succesfully",
            text: "You clicked the button !",
            icon: "success",
        });
    } else if (status == "resetFailed") {
        swal({
            title: "Reset password failed",
            text: "You clicked the button !",
            icon: "error",
        });
    }
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    function LoadMore(){
        var amount =document.getElementsByClassName("sanPham").length;
        $.ajax({
            type: "GET",
            url: "/load-more-product",
            data: {
              exitsLoadProduct: amount,
            },
            success: function (data){
                var row = document.getElementById("content");
                row.innerHTML += data;
            },
            error: function (xhr){
                print("fail to load more")
            }
        });
    }
    function LoadMoreCheapeat(){
        // Sử dụng JavaScript để lấy độ dài của các phần tử <li class="sanPham" id="amount">
        var elements = document.querySelectorAll('#amount');
        var length = elements.length;
        $.ajax({
            type: "GET",
            url: "/load-more-cheapeat",
            data: {
                exits_load: length,
            },
            success: function (data){
                var contents =document.getElementById("content1");
                contents.innerHTML += data;
            },
            error: function (xhr){
                print("fail to load more")
            }
        });
    }

</script>