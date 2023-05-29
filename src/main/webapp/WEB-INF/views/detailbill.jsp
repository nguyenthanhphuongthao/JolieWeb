<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css" type="text/css">
<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
<title>Chi tiết đơn hàng | Jolie Cosmetics</title>
</head>

<body></body>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>
<jsp:include page="pagehead.jsp"></jsp:include>

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		<h4><strong>Chi tiết đơn hàng</strong></h4>
		<form class="infoBill">
			<div class="row">
				<div class="col-md-4">
					<h5>
						<strong>Mã đơn hàng: </strong>${billinfo.id}
					</h5>
					<h5>
						<strong>Ngày đặt: </strong>
						<fmt:formatDate value="${billinfo.datePayment}"
							pattern="dd-MM-yyyy HH:mm:ss" />
					</h5>
					<h5><strong>Trạng thái: </strong> ${billinfo.configByStatus.name}</h5>
				</div>
				<div class="col-md-4">
					<h5>
						<strong>Thông tin giao hàng</strong>
					</h5>
					<h5>${billinfo.recipientName}</h5>
					<h5>${billinfo.recipientPhone}</h5>
					<h5>${billinfo.shippingAddress}</h5>
				</div>
				<div class="col-md-4">
					<h5>
						<strong>Phương thức thanh toán</strong>
					</h5>
					<c:choose>
						<c:when test="${billinfo.configByPaymentMethod.id == 8}">
							<h5>Thanh toán khi nhận hàng</h5>
						</c:when>
						<c:when test="${billinfo.configByPaymentMethod.id == 9}">
							<h5>Thanh toán bằng e - banking</h5>
						</c:when>
					</c:choose>
					<h5>
						<strong>Hình thức vận chuyển</strong>
					</h5>
					<c:choose>
						<c:when test="${billinfo.configByShippingMethod.id == 11}">
							<h5>Giao trong 48h</h5>
						</c:when>
						<c:when test="${billinfo.configByShippingMethod.id == 10}">
							<h5>Giao hỏa tốc</h5>
						</c:when>
					</c:choose>
				</div>

			</div>

		</form>
		<form class="order_item">
			<table id="keywords">
				<thead>
					<tr>
						<th><span>Sản phẩm</span></th>
						<th><span>Đơn giá</span></th>
						<th><span>Số lượng</span></th>
						<th><span>Tạm tính</span></th>
						<th><span></span></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${listProductBill}">
						<tr>
							<td class="pro_name"><img
								src="${c.product.media.folder}/${c.product.media.fileName}"
								alt="">
								<h5>${c.product.name}</h5></td>
							<td class="pro_price"><fmt:formatNumber type="number"
									maxFractionDigits="0" value="${c.product.price}" /> VNĐ</td>
							<td class="pro_quantity">${c.quantity}</td>
							<td class="pro_price"><fmt:formatNumber type="number"
									maxFractionDigits="0" value="${c.totalPrice}" /> VNĐ</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: right;">
				<h6>
					<strong>Tổng giá trị: </strong>
					<fmt:formatNumber type="number" maxFractionDigits="0"
						value="${cart.totalPrice}" /> VNĐ
				</h6>
			</div>
			<hr width="100%" align="left" />
		</form>
		<div style="text-align: center">
			<i class="fa fa-angle-double-left" aria-hidden="true"></i><a
				href="quan-ly-don-hang" style="font-size: 13px; color: black;">
				Quay lại Trang Quản lý đơn hàng</a>
		</div>
	</div>
</section>

<jsp:include page="pagefoot.jsp"></jsp:include>

<jsp:include page="footer.jsp"></jsp:include>