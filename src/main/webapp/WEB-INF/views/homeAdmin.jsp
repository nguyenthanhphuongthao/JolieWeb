<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
	function dieu_huong1() {
		location.assign("manage-bill");
	}

	function dieu_huong_update(id) {
		location.assign("update-product?id=" + id);
	}
	function dieu_huong_insertProduct() {
		location.assign("insert-product");
	}
</script>
<jsp:include page="header.jsp"></jsp:include>
<title>Tất cả sản phẩm | Admin</title>
<link rel="stylesheet" href="css/homeadmin.css" type="text/css">
</head>
<body style="margin-left: 5%;margin-right: 5%;">
	<div class="row">
	  <div class="col-sm-4">
	  		<div class="sidebar">
				<div class="sidebar__item_2">
					<h4>
						<strong>Quản lý sản phẩm</strong>
					</h4>
					<!-- Tab links -->
						
						</div>
					</div>
					</div>
	  				<div class="col-sm-4">
	  				<div class="tabs">
							<button class="tablinks_active">Tất cả sản phẩm</button>
							<button class="tablinks" onclick="dieu_huong1()">Quản lý đơn hàng</button>
						</div>
	  				
	  				</div>
	 			 		<div class="col-sm-4" >
	 			 		<a href="logout" style="color:black;right: 5%;position: absolute;color:black;">Logout <i class="fa fa-sign-out"></i></a>
	 			 		
	 			 		<br></br>
						<input type="submit" name=""  value="Insert Product"  onclick="dieu_huong_insertProduct()" style="width: 40%">
						
						
			</div>
	</div>

	     <div class="x_content">            
	          <div class="table-responsive">
	              <table class="table table-striped jambo_table bulk_action">
	                 <thead>
	                    <tr class="headings">                           
	                        <th class="column-title">ID</th>
	                        <th class="column-title">Name</th>
	                        <th class="column-title">Brand</th>
	                        <th class="column-title">Origin</th>
	                        <th class="column-title" style=" max-width: 800px;">Description</th>
	                        <th class="column-title">Image</th>
	                        <th class="column-title">Category</th>
	                        <th class="column-title">Price</th>
	                        <th class="column-title">Inventory</th> 
	                        <th class="column-title">Update</th>           
	                      </tr>
	                        </thead>
	                        <c:forEach var="c" items="${listProduct}">
		                        <tbody>
		                          <tr class="even pointer">
		                            <td class=" ">${c.id}</td>
		                            <td class=" ">${c.name} </td>
		                            <td class=" ">${c.configByBrand.name}</td>
		                            <td class=" ">${c.origin}</td>
		                            <td class=" ">${c.description}</td>
		                            <td class=" "><img src="${c.media.fileName}" alt="image" style="width: 100%;"/></td>
		                            <td class=" ">${c.configByCategory.name}</td>  
		                            <td class=" "><fmt:formatNumber type="number" maxFractionDigits="0"
										value="${c.price}" /></td>
									<td class=" ">${c.inventory}</td> 
		                            <td class=" "><input type="submit" name=""  value="Update" onclick="dieu_huong_update(${c.id})"></td>
		                            </tr>
		                         </tbody>
	                         </c:forEach>
					</table>
					<div class="product__pagination">
				</div>
				</div>
				<c:if test="${pageNo > 0 }">
					<a class="item" href="?pageNo=${pageNo - 1 }">&laquo;</a>
				</c:if>
				<c:if test="${!pageNo.equals(maxPage)}">
					<a class="item" href="?pageNo=${pageNo + 1 }">&raquo;</a>
				</c:if>
	</div>		
</body>
</html>