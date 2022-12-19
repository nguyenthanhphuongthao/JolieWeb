<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Header Section Begin -->
<header class="header">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="trang-chu"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>Danh mục</span>
					</div>
					<ul style="display: none;">
						<c:forEach var="c" items="${listCategory}">
							<li><a href="danh-muc-${c.value }">${c.name}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form:form action="tim-kiem" modelAttribute="product">
							<form:input path="name"
								placeholder="Bạn muốn tìm kiếm sản phẩm nào?" />
							<button type="submit" class="site-btn">Tìm kiếm</button>
						</form:form>
					</div>
					<div class="header__cart">
						<ul>
							<c:choose>
								<c:when test="${loginAccount.name == null}">
									<li><a href="dang-nhap"><i class="fa fa-user"> Đăng nhập</i></a></li>
								</c:when>
								<c:when test="${loginAccount.name != null}">
									<li><a href="thong-tin-tai-khoan"><i class="fa fa-user"> ${loginAccount.name}</i></a></li>
									<li><a href="gio-hang"><i class="fa fa-shopping-bag"></i><span>${numDetailcart}</span></a></li>
									<li><a href="dang-xuat"><i class="fa fa-sign-out"></i></a></li>
								</c:when>
							</c:choose>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>