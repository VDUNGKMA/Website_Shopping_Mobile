<%@ page import="com.mobile.website_shopping_mobile.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Thế giới điện thoại</title>
  <link rel="shortcut icon" href="img/favicon.ico" />

  <!-- Load font awesome icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        crossorigin="anonymous">

  <!-- owl carousel libraries cho hình nhỏ -->
  <link rel="stylesheet" href="js/owlcarousel/owl.carousel.min.css">
  <link rel="stylesheet" href="js/owlcarousel/owl.theme.default.min.css">
  <script src="js/Jquery/Jquery.min.js"></script>
  <script src="js/owlcarousel/owl.carousel.min.js"></script>

  <!-- our files -->
  <!-- css -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/topnav.css">
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/taikhoan.css">
  <link rel="stylesheet" href="css/trangchu.css">
  <link rel="stylesheet" href="css/home_products.css">
  <link rel="stylesheet" href="css/chitietsanpham.css">
  <link rel="stylesheet" href="css/footer.css">
  <!-- js -->
  <script src="data/products.js"></script>
  <script src="js/classes.js"></script>
  <script src="js/dungchung.js"></script>
  <script src="js/chitietsanpham.js"></script>
</head>

<body>

<script> addTopNav(); </script>

<section>
  <script> addHeader(); </script>

  <div id="productNotFound" style="min-height: 50vh; text-align: center; margin: 50px; display: none;">
    <h1 style="color: red; margin-bottom: 10px;">Không tìm thấy sản phẩm</h1>
    <a href="index.jsp" style="text-decoration: underline;">Quay lại trang chủ</a>
  </div>

  <div class="chitietSanpham" style="margin-bottom: 100px">
    <h1>Điện thoại ${detail.getName()}</h1>
    <div class="rating"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><span> 347 đánh giá</span></div>
    <div class="rowdetail group">
      <div class="picture">
        <img src="${detail.getImage()}" onclick="opencertain()">
      </div>
      <div class="price_sale">
        <div class="area_price"><strong>${detail.getPrice()}₫</strong></div>
        <div class="ship" style="display: none;">
          <img src="">
          <div>NHẬN HÀNG TRONG 1 GIỜ</div>
        </div>
        <div class="area_promo">
          <strong>khuyến mãi</strong>
          <div class="promo">
            <img src="img/chitietsanpham/icon-tick.png">
            <div id="detailPromo">Cơ hội trúng <span style="font-weight: bold">61 xe Wave Alpha</span> khi trả góp Home Credit</div>
          </div>
        </div>
        <div class="policy">
          <div>
            <img src="img/chitietsanpham/box.png">
            <p>Trong hộp có: Sạc, Tai nghe, Sách hướng dẫn, Cây lấy sim, Ốp lưng </p>
          </div>
          <div>
            <img src="img/chitietsanpham/icon-baohanh.png">
            <p>Bảo hành chính hãng 12 tháng.</p>
          </div>
          <div class="last">
            <img src="img/chitietsanpham/1-1.jpg">
            <p>1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong 1 ngày.</p>
          </div>
        </div>
        <div class="area_order">
          <!-- nameProduct là biến toàn cục được khởi tạo giá trị trong phanTich_URL_chiTietSanPham -->
          <a class="buy_now" onclick="themVaoGioHang(maProduct, nameProduct);">
            <b><i class="fa fa-cart-plus"></i> Thêm vào giỏ hàng</b>
            <p>Giao trong 1 giờ hoặc nhận tại cửa hàng</p>
          </a>
        </div>
      </div>
      <div class="info_product">
        ${detail.getDiscripsion()}
      </div>
    </div>
    <div id="overlaycertainimg" class="overlaycertainimg">
      <div class="close" onclick="closecertain()">×</div>
      <div class="overlaycertainimg-content">
        <img id="bigimg" class="bigimg" src="img/products/xiaomi-redmi-5-plus-600x600.jpg">
        <div class="div_smallimg owl-carousel owl-loaded owl-drag">
          <!-- <img src="img/chitietsanpham/oppo-f9-mau-do-1-org.jpg" onclick="changepic(this.src)">
          <img src="img/chitietsanpham/oppo-f9-mau-do-2-org.jpg" onclick="changepic(this.src)">
          <img src="img/chitietsanpham/oppo-f9-mau-do-3-org.jpg" onclick="changepic(this.src)"> -->
          <div class="owl-stage-outer"><div class="owl-stage" style="transition: all 0s ease 0s; width: 1778px; transform: translate3d(508px, 0px, 0px);"><div class="owl-item active center" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/products/huawei-mate-20-pro-green-600x600.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item active" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/chitietsanpham/oppo-f9-mau-do-1-org.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item active" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/chitietsanpham/oppo-f9-mau-do-2-org.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/chitietsanpham/oppo-f9-mau-do-3-org.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/products/huawei-mate-20-pro-green-600x600.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/chitietsanpham/oppo-f9-mau-do-3-org.jpg" onclick="changepic(this.src)">
            </a>
          </div></div><div class="owl-item" style="width: 253.866px;"><div class="item">
            <a>
              <img src="img/products/huawei-mate-20-pro-green-600x600.jpg" onclick="changepic(this.src)">
            </a>
          </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots"><button role="button" class="owl-dot active"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button><button role="button" class="owl-dot"><span></span></button></div></div>
      </div>
    </div>
  </div>

  <div id="goiYSanPham"></div>
</section>

<script>addContainTaiKhoan();</script>

<div class="footer"><script>addFooter();</script></div>

</body>

</html>
