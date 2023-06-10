<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mobile.website_shopping_mobile.dao.ProductDao" %>
<%@ page import="com.mobile.website_shopping_mobile.collection.dbConnection" %>
<%@ page import="com.mobile.website_shopping_mobile.model.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
				for (Cart c: cartproducts) { %>
						<tr>
						<td><%=j++%></td>
						<td class="noPadding imgHide">
							<a target="_blank" href="chitietsanpham?pid=<%=c.getId()%>" title="Xem chi tiết">
							<%=c.getName()%>
								<img src="<%=c.getImage()%>">
							</a>
						</td>
						<td class="alignRight"><%=c.getPrice()%> ₫</td>
						<td class="soluong">
							<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">
								<i class="fa fa-plus"></i> </a>
							<input size="1"  value="<%=c.getQuantity()%>">
							<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
								<i class="fa fa-minus"></i>  </a>
						</td>
						<td class="alignRight"><%=c.getTotalPrice()%>₫</td>
<%--						<td style="text-align: center" id="hvn"></td>--%>
						<td>
							<a class="btn btn-sm btn-buynow" href="order-now?id=<%=c.getId()%>&quantity=<%=c.getQuantity()%>">Buy Now</a>
						</td>
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
<script>
	var today = new Date();
	var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;

	document.getElementById("hvn").innerHTML = dateTime;
</script>
</html>