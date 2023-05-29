<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Insert Product</title>
<link rel="stylesheet" href="css/updateproduct.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
<script>
	function dieu_huong1() {
		location.assign("home-admin");
	}
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
    function toggleTextbox() {
        var textbox = document.getElementById('myTextbox');
        var text = document.getElementById('myLink');
        var label = document.getElementById('myLabel');
        if (textbox.style.display === 'none') {
            textbox.style.display = 'block';
            text.style.display = 'block';
            label.style.display = 'block';
        } else {
            textbox.style.display = 'none';
            text.style.display = 'none';
            label.style.display = 'none';
        }
    }
</script>
<link rel="stylesheet" href="css/updateproduct.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">
</head>
<body>
<div class="container">
	<div class="row">
	<div class="col-lg-6 col-md-6">
		<div class="x_panel">
	                  <div class="x_title">
	                    <h2>INSERT PRODUCT</h2>
	                    <div class="clearfix"></div>
	                  </div>
	                  <form:form class="form-horizontal form-label-left" action="insert-brand" method="POST">
						    <h5 id="myLabel" style="display: none; margin-bottom: 5px; "><strong>Insert Brand</strong></h5>
						    <input type="text" id="myTextbox" name="name" style="display: none;">
						    <input type="submit" id="myLink" name="" value="Add" style="display: none; margin-top: 5px;">
						</form:form>
                  <div class="x_content">
                    <br>
                    <form:form class="form-horizontal form-label-left" action="insert-product" method="POST" modelAttribute="product" enctype="multipart/form-data">
                    <div class="form-group row">
         
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
    					 <span class="icon" onclick="toggleTextbox()" style ="display: inline-block; width: 20px;height: 20px;margin:10px">
						    <i class="fas fa-plus"></i>
						    </span>
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
                         <label class="control-label col-md-3 col-sm-3 col-xs-3" for="category">Category</label>
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
                          <form:input path="inventory" type="number" class="form-control" value="${product.inventory}"/>
                           </div>
                      </div>
	                  <div class="col-sm-6">
	                       <div class="back">
					<a href="home-admin" style="color:black;"><i class="fas fa-arrow-left" ></i> Exit</a>
					</div>
					</div>
                    <div class="col-sm-6">
                     	<div class="form-group row">
                          <input type="submit" id="submitProduct" class="btn btn-primary" name=""  value="Create" disabled >
                      	</div>
                    </div>
                      </form:form>
                      </div>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6">
				    <div>
				        <img id="imagePreview" src="#" alt="Preview" style="max-width: 300px;">
				    </div>
           </div>
           </div>
           </div>
</body>
</html>