<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allCss.jsp"%>
<title>Edit Address</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<div class="row">
						<div class="form-group col-md-6">
							<label for="inputPassword4">Address</label> <input type="text"
								class="form-control" id="inputPassword4">

						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Pin Code</label> <input type="number"
								class="form-control" id="inputPassword4">
						</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Province</label> <input type="email"
									class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="password"
									class="form-control" id="inputPassword4">
							</div>
						</div>
					</div>
					<div class="text-center">
						<button class="btn btn-warning text-white">Add Address</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>