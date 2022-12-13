<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>Chi tiết sản phẩm | Jolie Cosmetics</title>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${detailProduct.media.folder}/${detailProduct.media.fileName}"
								alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${detailProduct.name }</h3>
						<div class="product__details__price">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								value="${detailProduct.price}" />
							VNĐ
						</div>
						<a href="them-vao-gio-hang-${detailProduct.id}"
							class="primary-btn">Thêm vào giỏ hàng</a> <a
							href="them-vao-danh-sach-yeu-thich-${detailProduct.id}" class="heart-icon"><span
							class="icon_heart_alt"></span></a>
						<ul>
							<c:choose>
								<c:when test="${detailProduct.inventory > 0 }">
									<li><b>Trạng thái:</b> <span>Còn hàng</span></li>
								</c:when>
								<c:when test="${detailProduct.inventory == 0 }">
									<li><b>Trạng thái:</b> <span style="color: red;">Hết
											hàng</span></li>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Mô
									tả</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Thông tin
									sản phẩm</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<p>${detailProduct.description}</p>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<table class="tb_info_sanpham" cellspacing="0" cellpadding="0"
										border="0">
										<tbody>
											<tr>
												<td class="col_tb_info_sp bg_info_sp">Barcode</td>
												<td>${detailProduct.id}</td>
											</tr>
											<tr>
												<td class="col_tb_info_sp bg_info_sp">Thương Hiệu</td>
												<td>${detailProduct.configByBrand.name}</td>
											</tr>
											<tr>
												<td class="col_tb_info_sp bg_info_sp">Nơi sản xuất</td>
												<td>${detailProduct.origin}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>