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

	<!-- Styles -->
	
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${ empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
<%-- 	<c:if test="${not empty succMsg }"> --%>
<%-- 		<div class="alert alert-success" role="alert">${succMsg}</div> --%>
<%-- 		<c:remove var="succMsg" scope="session" /> --%>
<%-- 	</c:if> --%>
<%-- 	<c:if test="${not empty failedMsg }"> --%>
<%-- 		<div class="alert alert-danger" role="alert">${failedMsg}</div> --%>
<%-- 		<c:remove var="succMsg" scope="session" /> --%>
<%-- 	</c:if> --%>
	<% 
    String toastType = (String) request.getAttribute("toastType");
    String toastMessage = (String) request.getAttribute("toastMessage");
    System.out.println(toastType + " " + toastMessage);
%>


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
										type="Text" class="form-control" id="inputEmail4"
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
										type="text" class="form-control" id="inputPassword4" name="uPin"
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
								<button class="btn btn-warning" type="submit" title="Order Now"><text>Order Now</text></table></button>
								<a href="index.jsp" class="btn btn-success">Back to Home
									Page</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
$(document).ready(function() {
	toastr.options = {
		'closeButton': true,
		'debug': false,
		'newestOnTop': false,
		'progressBar': false,
		'positionClass': 'toast-top-right',
		'preventDuplicates': false,
		'showDuration': '1000',
		'hideDuration': '1000',
		'timeOut': '5000',
		'extendedTimeOut': '1000',
		'showEasing': 'swing',
		'hideEasing': 'linear',
		'showMethod': 'fadeIn',
		'hideMethod': 'fadeOut',
	}
});
function isEmptyOrNullOrWhitespace(text) {
    return text === null || text === undefined || text.trim() === "";
}
var toastType = '<%= request.getAttribute("toastType") %>';
var toastMessage = '<%= request.getAttribute("toastMessage") %>';
if (!isEmptyOrNullOrWhitespace(toastMessage)) {
if (toastType=='Success') {
	toastr.success(toastMessage);
}else if (toastType=='Error') {
	toastr.error(toastMessage);
}
}
</script>
</body>
</html>