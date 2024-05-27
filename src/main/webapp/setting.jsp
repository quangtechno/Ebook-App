<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>

<c:if test="${empty userObj}">
<c:redirect url="login.jsp"/>
</c:if>
<c:if test="${not empty userObj}">
	<h3 class="text-center">Hello ${userObj.name}</h3>
</c:if>
	<div class="container">
	
		<div class="row">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-2x"></i>
							</div>
							<h3>Sell Books</h3>
						</div>
					</div>
				</a>
				
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-secondary">
								<i class="fa-solid fa-pen-to-square fa-2x"></i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="all_book_user.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-2x"></i>
							</div>
							<h3>User's Books</h3>
						</div>
					</div>
				</a>
				</div>
			</div>
			<div class="row">
			<div class="col-md-4 mt-4">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-2x"></i>
							</div>
							<h3>Your Address</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-4">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-box fa-2x"></i>
							</div>
							<h3>Your Order</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-4">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-circle-info fa-2x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24/7 Service</p>
						</div>
					</div>
				</a>
			</div>
</div>
		</div>
	</div>
</body>
</html>