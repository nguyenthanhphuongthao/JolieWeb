<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>
 <link rel="stylesheet" href="css/login-register.css" type="text/css">
  

<title>Đăng ký | Jolie Cosmetics</title>
</head>
<body>
    <div class="container">
      <form action="#">
        <div class="title">Đăng ký</div>
        <div class="input-box underline">
          <input type="text" placeholder="Nhập Email/SĐT" required>
          <div class="underline"></div>
        </div>
        <div class="input-box">
            <input type="text" placeholder="Tên tài khoản" required>
            <div class="underline"></div>
          </div>
        <div class="input-box">
          <input type="password" placeholder="Nhập mật khẩu" required>
          <div class="underline"></div>
        </div>
        <div class="input-box">
            <input type="password" placeholder="Nhập lại mật khẩu" required>
            <div class="underline"></div>
          </div>
        
        <div class="input-date">
          <form action="/demo/action_page.php">           
              Ngày sinh:
              <span>
              <input type="date" name="bday">
            </span>
           
            </form>
        </div> 
  
          <form class="input-sex">
            Giới tính: 
            <span>
            <input type="radio" name="sex" value="male" checked> Nam</span>
            <span>
              <input type="radio" name="sex" value="female"> Nữ
            </span>       
          </form>

        <div class="input-box button">
          <input type="submit" name="" value="Đăng Ký">
        </div>
      </form>
        <div class="option">Đăng nhập với</div>
        <div class="google">
          <a href="#"><i class="fab fa-google"></i>Google</a>
        </div>
        <div class="facebook">
          <a href="#"><i class="fab fa-facebook-f"></i>Facebook </a>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>