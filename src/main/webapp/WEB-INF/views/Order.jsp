<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/Order.css" type="text/css" />
<script type="text/javascript">
	function dieu_huong1() {
		location.assign("thong-tin");
	}
	function dieu_huong2() {
		location.assign("yeu-thich");
	}
</script>
<script type="text/javascript">
	function openTab(evt, cityName) {
		// Declare all variables
		var i, tabcontent, tablinks;

		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " active";
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
					<div class="sidebar__item_3">
						<h4>
							<strong>Quản lý đơn hàng</strong>
						</h4>
						<!-- Tab links -->
						<div class="navs">
							<button class="navs_link " onclick="dieu_huong1()"
								data-electronic="allproducts">Thông tin tài khoản</button>
							<button class="navs_link_nav_active" data-electronic="Microcontrollers"
								onclick="openTab(event, 'all')">Quản lý đơn hàng</button>

							<button class="navs_link" onclick="dieu_huong2()"
								data-electronic="module">Danh sách sản phẩm yêu thích</button>
						</div>
					</div>

				</div>
				<div class="col-lg-9">
					<!-- Tab links -->
					<div class="tab">
						<button class="tablinks active" onclick="openTab(event, 'all')">Tất
							cả</button>
						<button class="tablinks" onclick="openTab(event, 'new')">Mới
							đặt</button>
						<button class="tablinks" onclick="openTab(event, 'processing')">Đang
							xử lý</button>
						<button class="tablinks" onclick="openTab(event, 'success')">Thành
							công</button>
						<button class="tablinks" onclick="openTab(event, 'cancel')">Đã
							hủy</button>
					</div>

					<!-- Tab content -->
					<div id="all" class="tabcontent">
						<form class="order_item">
							<h4>Mã đơn: 1 | Ngày đặt hàng: 12/2/2022</h4>
							<table id="keywords" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th><span>Sản phẩm</span></th>
										<th><span>số lượng</span></th>
										<th><span>Giá tiền</span></th>

									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="pro_name"><img
											src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
											<h5>Tẩy trang Bioderma</h5></td>
										<td class="pro_quantity">x2</td>
										<td class="pro_price">200000</td>

									</tr>
									<tr>
										<td class="pro_name"><img
											src="img/product/kem_chong_nang_sunplay.jpg" alt="">
											<h5>Kem chống nắng sunplay</h5></td>
										<td class="pro_quantity">x3</td>
										<td class="pro_price">200000</td>
									</tr>


								</tbody>

							</table>
							<div class="btn">
								<button class="btn_order_ag">Đặt lại</button>
								<button class="btn_review">Đánh giá</button>
							</div>

						</form>
						
					</div>

					<div id="new" class="tabcontent">
						<form class="order_item">
							<h4>Mã đơn: 1 | Ngày đặt hàng: 12/2/2022</h4>
							<table id="keywords" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th><span>Sản phẩm</span></th>
										<th><span>số lượng</span></th>
										<th><span>Giá tiền</span></th>

									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="pro_name"><img
											src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
											<h5>Tẩy trang Bioderma</h5></td>
										<td class="pro_quantity">x2</td>
										<td class="pro_price">200000</td>

									</tr>
									<tr>
										<td class="pro_name"><img
											src="img/product/kem_chong_nang_sunplay.jpg" alt="">
											<h5>Kem chống nắng sunplay</h5></td>
										<td class="pro_quantity">x3</td>
										<td class="pro_price">200000</td>
									</tr>


								</tbody>

							</table>
							<div class="btn">
								<button class="btn_order_ag">Đặt lại</button>
								<button class="btn_review">Hủy đơn</button>
							</div>

						</form>
						</div>

					<div id="processing" class="tabcontent">
					<form class="order_item">
							<h4>Mã đơn: 1 | Ngày đặt hàng: 12/2/2022</h4>
							<table id="keywords" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th><span>Sản phẩm</span></th>
										<th><span>số lượng</span></th>
										<th><span>Giá tiền</span></th>

									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="pro_name"><img
											src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
											<h5>Tẩy trang Bioderma</h5></td>
										<td class="pro_quantity">x2</td>
										<td class="pro_price">200000</td>

									</tr>
									<tr>
										<td class="pro_name"><img
											src="img/product/kem_chong_nang_sunplay.jpg" alt="">
											<h5>Kem chống nắng sunplay</h5></td>
										<td class="pro_quantity">x3</td>
										<td class="pro_price">200000</td>
									</tr>


								</tbody>

							</table>
							

						</form>
					</div>
					<div id="success" class="tabcontent">
						<form class="order_item">
							<h4>Mã đơn: 1 | Ngày đặt hàng: 12/2/2022</h4>
							<table id="keywords" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th><span>Sản phẩm</span></th>
										<th><span>số lượng</span></th>
										<th><span>Giá tiền</span></th>

									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="pro_name"><img
											src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
											<h5>Tẩy trang Bioderma</h5></td>
										<td class="pro_quantity">x2</td>
										<td class="pro_price">200000</td>

									</tr>
									<tr>
										<td class="pro_name"><img
											src="img/product/kem_chong_nang_sunplay.jpg" alt="">
											<h5>Kem chống nắng sunplay</h5></td>
										<td class="pro_quantity">x3</td>
										<td class="pro_price">200000</td>
									</tr>


								</tbody>

							</table>
							<div class="btn">
								<button class="btn_order_ag">Đặt lại</button>
								<button class="btn_review">Đánh giá</button>
							</div>

						</form>
					</div>
					<div id="cancel" class="tabcontent">
						<form class="order_item">
							<h4>Mã đơn: 1 | Ngày đặt hàng: 12/2/2022</h4>
							<table id="keywords" cellspacing="0" cellpadding="0">
								<thead>
									<tr>
										<th><span>Sản phẩm</span></th>
										<th><span>số lượng</span></th>
										<th><span>Giá tiền</span></th>

									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="pro_name"><img
											src="img/product/nuoc_tay_trang_bioderma.jpg" alt="">
											<h5>Tẩy trang Bioderma</h5></td>
										<td class="pro_quantity">x2</td>
										<td class="pro_price">200000</td>

									</tr>
									<tr>
										<td class="pro_name"><img
											src="img/product/kem_chong_nang_sunplay.jpg" alt="">
											<h5>Kem chống nắng sunplay</h5></td>
										<td class="pro_quantity">x3</td>
										<td class="pro_price">200000</td>
									</tr>


								</tbody>

							</table>
							<div class="btn">
								<button class="btn_order_ag">Đặt lại</button>
							</div>

						</form>
					</div>

				</div>
			</div>
	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>