<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/login-register.css" type="text/css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

<title>Đăng ký | Jolie Cosmetics</title>
</head>
<body>
	<div class="container">
		<form:form action="dang-ky" method="POST" modelAttribute="accountInfo">

			<div class="title">Đăng ký</div>

			<div class="input-box underline">
				<form:input path="account.username" placeholder="Nhập Email/SĐT"
					required="true" />
				<div class="underline"></div>
			</div>
			<div class="input-box">
				<form:input path="name" placeholder="Tên tài khoản" required="true" />
				<div class="underline"></div>
				<form:errors path="name"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="account.password" placeholder="Nhập mật khẩu"
					required="true" />
				<div class="underline"></div>
				<form:errors path="account.password"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="" placeholder="Nhập lại mật khẩu"
					required="true"></form:password>
				<div class="underline"></div>
			</div>
			<div>
				Ngày sinh:
				<form:input id="datepicker" path="birth" required="true" />
			</div>
			<div class="input-sex">
				Giới tính:
				<form:radiobutton name="radioName" path="config.id" value="3"
					checked="checked" label="Nam" />
				<form:radiobutton name="radioName" path="config.id" value="4"
					label="Nữ" />
			</div>

			<div class="input-box button">
				<input type="submit" name="" value="Đăng ký" />
			</div>
		</form:form>
		<div class="option">Đăng nhập với</div>
		<div class="google">
			<a href="#"><i class="fab fa-google"></i>Google</a>
		</div>
		<div class="facebook">
			<a href="#"><i class="fab fa-facebook-f"></i>Facebook </a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>