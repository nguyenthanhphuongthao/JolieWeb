<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css" type="text/css">
<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
<script type="text/javascript">
	function dieu_huong1() {
		location.assign("thong-tin-tai-khoan");
	}
	function dieu_huong2() {
		location.assign("danh-sach-yeu-thich");
	}
</script>
<script type="text/javascript">
	function openTab(evt, tabName) {
		// Declare all variables
		var i, tabcontent, tablinks;

		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("contentlinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(tabName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>
<title>Quản lý đơn hàng | Jolie Cosmetics</title>
</head>
<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<section class="product spad">
		<div class="container">
			<div class="row">


				<div class="col-lg-3 col-md-5">
					<div class="sidebar__item_2">
						<h4>
							<strong>Quản lý tài khoản</strong>
						</h4>
						<!-- Tab links -->
						<div class="tabs">
							<button class="tablinks " onclick="dieu_huong1()">Thông
								tin tài khoản</button>
							<button class="tablinks_active" onclick="openTab(event, 'all')">Quản
								lý đơn hàng</button>
							<button class="tablinks" onclick="dieu_huong2()">Danh
								sách yêu thích</button>
						</div>
					</div>

				</div>
				<div class="col-lg-9">
					<!-- Tab links -->
					<div class="tiletab">
						<button class="contentlinks" onclick="openTab(event, 'new')">Mới
							đặt</button>
						<button class="contentlinks"
							onclick="openTab(event, 'processing')">Đang xử lý</button>
						<button class="contentlinks" onclick="openTab(event, 'success')">Thành
							công</button>
						<button class="contentlinks" onclick="openTab(event, 'cancel')">Đã
							hủy</button>
					</div>

					<!-- Tab content -->
					<div id="new" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.configByStatus.name == 'Mới đặt' }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
										| Trạng thái: ${b.billinfo.configByStatus.name }
									</h4>
									<table id="keywords">
										<thead>
											<tr>
												<th><span>Tên sản phẩm</span></th>
												<th><span>Số lượng</span></th>
												<th><span>Thành tiền</span></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dc" items="${b.detailcarts}">
												<tr>
													<td class="pro_name"><img
														src="${dc.product.media.fileName}"
														alt="">
														<h5>${dc.product.name}</h5></td>
													<td class="pro_quantity">${dc.quantity}</td>
													<td class="pro_price"><fmt:formatNumber type="number"
															maxFractionDigits="0" value="${dc.totalPrice}" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<a href="huy-don-hang-${b.billinfo.id}">Hủy đơn hàng</a>
										<a href="chi-tiet-don-hang-${b.billinfo.id}">Xem chi tiết</a>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>

					<div id="processing" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.configByStatus.name == 'Đang xử lý' }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
										| Trạng thái: ${b.billinfo.configByStatus.name }
									</h4>
									<table id="keywords">
										<thead>
											<tr>
												<th><span>Tên sản phẩm</span></th>
												<th><span>Số lượng</span></th>
												<th><span>Thành tiền</span></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dc" items="${b.detailcarts}">
												<tr>
													<td class="pro_name"><img
														src="${dc.product.media.folder}/${dc.product.media.fileName}"
														alt="">
														<h5>${dc.product.name}</h5></td>
													<td class="pro_quantity">${dc.quantity}</td>
													<td class="pro_price"><fmt:formatNumber type="number"
															maxFractionDigits="0" value="${dc.totalPrice}" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<a href="chi-tiet-don-hang-${b.billinfo.id}">Xem chi tiết</a>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>
					<div id="success" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.configByStatus.name == 'Thành công' }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
										| Trạng thái: ${b.billinfo.configByStatus.name }
									</h4>
									<table id="keywords">
										<thead>
											<tr>
												<th><span>Tên sản phẩm</span></th>
												<th><span>Số lượng</span></th>
												<th><span>Thành tiền</span></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dc" items="${b.detailcarts}">
												<tr>
													<td class="pro_name"><img
														src="${dc.product.media.folder}/${dc.product.media.fileName}"
														alt="">
														<h5>${dc.product.name}</h5></td>
													<td class="pro_quantity">${dc.quantity}</td>
													<td class="pro_price"><fmt:formatNumber type="number"
															maxFractionDigits="0" value="${dc.totalPrice}" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<a href="chi-tiet-don-hang-${b.billinfo.id}">Xem chi tiết</a>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>
					<div id="cancel" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.configByStatus.name == 'Đã hủy'}">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
										| Trạng thái: ${b.billinfo.configByStatus.name }
									</h4>
									<table id="keywords">
										<thead>
											<tr>
												<th><span>Tên sản phẩm</span></th>
												<th><span>Số lượng</span></th>
												<th><span>Thành tiền</span></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="dc" items="${b.detailcarts}">
												<tr>
													<td class="pro_name"><img
														src="${dc.product.media.folder}/${dc.product.media.fileName}"
														alt="">
														<h5>${dc.product.name}</h5></td>
													<td class="pro_quantity">${dc.quantity}</td>
													<td class="pro_price"><fmt:formatNumber type="number"
															maxFractionDigits="0" value="${dc.totalPrice}" /> VNĐ</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<a href="chi-tiet-don-hang-${b.billinfo.id}">Xem chi tiết</a>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>