<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css" type="text/css">
<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
<link rel="stylesheet" href="css/homeadmin.css" type="text/css">
<title>Chi tiết đơn hàng</title>
</head>
<body>
<section class="featured spad">
	<div class="container">
	<div class ="row">
	<div class="col-sm-3">
		<h4><strong>Detail Bill</strong></h4>
		</div>
		<div class="col-sm-3">
		<c:if test="${billinfo.configByStatus.name == 'Mới đặt' }">
			<div class ="row">
				<div class="col-sm-6">
					<form action="update-new-bill" method="POST" >
						<input type="hidden" name="id" value="${billinfo.id}">
						<input type="submit" value="Update">
					</form>
					</div>
					<div class="col-sm-6">
					<form action="cancel-bill" method="POST" >
						<input type="hidden" name="id" value="${billinfo.id}">
						<input type="submit" value="Cancel">
					</form>
					</div>
				</div>
				</c:if>
				<c:if test="${billinfo.configByStatus.name == 'Đang xử lý' }">
				<form action="update-processing-bill" method="POST" style="width: 40%">
					<input type="hidden" name="id" value="${billinfo.id}">
					<input type="submit" value="Update">
				</form>
				</c:if>
		</div>
	</div>
		
		<form class="infoBill">
			<div class="row">
				<div class="col-md-4">
					<h5>
						<strong>Id: </strong>${billinfo.id}
					</h5>
					<h5>
						<strong>Date: </strong>
						<fmt:formatDate value="${billinfo.datePayment}"
							pattern="dd-MM-yyyy HH:mm:ss" />
					</h5>
					<h5><strong>Status: </strong> ${billinfo.configByStatus.name}</h5>
				</div>
				<div class="col-md-4">
					<h5>
						<strong>Shipment Details</strong>
					</h5>
					<h5>${billinfo.recipientName}</h5>
					<h5>${billinfo.recipientPhone}</h5>
					<h5>${billinfo.shippingAddress}</h5>
				</div>
				<div class="col-md-4">
					<h5>
						<strong>Payment method</strong>
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
						<strong>Shipping method</strong>
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
						<th><span>Product</span></th>
						<th><span>Price</span></th>
						<th><span>Number</span></th>
						<th><span>Total</span></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="c" items="${listProductBill}">
						<tr>
							<td class="pro_name"><img
								src="${c.product.media.fileName}"
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
					<strong>Total bill: </strong>
					<fmt:formatNumber type="number" maxFractionDigits="0"
						value="${cart.totalPrice}" /> VNĐ
				</h6>
			</div>
			<hr width="100%" align="left" />
		</form>
	
					                            
	</div>
</section>
</body>
</html>