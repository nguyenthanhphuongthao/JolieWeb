<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
  <link rel="stylesheet" href="css/login-register.css" type="text/css">
  

<title>Đăng nhập | Jolie Cosmetics</title>
</head>
<body>
  <div class="container">
    <form action="#">
      <div class="title">Đăng nhập</div>
      <div class="input-box underline">
        <input type="text" placeholder="Nhập Email/SĐT" required>
        <div class="underline"></div>
      </div>
      <div class="input-box">
        <input type="password" placeholder="Nhập mật khẩu" required>
        <div class="underline"></div>
      </div>

      <div class="input-box button">
        <input type="submit" name="" value="Đăng nhập">
      </div>
    </form>
    <div class="option">Đăng nhập với</div>
    <div class="google">
      <a href="#"><i class="fab fa-google"></i>Google</a>
    </div>
    <div class="facebook">
      <a href="#"><i class="fab fa-facebook-f"></i>Facebook </a>
    </div>
    <div class="question">Bạn bạn chưa có tài khoản?
          <a href="dang-ky">ĐĂNG KÝ NGAY </a>
	</div>
  </div>
<jsp:include page="footer.jsp"></jsp:include>