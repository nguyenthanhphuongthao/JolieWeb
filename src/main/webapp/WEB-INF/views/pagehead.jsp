<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
					<ul>
						<c:forEach var="c" items="${listConfig}">
							<li><a href="#">${c.name}</a></li>
						</c:forEach>
					</ul>


					<!-- 	<li><a href="#">Mỹ phẩm High-end</a></li>
						<li><a href="#">Chăm sóc da mặt</a></li>
						<li><a href="#">Trang điểm</a></li>
						<li><a href="#">Chăm sóc tóc và da đầu</a></li>
						<li><a href="#">Chăm sóc cơ thể</a></li>
						<li><a href="#">Nước hoa</a></li>  -->

				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								All Categories <span class="arrow_carrot-down"></span>
							</div>
							<input type="text" placeholder="What do yo u need?">
							<button type="submit" class="site-btn">Tìm kiếm</button>
						</form>
					</div>
					<div class="header__cart">
						<ul>
							<li><a href="dang-nhap"><i class="fa fa-user"> Đăng
										nhập</i></a></li>
							<li><a href="gio-hang"><i class="fa fa-shopping-bag"></i><span>3</span></a></li>
							<li><a href="trang-chu"><i class="fa fa-sign-out"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>