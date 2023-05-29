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
<script>
	function checkUsername() {
	    var username = document.getElementById('username').value;
	    var regex = /^[a-zA-Z0-9_]+$/;
	
	    if (regex.test(username)) {
	        document.getElementById('submit').disabled = false;
	        document.getElementById('message').innerHTML = '';
	    } else {
	        document.getElementById('submit').disabled = true;
	        document.getElementById('message').style.color = 'red';
	        document.getElementById('message').innerHTML = 'Username không hợp lệ!';
	    }
	}
</script>
<title>Đăng nhập | Jolie Cosmetics</title>
</head>
<body>
	<div class="container">
		<form:form action="admin" method="POST" modelAttribute="account">
			<div class="title">Đăng nhập</div>
			<div style="color: red;">${alert }</div>
			<span id="message" ></span>
			<div class="input-box underline">
				<form:input path="username" id="username" onkeyup="checkUsername()" placeholder="Tên đăng nhập"
					required="true" maxlength="25"/>
				<div class="underline"></div>
			</div>
			<div class="input-box">
				<form:password path="password" placeholder="Nhập mật khẩu"
					required="true" />
				<div class="underline"></div>
			</div>

			<div class="input-box button">
				<input type="submit" name="" id="submit" value="Đăng nhập">
			</div>
		</form:form>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>