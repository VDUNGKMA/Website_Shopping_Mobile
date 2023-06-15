<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>HDPhone</title>
  <link rel="shortcut icon" href="img/favicon.ico" />

  <!-- Load font awesome icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        crossorigin="anonymous">

  <script src="js/Jquery/Jquery.min.js"></script>

  <!-- our files -->
  <!-- css -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/topnav.css">
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/taikhoan.css">
  <link rel="stylesheet" href="css/gioHang.css">
  <link rel="stylesheet" href="css/nguoidung.css">
  <link rel="stylesheet" href="css/footer.css">
  <!-- js -->
  <script src="data/products.js"></script>
  <script src="js/classes.js"></script>
  <script src="js/dungchung.js"></script>
  <script src="js/nguoidung.js"></script>

</head>

<body>
<script> addTopNav(); </script>

<section>
  <script> addHeader(); </script>
  <img src="https://previews.123rf.com/images/gmast3r/gmast3r1710/gmast3r171002170/88646835-black-friday-sale-template-horizontal-banner-discounts-on-modern-smart-phones-poster-design-vector.jpg" alt="" style="width: 100%;">

  <div class="infoUser">

  </div>

  <div class="listDonHang"> </div>
</section> <!-- End Section -->

<script>
  addContainTaiKhoan(); addPlc();
</script>

<div class="footer"><script>addFooter();</script></div>

<i class="fa fa-arrow-up" id="goto-top-page" onclick="gotoTop()"></i>
</body>

</html>
