<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

<title>Thanh toán | Jolie Cosmetics</title>
</head>

<body>
	<jsp:include page="pagehead.jsp"></jsp:include> 

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Đặt hàng</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            
                            <div id="checkout_col_left">
                    
                                <div id="box_thongtin_nhanhang" class="width_common checkout_block">
                                    
                                    <div class="title_block_checkout width_common">
                                        <div class="left"><strong>Thông tin nhận hàng</strong></div>
                
                                    </div>
                                    <div class="content_thongtin width_common space_bottom_10">
                                        <div class="space_bottom_5"><strong>Nguyet Que</strong> -
                                            0342596563</div>
                                        <div class="txt_666">vabeike, Phường Nguyễn Thái Bình, Quận 1, Hồ Chí Minh</div>
                                    </div>
                                    <div class="field form-group">
                                        <div class="txt_form space_bottom_5"><b>Ghi chú</b></div>
                                        <div class="control"><textarea class="form-control" placeholder="Nhập ghi chú (nếu có)"
                                                name="formAddress.customerNote"></textarea>
                                        </div>
                                    </div>
                                </div>
                        
                                <div id="box_hinhthuc_vanchuyen" class="width_common checkout_block">
                                    <div class="title_block_checkout width_common">
                                        <div class="left"><strong>Hình thức vận chuyển</strong></div>
                                    </div>
                                    <div class="content_thongtin width_common">
                                        <div class="item_diachi_nhanhang width_common relative active ">
                                            <div class="space_bottom_5">
                                                <div>
                                                <label for="acc">
                                                
                                                    <input type="radio" id="acc">
                                                    <span><span style="color: #fe6700;"></span> Giao trong vòng 48 giờ
                                                   </span></span>:&nbsp;<strong><span class="price"><span class="price">0
                                                    đ</span></span></strong>
                                                  </span>
                                                </label>
                                            </div>
                                            <div>
                                                <label for="acc">
                                                    <input type="radio" id="acc">
                                                    <span>Giao hỏa tốc</span>:&nbsp;<strong><span class="price"><span
                                                    class="price">0 đ</span></span></strong><span></span></div>
                                                </label>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div id="box_phuongthuc_thanhtoan" class="width_common checkout_block">
                                    <div class="title_block_checkout width_common">
                                        <div class="left"><strong>Phương thức thanh toán</strong></div>
                                    </div>
                                    <div class="content_thongtin width_common">
                                        <div class="item_diachi_nhanhang width_common relative active">
                                            <div class="space_bottom_5">
                                                <input type="radio" id="acc">Thanh toán tiền khi nhận hàng (COD)</div>                                           
                                        </div>
                                        <div class="dotvnpay item_diachi_nhanhang width_common relative false">
                                            <div class="space_bottom_5">
                                                <input type="radio" id="acc">Thanh toán qua e - banking</div>
                                        </div>
                                    </div>
                                </div>  
                            </div>
                        </div>
                        <div id="checkout_col_right"></div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Đơn hàng của bạn</h4>
                                <div class="checkout__order__products">Sản phẩm <span>Thành tiền</span></div>
                                <ul>
                                    <li>Vegetable’s Package <span>$75.99</span></li>
                                    <li>Fresh Vegetable <span>$151.99</span></li>
                                    <li>Organic Bananas <span>$53.99</span></li>
                                </ul>
                                <div class="checkout__order__subtotal"> Tạm tính<span>$750.99</span></div>
                                <div class="checkout__order__subtotal"> Giảm giá<span>$50.99</span></div>
                                <div class="checkout__order__total">Tổng cộng <span>$70.99</span></div>
                                <div class="checkout__input__checkbox">
                                    
                                </div>
                                
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

	<jsp:include page="pagefoot.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>