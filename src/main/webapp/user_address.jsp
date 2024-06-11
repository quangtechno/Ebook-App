<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .highlight {
       color: #155724;
       font-weight: bold;
       }
</style>

<%@include file="all_component/allCss.jsp"%>
<title>Edit Address</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
	<%				User user = (User) session.getAttribute("userObj");
    String name = (user.getName() != null && !user.getName().isBlank()) ? user.getName() : "";
    String email = (user.getEmail()!= null && !user.getEmail().isBlank()) ? user.getEmail() : "";
    String phone = (user.getPhone()!= null && !user.getPhone().isBlank()) ? user.getPhone() : "";
    String address = (user.getAddress()!= null && !user.getAddress().isBlank()) ? user.getAddress() : "";
    String city = (user.getCity()!= null && !user.getCity().isBlank()) ? user.getCity() : "";
    String province= (user.getProvince()!= null && !user.getProvince().isBlank()) ? user.getProvince() : "";
    String ZipNumber = (user.getZip()!= null && !user.getZip().isBlank()) ? user.getZip() : "";	
 %>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
									  <h4>User s' Profile</h4>
				
					<div class="card-body">
						<div class=" row">
						
							<text><span class="highlight"> Name</span>:<%=name %></text>
						</div>
						<div class=" row">
							<text> <span class="highlight">Email</span>:<%=email %></text>
						</div>
							<div class="row">
								<text> <span class="highlight">Phone Number</span>: <%=phone %></text>
							</div>
							<div class=" row">
								<text> <span class="highlight">Address</span>: <%=address %></text>
							</div>
							<div class=" row">
								<text> <span class="highlight">City</span>: <%=city %></text>
							</div>
							<div class=" row">
								<text> <span class="highlight">Province</span>: <%=province %>
								  </text>
							</div>
							<div class=" row">
								<text> <span class="highlight">ZipNumber</span>:<%=ZipNumber%></text>
							</div>

					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>