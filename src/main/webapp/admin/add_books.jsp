<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@include file="/all_component/allCss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books	</title>
</head>
<body style="background-color: #f0f2f2 ">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card">
					<div class="card-body">
					<h4>Add Books</h4>
					<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failedMsg }">
					<p class="text-center text-danger">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					<form action="../add_books" method="post"
					 enctype="multipart/form-data">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Book
								Name*</label> <input type="text" class="form-control"
								id="exampleFormControlInput1" name="bName"required="required"/>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Author
								Name*</label> <input type="text" class="form-control"
								id="exampleFormControlInput1" name="author"required="required"/>
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">Price*</label>
							<input type="number" class="form-control" 
								id="exampleFormControlInput1" name="price" required="required" min="0"/>
						</div>
						<div class="mb-3">
							<label for="inputState">Book Categories</label> <select
								class="form-control" name="btype">
								<option selected>Open this select menu</option>
								<option value="IT">IT</option>
								<option value="New">New Book</option>
								<option value="Literature">Literature Book</option>
							
							</select>
						</div>
						<div class="mb-3">
							<label for="inputState">Book Status</label> <select
								class="form-control" name="bstatus">
								<option selected>Open this select menu</option>
								<option value="Active">Active</option>
								<option value="InActive">InActive</option>
							
							</select>
						</div>
						<div class="form-group">
							<label>upload Photo</label> <input name="bimg" type="file" 
							class="form-control-file" id="exampleFormControlFile1"/>
						</div>
						<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>