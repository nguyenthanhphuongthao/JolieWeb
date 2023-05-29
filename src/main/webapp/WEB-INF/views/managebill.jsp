<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>

<meta charset="ISO-8859-1">
<title>Đơn hàng | Admin</title>
<script>
	function dieu_huong1() {
		location.assign("home-admin");
	}
	function dieu_huong2() {
		location.assign("manage-bill");
	}
	function openTab(evt, tabName) {
		// Declare all variables
		var i, tabcontent, tablinks;

		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("contentlinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(tabName).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>

<link rel="stylesheet" href="css/homeadmin.css" type="text/css">

</head>
<body style="margin-left: 5%;margin-right: 5%;">
	<div class="row">
  <div class="col-sm-4">
  		<div class="sidebar">
			<div class="sidebar__item_2">
				<h4>
					<strong>Quản lý đơn hàng</strong>
				</h4>
				<!-- Tab links -->
					
					</div>
				</div>
				</div>
  				<div class="col-sm-4">
  				<div class="tabs">
						<button class="tablinks" onclick="dieu_huong1()">Tất cả sản phẩm</button>
						<button class="tablinks_active" onclick="dieu_huong2()">Quản lý đơn hàng</button>
					</div>
					<br></br>
					<div class="tiletab">
						<button class="contentlinks" onclick="openTab(event, 'new')" style="width: 24%%;">Mới
							đặt</button>
							
						<button class="contentlinks"
							onclick="openTab(event, 'processing')" style="width: 24%%;">Đang xử lý</button>
							
						<button class="contentlinks" onclick="openTab(event, 'success')" style="width: 24%%;">Thành
							công</button>
						<button class="contentlinks" onclick="openTab(event, 'cancel')" style="width: 24%%;">Đã
							hủy</button>
					</div>
  				</div>
 			 		<div class="col-sm-4">
 			 			<a href="logout" style="color:black;right: 5%;position: absolute;color:black;">Logout <i class="fa fa-sign-out"></i></a>
	 			 		
				</div>
				</div>
				<div>
					<div id="new" class="tabcontent">
					 <div class="x_content">
					 <h4>Mới đặt</h4>             
					          <div class="table-responsive">
					              <table class="table table-striped jambo_table bulk_action">
					                 <thead>
					                    <tr class="headings">                           
					                        <th class="column-title">ID</th>
					                        <th class="column-title">User Name</th>
					                        <th class="column-title">Phone Number</th>
					                        <th class="column-title">Address</th>           
					                        <th class="column-title">Total Price</th>
					                        <th class="column-title">Status</th>
					                        <th class="column-title">Update</th>
					                        <th class="column-title">Cancel</th>
					                        <th class="column-title">See Detail</th>
					                     </tr>
					                  </thead>
					                  <c:forEach var="b" items="${listBill}">
										<c:if test="${b.configByStatus.name == 'Mới đặt' }">
					                        <tbody>
					                          <tr class="even pointer">
					                            <td class=" ">${b.id}</td>
					                            <td class=" ">${b.recipientName}</td>
					                            <td class=" ">${b.recipientPhone}</td>
					                            <td class=" ">${b.shippingAddress}</td>
					                            <td class=" "><fmt:formatNumber type="number" maxFractionDigits="0" value="${b.totalPrice}" /></td>  
					                            <td class=" ">${b.configByStatus.name}</td>
					                            <td class=" ">
								                    <form action="update-new-bill" method="POST">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Update">
								                    </form>
								                </td>
								                <td class=" ">
								                    <form action="cancel-bill" method="POST">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Cancel">
								                    </form>
								                </td>
								                <td class=" ">
								                    <form action="detail-bill" method="GET">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Detail">
								                    </form>
								                </td>
					                            </tr>
					                          </tbody>
					                    </c:if>
					                  </c:forEach>
					                 </table>
					            </div>
					       </div>
					    </div>
					<div id="processing" class="tabcontent">
					     <div class="x_content">
					     <h4>Đang xử lý</h4>           
					          <div class="table-responsive">
					              <table class="table table-striped jambo_table bulk_action">
					                 <thead>
					                    <tr class="headings">                           
					                        <th class="column-title">ID</th>
					                        <th class="column-title">User Name </th>
					                        <th class="column-title">Phone Number</th>
					                        <th class="column-title">Address</th>         
					                        <th class="column-title">Total Price</th>
					                        <th class="column-title">Status</th>
					                        <th class="column-title">Update</th>
					                        <th class="column-title">See Detail</th>           
					                      </tr>
					                  </thead>
					                  <c:forEach var="b" items="${listBill}">
					                  	<c:if test="${b.configByStatus.name == 'Đang xử lý' }">
					                        <tbody>
					                          <tr class="even pointer">
					                            <td class=" ">${b.id}</td>
					                            <td class=" ">${b.recipientName}</td>
					                            <td class=" ">${b.recipientPhone}</td>
					                            <td class=" ">${b.shippingAddress}</td>
					                            <td class=" "><fmt:formatNumber type="number" maxFractionDigits="0" value="${b.totalPrice}" /></td>  
					                            <td class=" ">${b.configByStatus.name}</td>
					                            <td class=" ">
								                    <form action="update-processing-bill" method="POST">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Update">
								                    </form>
								                </td>
								                <td class=" ">
								                    <form action="detail-bill" method="GET">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Detail">
								                    </form>
								                </td>
					                            </tr>
					                          </tbody>
					                    </c:if>
					                    </c:forEach>
					                 </table>
					            </div>
					       </div>
					    </div>
					<div id="success" class="tabcontent">
					     <div class="x_content">    
					     <h4>Thành công</h4>         
					          <div class="table-responsive">
					              <table class="table table-striped jambo_table bulk_action">
					                 <thead>
					                    <tr class="headings">                           
					                        <th class="column-title">ID</th>
					                        <th class="column-title">User Name</th>
					                        <th class="column-title">Phone Number</th>
					                        <th class="column-title">Address</th>           
					                        <th class="column-title">Total Price</th>
					                        <th class="column-title">Status</th>
					                        <th class="column-title">See Detail</th>           
					                      </tr>
					                  </thead>
					                  <c:forEach var="b" items="${listBill}">
					                  <c:if test="${b.configByStatus.name == 'Thành công'}">
					                        <tbody>
					                          <tr class="even pointer">
					                            <td class=" ">${b.id}</td>
					                            <td class=" ">${b.recipientName}</td>
					                            <td class=" ">${b.recipientPhone}</td>
					                            <td class=" ">${b.shippingAddress}</td>
					                            <td class=" "><fmt:formatNumber type="number" maxFractionDigits="0" value="${b.totalPrice}" /></td>  
					                            <td class=" ">${b.configByStatus.name}</td>
					                            <td class=" ">
								                    <form action="detail-bill" method="GET">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Detail">
								                    </form>
								                </td>
					                            </tr>
					                          </tbody>
					                    </c:if>
					                    </c:forEach>
					                 </table>
					            </div>
					       </div>
					    </div>	
					<div id="cancel" class="tabcontent">
					     <div class="x_content">
					     <h4>Đã hủy</h4>            
					          <div class="table-responsive">
					              <table class="table table-striped jambo_table bulk_action">
					                 <thead>
					                    <tr class="headings">                           
					                        <th class="column-title">ID</th>
					                        <th class="column-title">User Name</th>
					                        <th class="column-title">Phone Number</th>
					                        <th class="column-title">Address</th>             
					                        <th class="column-title">Total Price</th>
					                        <th class="column-title">Status </th>
					                        <th class="column-title">See Detail</th>       
					                      </tr>
					                  </thead>
					                  <c:forEach var="b" items="${listBill}">
					                  <c:if test="${b.configByStatus.name == 'Đã hủy' }">
					                        <tbody>
					                          <tr class="even pointer">
					                            <td class=" ">${b.id}</td>
					                            <td class=" ">${b.recipientName}</td>
					                            <td class=" ">${b.recipientPhone}</td>
					                            <td class=" ">${b.shippingAddress}</td>
					                            <td class=" "><fmt:formatNumber type="number" maxFractionDigits="0" value="${b.totalPrice}" /></td>  
					                            <td class=" ">${b.configByStatus.name}</td>
					                            <td class=" ">
								                    <form action="detail-bill" method="GET">
								                        <input type="hidden" name="id" value="${b.id}">
								                        <input type="submit" value="Detail">
								                    </form>
								                </td>
					                            </tr>
					                          </tbody>
					                    </c:if>
					                    </c:forEach>
					                 </table>
					            </div>
					       </div>
					    </div>	
				</div>
</body>
</html>