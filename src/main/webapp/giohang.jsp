<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Cart" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!DOCTYPE html>
<html lang="vi">
<%
	ArrayList<Cart> listCart = (ArrayList<Cart>) session.getAttribute("cart_list");
	List<Cart> cartproducts = null;
	if(listCart != null){
		ProductDao pd = new ProductDao(dbConnection.getConnection());
		cartproducts =pd.getCartProduct(listCart);
		request.setAttribute("cart_list",listCart);
		double total =pd.getTotalProductPrice(listCart);
		request.setAttribute("total",total);
	}
%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="shortcut icon" href="img/favicon.ico" />

	<title>Thế giới điện thoại</title>

	<!-- Load font awesome icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	 crossorigin="anonymous">

	<!-- our files -->
	<!-- css -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/topnav.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/taikhoan.css">
	<link rel="stylesheet" href="css/gioHang.css">
	<link rel="stylesheet" href="css/footer.css">
	<!-- js -->
	<script src="data/products.js"></script>
	<script src="js/classes.js"></script>
	<script src="js/dungchung.js"></script>
	<script src="js/giohang.js"></script>

</head>

<body>

	<section style="min-height: 85vh">
		<%@ include file="header.jsp" %>

		<table class="listSanPham">
			<tbody>
			<tr>
				<th>STT</th>
				<th>Sản phẩm</th>
				<th>Giá</th>
				<th>Số lượng</th>
				<th>Thành tiền</th>
				<th>Thời gian</th>
				<th>Xóa</th>
			</tr>
	<%
			if(listCart != null){
				int j=1;
				Collections.reverse(cartproducts); //hàm đảo ngược danh sách
				for (Cart c: cartproducts) { %>
						<tr>
						<td><%=j++%></td>
						<td class="noPadding imgHide">
							<a target="_blank" href="chitietsanpham?pid=<%=c.getId()%>" title="Xem chi tiết">
							<%=c.getName()%>
								<img src="<%=c.getImage()%>">
							</a>
						</td>

						<td class="alignRight"><%=new DecimalFormat("#,###").format(c.getPrice())%> ₫</td>
						<td class="soluong">
							<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
								<i class="fa fa-plus"></i> </a>
							<input size="1"  value="<%=c.getQuantity()%>">
							<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
								<i class="fa fa-minus"></i>  </a>
						</td>
						<td class="alignRight"><%=new DecimalFormat("#,###").format(c.getTotalPrice())%>₫</td>
<%--Lớp java.time.LocalDateTime cho phép bạn tạo một đối tượng đại diện cho ngày và giờ từ giá trị thời gian dưới dạng java.time.Instant.--%>
<%--Trong trường hợp này, chúng ta sử dụng java.time.Instant.ofEpochMilli() để chuyển đổi giá trị c.getOrderTime() từ kiểu long sang java.time.Instant,--%>
<%--sau đó chúng ta sử dụng java.time.LocalDateTime.ofInstant() để chuyển đổi Instant thành LocalDateTime.--%>
<%--Cuối cùng, chúng ta cung cấp java.time.ZoneId.systemDefault() để xác định múi giờ mặc định của hệ thống.--%>
				<td style="text-align: center" class="hvn"><%= java.time.LocalDateTime.ofInstant(java.time.Instant.ofEpochMilli(c.getOrderTime()), java.time.ZoneId.systemDefault()) %></td>
							<td class="noPadding" >
							<a class="btn btn-sm btn-remove" href="remove-product-form-cart?id=<%=c.getId()%>"><i class="fa fa-trash" ></i>  </a>
						</td>
					</tr> <%
				}
			}%>
			<tr style="font-weight:bold; text-align:center">
				<td colspan="4">TỔNG TIỀN: </td>
				<td class="alignRight">${total>0 ?total:0} ₫</td>
				<td class="thanhtoan" onclick="thanhToan()"> Thanh Toán </td>
				<td class="xoaHet"> <a class="btn btn-primary btn-block"  href="remove-product-form-cart" role="button">Xóa hết</a> </td>
			</tr>
			</tbody>
		</table>
		
	</section> <!-- End Section -->
	<div class="footer">
		<script>addFooter();</script>
	</div>



	<i class="fa fa-arrow-up" id="goto-top-page" onclick="gotoTop()"></i>
</body>





</html>