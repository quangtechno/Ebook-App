<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">
	<%@include file='all_component/navbar.jsp'%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<form action="login" method="post">
							<h4 class="text-center mb-3">Login</h4>
							<c:if test="${not empty faildedMsg}">
								<h5 class="text-center text-danger">${faildedMsg}</h5>
								<c:remove var="faildedMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>
							<div class="mb-3">
								<label for="registerInputEmail1" class="form-label">Email
									address</label> <input required="required" type="email" name='email'
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>
							<div class="mb-3">
								<label for="registerInputPassword1" class="form-label">Password</label>
								<input required="required" type="password" class="form-control"
									name='password' id="exampleInputPassword1"
									placeholder="Input password">
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-success">Login</button>
								<a href="register.jsp">Register</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>