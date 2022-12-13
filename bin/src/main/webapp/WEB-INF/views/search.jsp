<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>Sản phẩm | Jolie Cosmetics</title>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="pagehead.jsp"></jsp:include>

	<!-- Product Section Begin -->
	<section class="spad featured">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item featured__controls">
							<h4>Danh mục</h4>
							<ul>
								<li class="active" data-filter="*">All</li>
								<c:forEach var="c" items="${listCategory}">
									<li data-filter=".${c.value}">${c.name}</li>
								</c:forEach>
							</ul>
						</div>
						<!-- <div class="sidebar__item">
							<div class="latest-product__text">
								<h4>Latest Products</h4>
								<div class="latest-product__slider owl-carousel">
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-1.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-2.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a> <a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="img/latest-product/lp-3.jpg" alt="">
											</div>
											<div class="latest-product__item__text">
												<h6>Crab Pool Security</h6>
												<span>$30.00</span>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="row featured__filter">
						<c:forEach var="c" items="${listProduct}">
							<div
								class="col-lg-4 col-md-6 col-sm-6 mix ${c.configByCategory.value} }">
								<div class="featured__item">
									<div class="featured__item__pic set-bg"
										data-setbg="${c.media.folder}/${c.media.fileName}">
										<ul class="featured__item__pic__hover">
											<li><a href="them-vao-danh-sach-yeu-thich-${c.id}"><i class="fa fa-heart"></i></a></li>
											<li><a href="them-vao-gio-hang-${c.id}"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="featured__item__text">
										<h6>
											<a href="chi-tiet-san-pham-${c.id }">${c.name}</a>
										</h6>
										<h5>
											<fmt:formatNumber type="number" maxFractionDigits="0"
												value="${c.price}" /> VNĐ
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="product__pagination">
						<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>