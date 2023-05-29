<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css" type="text/css">
<title>Giỏ hàng | Jolie Cosmetics</title>
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" style="padding: 0px 0 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2 style="color:black;">Giỏ hàng</h2>
					</div>
						<span id="message" style="display: inline-block;  color: red;">${alert}</span>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<form:form>
							<table>
								<thead>
									<tr>
										<th class="shoping__product">Sản phẩm</th>
										<th>Giá</th>
										<th>Số lượng</th>
										<th>Thành tiền</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${listCart}">
										<tr>
											<td class="shoping__cart__item"><img
												src="${c.product.media.fileName}"
												alt="">
												<h5>${c.product.name}</h5></td>
											<td class="shoping__cart__price"><fmt:formatNumber
													type="number" maxFractionDigits="0"
													value="${c.product.price}" /> VNĐ</td>
											<td class="shoping__cart__quantity">
												<div>
													<div>
														<a href="giam-so-luong-san-pham-${c.product.id}"><span>
																<i class="fa fa-minus" style="color: black;"></i>
														</span></a><input value="${c.quantity}" style="width: 30%;" disabled />
														<a href="them-vao-gio-hang-${c.product.id}"><span>
																<i class="fa fa-plus" style="color: black;"></i>
														</span></a>
													</div>
												</div>
											</td>
											<td class="shoping__cart__total"><fmt:formatNumber
													type="number" maxFractionDigits="0" value="${c.totalPrice}" />
												VNĐ</td>
											<td class="shoping__cart__item__close"><a
												href="xoa-san-pham-${c.product.id}"><span
													class="icon_close"></span></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form:form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="trang-chu" class="primary-btn cart-btn">Tiếp tục mua
							hàng</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>Tổng giá trị giỏ hàng</h5>
						<ul>
							<li>Tổng giá trị <span><fmt:formatNumber type="number"
										maxFractionDigits="0" value="${cart.totalPrice}" /> VNĐ</span></li>
						</ul>
						<a href="thanh-toan" class="primary-btn">Tiến hành thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>