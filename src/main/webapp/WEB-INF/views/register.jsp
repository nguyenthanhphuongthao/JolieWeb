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
<script src="js/jquery-3.7.0.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script>
	function checkPassword() {
	    var password = document.getElementById('password').value;
	    var confirmPassword = document.getElementById('confirm_password').value;
	
	    if (password === confirmPassword) {
	        document.getElementById('submit').disabled = false;
	        document.getElementById('message').InnerText = '';
	    } else {
	        document.getElementById('submit').disabled = true;
	        document.getElementById('message').style.color = 'red';
	        document.getElementById('message').InnerText = 'Mật khẩu không khớp! Vui lòng xác nhận lại!';
	    }
	}
	
	function checkUsername() {
	    var username = document.getElementById('username').value;
	    var regex = /^[a-zA-Z0-9_]+$/;
	
	    if (regex.test(username)) {
	        document.getElementById('submit').disabled = false;
	        document.getElementById('message').InnerText = '';
	    } else {
	        document.getElementById('submit').disabled = true;
	        document.getElementById('message').style.color = 'red';
	        document.getElementById('message').InnerText = 'Tên đăng nhập không hợp lệ!';
	    }
	}
	
	function checkInput() {
	    var password = document.getElementById('password').value;
	    var confirmPassword = document.getElementById('confirm_password').value;
	    var username = document.getElementById('username').value;
	    var regex = /^[a-zA-Z0-9_]+$/;
	
	    if (regex.test(username) && password === confirmPassword && checkPasswordStrength()!= false) {
	        document.getElementById('submit').disabled = false;
	    } else {
	        document.getElementById('submit').disabled = true;
	    }
	}
	function checkPasswordStrength() {
	    var password = document.getElementById("password").value;
	    var passwordStrength = document.getElementById("passwordStrength");
	    var regex = /^[a-zA-Z0-9_]+$/;
	    
	    passwordStrength.style.color = 'red';
	    if (password.length < 6) {
	    	passwordStrength.InnerText = "Mật khẩu phải có ít nhất 6 ký tự";
	    	return false;
	    }
	    if (!/[A-Z]/.test(password)) {
	        passwordStrength.InnerText= "Mật khẩu phải chứa ít nhất một ký tự viết hoa";
	        return false;
	    }
	    if (!/[a-z]/.test(password)) {
	        passwordStrength.InnerText = "Mật khẩu phải chứa ít nhất một ký tự viết thường";
	        return false;
	    }
	    if (!/\d/.test(password)) {
	        passwordStrength.innerHTML = "Mật khẩu phải chứa ít nhất một chữ số";
	        return false;
	    }
	    if (regex.test(password)) {
	        passwordStrength.innerHTML = "Mật khẩu phải chứa ít nhất một ký tự đặc biệt";
	        return false;
	    }
	    
	    passwordStrength.style.color = 'green';
	    passwordStrength.innerHTML = "Mật khẩu mạnh";
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
                <form:input path="account.username" placeholder="Tên đăng nhập" required="true" id="username" onkeyup="checkUsername(); checkInput();" maxlength="25"/>
                <div class="underline"></div>
              <form:errors path="name"></form:errors>
            </div>
			<div class="input-box">
				<form:input path="name" placeholder="Tên tài khoản" required="true" />
				<div class="underline"></div>
				<form:errors path="name"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="account.password" placeholder="Mật khẩu"
					required="true" id="password" name="password"
					onkeyup=" checkInput();checkPasswordStrength();" maxlength="25"/>
				<div class="underline"></div>

			</div>
			<div class="input-box">
				<form:password path="" placeholder="Nhập lại mật khẩu"
					required="true" id="confirm_password" name="confirm_password"
					onkeyup="checkPassword(); checkInput();"></form:password>
				<div class="underline"></div>
			</div>
			<div style="padding: 15px 0px;">
			<span id="passwordStrength" style="display: inline-block;"></span>
			<span id="message" style="display: inline-block;"></span>
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
				<input type="submit" name="submit" id="submit" disabled value="Đăng ký" />
			</div>
		</form:form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>