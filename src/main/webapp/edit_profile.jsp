<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allCss.jsp"%>

<title>Edit profile</title>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center text-primary">Edit Profile</h4>
					<c:if test="${not empty faildedMsg}">
								<h5 class="text-center text-danger">${faildedMsg}</h5>
								<c:remove var="faildedMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>
						<form action="update_profile" method="post">
						<input type='hidden' value="${userObj.id}" name="id"/>
							<div class="mb-3">
								<label for="registerInputUsername" class="form-label">Name
								</label> <input required="required" type="text" class="form-control"
									id="registerInputUsername" placeholder="Enter username"value="${userObj.name}"
									name="username"/>
							</div>
							<div class="mb-3">
								<label for="registerInputEmail1" class="form-label">Email
									address</label> <input required="required" type="email"value="${userObj.email}"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email"/>

							</div>
							<div class="mb-3">
								<label for="registerInputPhonenumber" class="form-label">Phone
								</label> <input required="required" type="number" class="form-control"value="${userObj.phone}"
									id="registerInputPhonenumber" placeholder="Enter phone number"
									name="phone"/>

							</div>
							<div class="mb-3">
								<label for="registerInputPassword1" class="form-label">Password</label>
								<input required="required" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Input password"
									name="password"/>
							</div>
							<button type="submit" class="btn btn-primary" onPress="checkVal">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>