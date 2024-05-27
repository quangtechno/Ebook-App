<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${ empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3>
							<class="text-centertext-success">Your Selected Item 
						</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getCon());
								List<Cart> cartList = dao.getBookByUserId(user.getId());
								Double totalPrice = 0.0;
								for (Cart c : cartList) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userObj.id}" name="id"/>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Name</label> <input type="text" class="form-control"
										id="inputEmail4" value="${userObj.name }"name="uName" required/>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="${userObj.email}"name="uEmail" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="Number" class="form-control" id="inputEmail4"
										value="${userObj.phone}" name="uPhone" required/>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="uAddress" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Province</label> <input type="text"
										class="form-control" id="inputEmail4" name="uProvince" required/>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="uCity" required/>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input
										type="number" class="form-control" id="inputPassword4" name="uPin"
										>
								</div>
								<div class="form-group">
									<label>Payment method<select class="form-control" name="uSelect">
											<option value="Cash on Delivery">Cash on Delivery</option>
											<option value="Transfer">Transfer</option>
									</select></label>
								</div>
							</div>
							<div>
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Back to Home
									Page</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>