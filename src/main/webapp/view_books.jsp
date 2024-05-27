<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%@include file="all_component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("Id"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
	BookDtls b = dao.getBookById(id);
	%>
	<div class="row">
		<div class="col-md-6 text-center">
			<img src="image/<%=b.getPhotoName()%>"
				style="height: 400px; width: 30 0px"> <br>
			<h4>
				Book Name :
				<%=b.getBookname()%></h4>
			<h4>
				Author Name:
				<%=b.getAuthor()%></h4>
			<h4>
				Category :
				<%=b.getBookCategory()%></h4>
		</div>
		<div class="col-md-6 border justify-content-center text-center">
			<h2><%=b.getBookname()%></h2>
			<h2>
				Seller's Email:
				<%=b.getEmail()%></h2>
			<div class="row justify-content-center">
				<div class="col-md-4 text-success text-center p-2">
					<i class="fa-solid fa-money-bill fa-3x"></i>
					<p>Cash On Delivery</P>
				</div>
				<div class="col-md-4 text-secoundary text-center p-2">
					<i class="fa-solid fa-rotate-left fa-3x"></i>
					<p>Return Available</P>
				</div>
				<div class="col-md-4 text-primary text-center p-2">
					<i class="fa-solid fa-truck fa-3x"></i>
					<p>Free Shipping</P>
				</div>
				<div class="row text-center p-3 justify-content-center">
					<a href="cart?bid=<%=b.getBookId()%>&&uid=${userObj.id}"
						class="btn btn-primary mx-2" 
						id="toastr>Add Cart</a><a
						class="btn btn-outline-success mx-2"><%=b.getPrice()%><i
						class="fa-solid fa-money-bill"></i></a> <a href="#"
						class="btn btn-primary mx-2">Back to Home Page</a>
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
var toastType = '<%=request.getAttribute("toastType")%>';
var toastMessage = '<%=request.getAttribute("toastMessage")%>
		';
		if (!isEmptyOrNullOrWhitespace(toastMessage)) {
			if (toastType == 'Success') {
				toastr.success(toastMessage);
			} else if (toastType == 'Error') {
				toastr.error(toastMessage);
			}
		}
	</script>
</body>
</html>