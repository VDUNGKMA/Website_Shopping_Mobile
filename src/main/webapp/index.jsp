<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HDPhone</title>
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
    <input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
    <%@ include file="header.jsp" %>

    <div class="banner">
        <div class="owl-carousel owl-theme"></div>
    </div> <!-- End Banner -->

    <img src="https://previews.123rf.com/images/gmast3r/gmast3r1710/gmast3r171002170/88646835-black-friday-sale-template-horizontal-banner-discounts-on-modern-smart-phones-poster-design-vector.jpg" alt="" style="width: 100%;">

    <br>
    <div class="companyMenu group flexContain">
        <%
            for (Category c: categories) { %>
                 <a href="category?categoryid=<%=c.getId()%>">
            <img src="<%=c.getLogo()%>"></a> <%

            }
        %>


    </div>



    <!-- Div hiển thị khung sp hot, Sale, Newly released ... -->
    <div class="contain-khungSanPham">


        <div class="khungSanPham" style="background: #f7e3c5;border-color: #ff9c00;">
            <h3 class="tenKhung"
                style="background-image: linear-gradient(120deg, #ff9c00 0%, #ec1f1f 50%, #ff9c00 100%);">* MOST HIGHLIGHTS
                *</h3>
            <div id="content" class="listSpTrongKhung flexContain">
                <% if(!products.isEmpty()){
                    for (Product p: products) { %>
                         <li class="sanPham" style="background-color: #ffff;border: none;margin: 5px; border-radius: 10px;">
                             <div>
                    <a href="chitietsanpham?pid=<%=p.getId()%>">
                        <img src="<%=p.getImage()%>"
                        alt="">
                        <h3><%=p.getName()%></h3>
                        <div class="price">
                            <strong><%=new DecimalFormat("#,###").format(p.getPrice())%>₫</strong>
                        </div>
                        <label class="giamgia">
                            <i class="fa fa-bolt"></i> Featured products
                                </label>   </a>
                        <div class="tool">
                            <button onclick="window.location.href='add-to-cart?id=<%=p.getId()%>';"style="
                                outline: none;
                                background: #fe9203;
                                border: none;
                                padding: 10px 15px;
                                border-radius: 30px;
                                text-align: center;
                                margin-left: 60px;
                                margin-bottom: 20px;
                                color: white;
                                font-weight: 600;
                                ">Add to Cart
                            </button>
                        </div>
                             </div>
                </li> <%
                    }
                }%>
            </div>

                <button onclick="LoadMore()" class="btn btn-primary" style="
                        outline: none;
                        background: #3fb8ef;
                        border: none;
                        padding: 10px 15px;
                        border-radius: 30px;
                        text-align: center;
                        margin-left: 46.6%;
                        margin-bottom: 20px;
                        margin-top: 20px;
                        color: white;
                        font-weight: 600;
                ">Show more</button>

            </div>
            <hr>
            <div class="khungSanPham" style="background-color: #98d3ee;border-color: #42bcf4">
                <h3 class="tenKhung"
                    style="background-image: linear-gradient(120deg, #42bcf4 0%, #004c70 50%, #42bcf4 100%);">* NEW PRODUCTS *</h3>
                <div class="listSpTrongKhung flexContain">
                    <%
                        if(!newproducts.isEmpty()){
                            for (Product newproduct: newproducts) { %>
                                 <li class="sanPham">
                        <a href="chitietsanpham?pid=<%=newproduct.getId()%>">
                            <img src="<%=newproduct.getImage()%>" alt="">
                            <h3><%=newproduct.getName()%></h3>
                            <div class="price">
                                <strong><%=new DecimalFormat("#,###").format(newproduct.getPrice())%>₫</strong>
                            </div>
                            
                            <label class="moiramat">
                                        Newly released
                            </label>

                        </a>
                                     <div class="tool">
                                         <button  onclick="window.location.href='add-to-cart?id=<%=newproduct.getId()%>';" style="
                                            outline: none;
                                            background: #fe9203;
                                            border: none;
                                            padding: 10px 15px;
                                            border-radius: 30px;
                                            text-align: center;
                                            margin-left: 60px;
                                            margin-bottom: 20px;
                                            color: white;
                                            font-weight: 600;
                                        " >
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
            <div class="khungSanPham" style="background-color: #a5f3b1;border-color: #5de272">
                <h3 class="tenKhung"
                    style="background-image: linear-gradient(120deg, #5de272 0%, #007012 50%, #5de272 100%);">* CHEAP FOR ALL *</h3>
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
                                    <strong>
                                        <%=new DecimalFormat("#,###").format(p.getPrice())%>₫</strong>
                                </div>

                                <label class="giamgia">
                                    <i class="fa fa-bolt"></i> Sale 20%
                                </label>   </a>
                            <div class="tool">
                                <button onclick="window.location.href='add-to-cart?id=<%=p.getId()%>';" style="
                                    outline: none;
                                    background: #fe9203;
                                    border: none;
                                    padding: 10px 15px;
                                    border-radius: 30px;
                                    text-align: center;
                                    margin-left: 60px;
                                    margin-bottom: 20px;
                                    color: white;
                                    font-weight: 600;
                                ">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </li> <%
                        }
                    }%>
                </div>
                <button onclick="LoadMoreCheapeat()" class="btn btn-primary" style="
                        outline: none;
                        background: #3fb8ef;
                        border: none;
                        padding: 10px 15px;
                        border-radius: 30px;
                        text-align: center;
                        margin-left: 46.6%;
                        margin-bottom: 20px;
                        margin-top: 20px;
                        color: white;
                        font-weight: 600;
                ">Show more</button>
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