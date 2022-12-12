<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<!DOCTYPE html>
<html lang="vn">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#datepicker").datepicker();
		});
	</script>
	<script>
        function dieu_huong1(){
            location.assign("don-hang");
        }
    </script>
    <script>
        function dieu_huong2(){
            location.assign("yeu-thich");
        }
    </script>
<title>Thông tin tài khoản | Jolie Cosmetics</title>

    <!-- Google Font -->

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
   	<link rel="stylesheet" href="css/mnAccount.css" type="text/css">
   	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include>
    <section class="product spad">
        <div class="container_edit">
            <div class="row2">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item_2">
                            <h4><strong>Quản lý tài khoản</strong></h4>
                             <!-- Tab links -->
							<div class="tabs">
								<button class="tablinks_active" data-electronic="allproducts" >Thông tin tài khoản</button>
								<button class="tablinks" data-electronic="Microcontrollers" onclick="dieu_huong1()">Quản lý đơn hàng</button>
								
								<button class="tablinks" data-electronic="module"> Danh sách sản phẩm yêu thích</button>
							</div>
						</div>
                       
                    </div>
                </div>
                <!-- Tab content -->
                <div class="wrapper_tabcontent">
                <div id="allproducts" class="tabcontent_active">
                     <form:form action="thong-tin" class="form" method="POST" modelAttribute="accountInfo">
                         <h6 ><b>Thông tin tài khoản</b></h6>
                         <div class="inputWithIcon">
                            <form:input path="account.username"  placeholder="tên đăng nhập" disabled="true"/>
                            <i class="fa fa-envelope fa-lg fa-fw" aria-hidden="true"></i>
                          </div>
                          
                         <div class="inputWithIcon">
                            <form:input path="name"  placeholder="Tên tài khoản"/>
                            <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
                          </div>
                          <div class="inputWithIcon">
                            <form:input path="address" placeholder="Địa chỉ"/>
                            <i class="fa fa-phone fa-lg fa-fw" aria-hidden="true"></i>
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
		                       <form:password path="account.password" placeholder="Nhập mật khẩu"/>
		                        <div class="underline"></div> 
		               		 </div> 
		               		   <div class="button_edit" >
                            <input type="submit" name="" value="Cập nhật">            
                          </div>
                     </form:form>
                     
              </div>
             
        </div>
        
    </section>
    <!-- Product Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
   
</body>

</html>