<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="vn">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script>
	function dieu_huong1() {
		location.assign("quan-ly-don-hang");
	}
</script>
<script>
	function dieu_huong2() {
		location.assign("danh-sach-yeu-thich");
	}
</script>
<title>Thông tin tài khoản | Jolie Cosmetics</title>
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item_2">
							<h4>
								<strong>Quản lý tài khoản</strong>
							</h4>
							<!-- Tab links -->
							<div class="tabs">
								<button class="tablinks_active">Thông tin tài khoản</button>
								<button class="tablinks" onclick="dieu_huong1()">Quản
									lý đơn hàng</button>
								<button class="tablinks" onclick="dieu_huong2()">Danh
									sách yêu thích</button>
							</div>
						</div>

					</div>
				</div>
				<!-- Tab content -->
				<div class="wrapper_tabcontent">
					<div id="allproducts" class="tabcontent_active">
						<form:form action="thong-tin-tai-khoan" class="form" method="POST"
							modelAttribute="accountInfo">
							<h6>
								<b>Thông tin tài khoản</b>
							</h6>
							<div class="inputWithIcon">
								<form:input path="account.username" placeholder="Tên đăng nhập"
									disabled="true" />
								<i class="fa fa-user-circle-o" aria-hidden="true"></i>
							</div>

							<div class="inputWithIcon">
								<form:input path="name" placeholder="Tên tài khoản"
									required="true" />
								<i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
							</div>
							<div class="inputWithIcon">
								<form:input path="address" placeholder="Địa chỉ" />
								<i class="fa fa-map-marker" aria-hidden="true"></i>
							</div>
							<div class="inputWithIcon">
								<form:input path="phone" placeholder="SĐT" />
								<i class="fa fa-phone" aria-hidden="true"></i>
							</div>
							<div class="inputWithIcon">
								<form:input path="email" placeholder="Email" />
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<div class="input-box">
								<h6>Ngày sinh</h6>
								<form:input id="datepicker" path="birth"/>
							</div>
							<div class="gender-box">
								<h6>Giới tính</h6>
								<div class="gender-option">
									<div class="input-sex">
										<form:radiobutton name="radioName" path="config.id" value="3"
											checked="checked" label="Nam" />
										<form:radiobutton name="radioName" path="config.id" value="4"
											label="Nữ" />
									</div>
								</div>
							</div>
							<div class="input-box">

								<label>Mật khẩu mới </label>
								<form:password path="account.password"
									placeholder="Nhập mật khẩu" />
								<div class="underline"></div>
							</div>
							<div class="button_edit">
								<input type="submit" name="" value="Cập nhật">
							</div>
						</form:form>

					</div>

				</div>
			</div>
		</div>
	</section>
	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>