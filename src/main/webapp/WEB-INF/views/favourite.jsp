<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
<script type="text/javascript">
	function dieu_huong1() {
		location.assign("thong-tin-tai-khoan");
	}
	function dieu_huong2() {
		location.assign("quan-ly-don-hang");
	}
</script>

<title>Đơn hàng | Jolie Cosmetics</title>
</head>
<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar__item_2">
						<h4>
							<strong>Danh sách yêu thích</strong>
						</h4>
						<!-- Tab links -->
						<div class="tabs">
							<button class="tablinks " onclick="dieu_huong1()"
								data-electronic="allproducts">Thông tin tài khoản</button>
							<button class="tablinks "
								data-electronic="Microcontrollers"
								 onclick="dieu_huong2()">Quản lý đơn hàng</button>

							<button class="tablinks_active" 
								data-electronic="module">Danh sách yêu thích</button>
						</div>
					</div>

				</div>
				<div class="col-lg-9">
					<form class="order_item">
						<table id="keywords" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th><span>Sản phẩm</span></th>
									<th><span> Trạng thái </span></th>
									<th><span>Đơn giá </span></th>
									<th></th>
									<th></th>

								</tr>
							</thead>
							<tbody>

								<tr>
									<td class="pro_name"><img
										src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
										<h5>Tẩy trang Bioderma</h5></td>
									<td class="pro_quantity">còn hàng</td>
									<td class="pro_price">200000</td>
									<td><i><a href="gio-hang"><i class="fa fa-shopping-bag"  style="color: black;"></i></td>
										<td ><a href="#"><span class="icon_close" style="color: #b2b2b2;"></span></a></td>
								</tr>
								<tr>
									<td class="pro_name"><img
										src="img/product/kem_chong_nang_sunplay.jpg" alt="">
										<h5>Kem chống nắng sunplay</h5></td>
									<td class="pro_quantity">còn hàng</td>
									<td class="pro_price">200000</td>
									<td><a href="gio-hang"><i class="fa fa-shopping-bag" style="color: black;"></i></a></td>
									<td ><a href="#"><span class="icon_close"  style="color: #b2b2b2;"></span></a></td>
								</tr>
							</tbody>

						</table>
						
					</form>

				</div>

			</div>

		</div>

	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>