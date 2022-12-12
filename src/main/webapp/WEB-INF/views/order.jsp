<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css">
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
							<strong>Quản lý đơn hàng</strong>
						</h4>
						<!-- Tab links -->
						<div class="tabs">
							<button class="tablinks " onclick="dieu_huong1()">Thông
								tin tài khoản</button>
							<button class="tablinks_active" onclick="openTab(event, 'all')">Quản
								lý đơn hàng</button>
							<button class="tablinks" onclick="dieu_huong2()">Danh
								sách sản phẩm yêu thích</button>
						</div>
					</div>

				</div>
				<div class="col-lg-9">
					<!-- Tab links -->
					<div class="tiletab">
						<button class="contentlinks active"
							onclick="openTab(event, 'all')">Tất cả</button>
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
					<div id="all" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<form class="order_item">
								<h4>
									Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
									<fmt:formatDate value="${b.billinfo.datePayment}"
										pattern="dd-MM-yyyy HH:mm:ss" />
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
												<td class="pro_price">${dc.totalPrice}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:choose>
									<c:when test="${b.billinfo.status == 1 }">
										<div class="btn">
											<button class="btn_review">Hủy đơn</button>
										</div>
									</c:when>
									<c:when test="${b.billinfo.status == 2 }">
										<div class="btn">
											<button class="btn_view_info">Xem chi tiết đơn hàng</button>
										</div>
									</c:when>
									<c:when test="${b.billinfo.status == 3 }">
										<div class="btn">
											<button class="btn_order_ag">Đặt lại</button>
											<button class="btn_review">Đánh giá</button>
										</div>
									</c:when>
									<c:when test="${b.billinfo.status == 0 }">
										<div class="btn">
											<button class="btn_order_ag">Đặt lại</button>
										</div>
									</c:when>
								</c:choose>

							</form>
							<hr width="100%" align="left" color="#ddd" />
						</c:forEach>
					</div>

					<div id="new" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.status == 1 }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
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
													<td class="pro_price">${dc.totalPrice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<button class="btn_review">Hủy đơn</button>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>

					<div id="processing" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.status == 2 }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
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
													<td class="pro_price">${dc.totalPrice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>
					<div id="success" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.status == 3 }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
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
													<td class="pro_price">${dc.totalPrice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<button class="btn_order_ag">Đặt lại</button>
										<button class="btn_review">Đánh giá</button>
									</div>
								</form>
								<hr width="100%" align="left" color="#ddd" />
							</c:if>
						</c:forEach>
					</div>
					<div id="cancel" class="tabcontent">
						<c:forEach var="b" items="${listBill}">
							<c:if test="${b.billinfo.status == 0 }">
								<form class="order_item">
									<h4>
										Mã đơn: ${b.billinfo.id} | Ngày đặt hàng:
										<fmt:formatDate value="${b.billinfo.datePayment}"
											pattern="dd-MM-yyyy HH:mm:ss" />
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
													<td class="pro_price">${dc.totalPrice}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="btn">
										<button class="btn_order_ag">Đặt lại</button>
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