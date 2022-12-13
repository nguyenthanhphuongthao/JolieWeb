<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
if (session.getAttribute("alert") != "Đã tồn tại tài khoản với tên đăng nhập này") {
	session.removeAttribute("alert");
}
%>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/login-register.css" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script>
	function check_pass() {
		if (document.getElementById('password').value == document
				.getElementById('confirm_password').value) {
			document.getElementById('submit').disabled = false;
		    document.getElementById('message').innerHTML = '';
			
		} else {
			document.getElementById('submit').disabled = true;
			document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'Mật khẩu không khớp! Vui lòng xác nhận lại!';
		}
	}
</script>
<title>Đăng ký | Jolie Cosmetics</title>
</head>
<body>
	<div class="container" style="max-width: 410px;">
		<form:form action="dang-ky" method="POST" modelAttribute="accountInfo">
			<div class="back">
				<a href="dang-nhap" style="color:black;"><i class="fas fa-arrow-left" ></i> Đăng nhập</a>
			</div>
			<div class="home">
				<a href="trang-chu" style="color:black;"><i class="fa fa-home" ></i> Trang chủ</a>
			</div>
			<div class="title">Đăng ký</div>
			<div style="color: red;">${alert}</div>
			<div class="input-box underline">
				<form:input path="account.username" placeholder="Tên đăng nhập"
					required="true" />
				<div class="underline"></div>
			</div>
			<div class="input-box">
				<form:input path="name" placeholder="Tên tài khoản" required="true" />
				<div class="underline"></div>
				<form:errors path="name"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="account.password" placeholder="Mật khẩu"
					required="true" id="password" name="password"
					onkeyup="check_pass()" />
				<div class="underline"></div>

			</div>
			<div class="input-box">
				<form:password path="" placeholder="Nhập lại mật khẩu"
					required="true" id="confirm_password" name="confirm_password"
					onkeyup="check_pass()"></form:password>
				<div class="underline"></div>
			</div>
			<div style="padding: 15px 0px;">
			<span id="message" ></span>
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
				<input type="submit" name="submit" id="submit" value="Đăng ký" />
			</div>
		</form:form>
		<!-- <div class="option">Đăng nhập với</div>
		<div class="google">
			<a href="#"><i class="fab fa-google"></i>Google</a>
		</div>
		<div class="facebook">
			<a href="#"><i class="fab fa-facebook-f"></i>Facebook </a>
		</div> -->
	</div>
	<jsp:include page="footer.jsp"></jsp:include>