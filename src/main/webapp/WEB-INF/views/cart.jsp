<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Giỏ hàng | Jolie Cosmetics</title>
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Giỏ hàng</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
		<div style="font-size: 20px; color: red; margin-bottom: 10px;"><strong>${alert}</strong></div>
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
												src="${c.product.media.folder}/${c.product.media.fileName}"
												alt="">
												<h5>${c.product.name}</h5></td>
											<td class="shoping__cart__price">${c.product.price}</td>
											<td class="shoping__cart__quantity">
												<div>
													<div>
														<a href="giam-so-luong-san-pham-${c.product.id}"><span>
															<i class="fa fa-minus"></i> </span></a><input value="${c.quantity}" style="width: 30%;" disabled />
														<a href="them-vao-gio-hang-${c.product.id}"><span> 
															<i class="fa fa-plus"></i>
														</span></a>
													</div>
												</div>
											</td>
											<td class="shoping__cart__total">${c.totalPrice}</td>
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
						<h5>Cart Total</h5>
						<ul>
							<li>Total <span>${cart.totalPrice}</span></li>
						</ul>
						<a href="thanh-toan" class="primary-btn">Tiến hành thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>