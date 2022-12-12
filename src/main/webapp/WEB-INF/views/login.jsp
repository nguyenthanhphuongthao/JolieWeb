<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
if (session.getAttribute("alert") != "Sai tên đăng nhập hoặc mật khẩu!") {
	session.removeAttribute("alert");
}
%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/login-register.css" type="text/css">

<title>Đăng nhập | Jolie Cosmetics</title>
</head>
<body>
	<div class="container">
		<form:form action="dang-nhap" method="POST" modelAttribute="account">
			<div class="title">Đăng nhập</div>
			<div style="color: red;">${alert }</div>
			<div class="input-box underline">
				<form:input path="username" placeholder="Nhập Email/SĐT"
					required="true" />
				<div class="underline"></div>
			</div>
			<div class="input-box">
				<form:password path="password" placeholder="Nhập mật khẩu"
					required="true" />
				<div class="underline"></div>
			</div>

			<div class="input-box button">
				<input type="submit" name="" value="Đăng nhập">
			</div>
		</form:form>
		<div class="option">Đăng nhập với</div>
		<div class="google">
			<a href="#"><i class="fab fa-google"></i>Google</a>
		</div>
		<div class="facebook">
			<a href="#"><i class="fab fa-facebook-f"></i>Facebook </a>
		</div>
		<div class="question">
			Bạn bạn chưa có tài khoản? <a href="dang-ky">ĐĂNG KÝ NGAY </a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>