<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css" type="text/css">
 

<title>Thanh toán | Jolie Cosmetics</title>
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include>

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			
				<div class="checkout__form">
					<h4>Đặt hàng</h4>
					<form:form action="thanh-toan" method="POST" modelAttribute="billInfo">
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div id="checkout_col_left" class="check_out">

									<div class="info">
										<strong>  Thông tin nhận hàng</strong>
											<span id="message" style="display: inline-block; color: red;">${messageShipInfo}</span>
										<div>
											<form:label path="">Tên người nhận: </form:label>
											<br>
											<form:input path="recipientName"
												placeholder=" Tên người nhận" required="true" />
										</div>
										<div>
											<form:label path="">Số điện thoại người nhận: </form:label>
											<br>
											<form:input path="recipientPhone" id="phoneNumber"
												placeholder=" Số điện thoại người nhận" required="true" onkeyup="isValidPhoneNumber()" />
										</div>
										<div>
											<form:label path="">Địa chị nhận hàng: </form:label>
											<br>
											<form:input path="shippingAddress" placeholder=" Địa chị nhận hàng"
												required="true" />
										</div>
									</div>
									<div class="shipper">
										<strong>  Hình thức vận chuyển</strong>
										<div>
											<form:radiobutton path="configByShippingMethod.id" name="shipmethod" value="11"
												checked="checked" label=" Giao trong vòng 48 giờ: 0 đ" />
										</div>
										<div>
											<form:radiobutton path="configByShippingMethod.id" name="shipmethod" value="10"
												label=" Giao hỏa tốc: 0 đ" />
										</div>
									</div>
									<div class="payment">
									
											<strong>  Phương thức thanh toán</strong>
									
										<div>
											<form:radiobutton path="configByPaymentMethod.id" name="payment" value="8"
												checked="checked" label=" Thanh toán khi nhận hàng (COD)" />
										</div>
										<div>
											<form:radiobutton path="configByPaymentMethod.id" name="payment" value="9"
												label=" Thanh toán qua e-banking" />
										</div>
									</div>

								</div>
							</div>
							<div id="checkout_col_right"></div>
							<div class="col-lg-4 col-md-6">
								<div class="checkout__order">
									<h4>Đơn hàng của bạn</h4>
									<div class="checkout__order__products">
										Sản phẩm <span>Thành tiền</span>
									</div>
									<ul>
										<c:forEach var="c" items="${listCart}">
											<li>${c.product.name}<span><fmt:formatNumber type="number" maxFractionDigits="0"
										value="${c.totalPrice}" /> VNĐ</span></li>
										</c:forEach>
									</ul>
									<div class="checkout__order__total">
										Tổng cộng <span> <fmt:formatNumber type="number" maxFractionDigits="0"
										value="${cart.totalPrice}" /> VNĐ</span>
									</div>
									<div class="checkout__input__checkbox"></div>

									<input type="submit" class="site-btn" value="Thanh toán">
								</div>
							</div>
						</div>
					</form:form>
				</div>
			
		</div>
	</section>
	<!-- Checkout Section End -->

	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>