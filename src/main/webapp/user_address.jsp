<%@page import="com.entity.User"%>
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
	<%				User user = (User) session.getAttribute("userObj");
 %>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
									  <h4>User s' Profile</h4>
				
					<div class="card-body">
						<div class=" row">
							<text>User Name:<%=user.getName() %></text>
						</div>
						<div class=" row">
							<text>User Email:<%=user.getEmail() %></text>
						</div>
							<div class=" row">
								<text>User PhoneNumber:<%=user.getPhone() %></text>
							</div>
							<div class=" row">
								<text>User Address:<%=user.getAddress() %></text>
							</div>
							<div class=" row">
								<text>User City:<%=user.getCity() %></text>
							</div>
							<div class=" row">
								<text>User Province:<%=user.getProvince() %></text>
							</div>
							<div class=" row">
								<text>User ZipNumber:<%=user.getZip()%></text>
							</div>
							
						
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>