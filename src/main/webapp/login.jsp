<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
						<form>
							<h4 class="text-center mb-3">Login</h4>
							<div class="mb-3">
								<label for="registerInputEmail1" class="form-label">Email
									address</label> <input required="required" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>
							<div class="mb-3">
								<label for="registerInputPassword1" class="form-label">Password</label>
								<input required="required" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Input password">
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success">Login</button>
								<a href="register.jsp" >Register</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>