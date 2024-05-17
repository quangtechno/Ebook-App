<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Register</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
#tc{
color: green;
}
#error{
color: red;
}
</style>
</head>
<% String infortc=(String)request.getAttribute("thongbaotc"); 
if(infortc==null){
infortc="";
}
String inforer=(String)request.getAttribute("thongbaoer"); 
if(inforer==null){
inforer="";
}%>
<body style="background-color: #f0f1f2;">
	<%@include file='all_component/navbar.jsp'%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<form action="register"method="post">
						<h4 class="text-center mb-3">Registration</h4>
						<div id='tc'><%=infortc %></div>
						<div id='error'><%=inforer %></div>
							<div class="mb-3">
								<label for="registerInputUsername" class="form-label">Name
								</label> <input required="required" type="text" class="form-control"
									id="registerInputUsername" placeholder="Enter username" name="username">

							</div>
							<div class="mb-3">
								<label for="registerInputEmail1" class="form-label">Email
									address</label> <input required="required" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"name="email">

							</div>
							<div class="mb-3">
								<label for="registerInputPhonenumber" class="form-label">Phone
								</label> <input required="required" type="number" class="form-control"
									id="registerInputPhonenumber" placeholder="Enter phone number"name="phone">

							</div>
							<div class="mb-3">
								<label for="registerInputPassword1" class="form-label">Password</label>
								<input required="required" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Input password"name="password">
							</div>
							<div class="mb-3">
								<label for="registerInputPassword1Again" class="form-label">Password</label>
								<input required="required" type="password" class="form-control" name="Checkpassword"
									id="registerInputPassword1Again" placeholder="Input password again">
							
							</div>
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms & Condition</label>
							</div>
							<button type="submit" class="btn btn-primary"onPress="checkVal">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>