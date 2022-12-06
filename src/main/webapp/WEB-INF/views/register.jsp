<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="css/login-register.css" type="text/css">


<title>Đăng ký | Jolie Cosmetics</title>
</head>
<body>
	<div class="container">
		<form:form action="dang-ky-ing" method ="POST" modelAttribute = "AccountInfo">
		
			<div class="title">Đăng ký</div>
			
			<div class="input-box underline">
				<form:input  path="account.username" placeholder="Nhập Email/SĐT" />
				 <div class="underline"></div>
			</div>
			<div class="input-box">
				<form:input path="name"  placeholder="Tên tài khoản" />
				<div class="underline"></div>
				 <form:errors path="name"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="account.password" placeholder="Nhập mật khẩu" />
				<div class="underline"></div>
				 <form:errors path="account.password"></form:errors>
			</div>
			<div class="input-box">
				<form:password path="account.password" placeholder="Nhập lại mật khẩu" ></form:password>
				<div class="underline"></div>
			</div>

			<div class="input-date">
				<form action="#">
					Ngày sinh: <span> <input type="date" path="birth" name="bday"></input>
					</span>
				</form>
			</div>

			<form class="input-sex">
				Giới tính: <span> <form:radiobutton path="config.name"  value="male"
					label="Nam"/> 
				</span> <span> <form:radiobutton path="config.name" value="female" label="Nữ"/>
				
				</span>
			</form>

			<div class="input-box button">
			<a href="trang-chu">	<input type="Submit" name ="" value="Đăng ký"/></a>	
		
				
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