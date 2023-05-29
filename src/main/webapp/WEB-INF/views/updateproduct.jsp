<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<link rel="stylesheet" href="css/updateproduct.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<script>
        function showFileDialog() {
            document.getElementById('fileInput').click();
        }
        
        function displayImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                
                reader.onload = function(e) {
                    var imageElement = document.getElementById('imagePreview');
                    imageElement.src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
                document.getElementById('submitProduct').disabled = false;
            }
        }
    </script>
</head>
<body>
<div class="container">
                   

	<div class="row">
	<div class="col-lg-6 col-md-6">
		<div class="x_panel">
	                  <div class="x_title">
	                    <h2>${product.name}</h2>
	                    <div class="clearfix"></div>
	                  </div>
                  <div class="x_content">
                    <br>
                    <form:form class="form-horizontal form-label-left" action="update-product" method="POST" modelAttribute="product"  enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Id</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input path="id" type="text" class="form-control" value= "${product.id}" readOnly="true"/>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Name</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input path="name" type="text" class="form-control" value= "${product.name}"/>
                        </div>
                      </div>
                      <div class="form-group row">
                       <label class="control-label col-md-3 col-sm-3 col-xs-3" for="brand">Brand</label>
						  <form:select path="configByBrand.id" style="margin-left: 10px;">
        					<form:options items="${listBrand}" itemValue="id" itemLabel="name" />
    					 </form:select>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Origin</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input type="text" path="origin" class="form-control"  value = "${product.origin}"/>
                         </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Image</label>
                        <input type="file" id="fileInput" name="file" onchange="displayImage(this);" style="padding: 8px 10px;">
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Description</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input type="text" class="form-control" path="description" value="${product.description}"/>
                         </div>
                      </div>
                      <div class="form-group row">
                         <label class="control-label col-md-3 col-sm-3 col-xs-3" for="category">Category:</label>
						 <form:select path="configByCategory.id" style="margin-left: 10px;">
        					<form:options items="${listCategory}" itemValue="id" itemLabel="name" />
    					 </form:select>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Price</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input path="price"  type="number" class="form-control" value="${product.price}"/>
                           </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Inventory</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <form:input path="inventory"  type="number" class="form-control" value="${product.inventory}"/>
                           </div>
                      </div>
	                  <div class="col-sm-6">
	                       <div class="back">
					<a href="home-admin" style="color:black;"><i class="fas fa-arrow-left" ></i> Exit</a>
					</div>
					</div>
                     <div class="col-sm-6">
                     	<div class="form-group row">
	                        <c:choose>
							  <c:when test="${product.media.fileName == null}">
							    <input type="submit" id="submitProduct" class="btn btn-primary" name=""  value="Update"  disabled>
							  </c:when>
							  <c:otherwise>
							    <input type="submit" id="submitProduct" class="btn btn-primary" name=""  value="Update">
							  </c:otherwise>
							</c:choose>
                      	</div>
                     </div>
                      </form:form>
                      </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6">
                
				     <input type="file" id="fileInput"  onchange="displayImage(this);" style="display: none;">
    
				    <div>
				        <img id="imagePreview" src="${product.media.fileName}" alt="Preview" style="max-width: 300px;">
				    </div>
           </div>
           </div>
	</div>
</body>
</html>