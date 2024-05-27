<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook :index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/b.jpg");
	height: 50vh;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
</style>
<% 
    String toastType = (String) request.getAttribute("toastType");
    String toastMessage = (String) request.getAttribute("toastMessage");
    System.out.println(toastType + " " + toastMessage);
%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Toastr -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	<!-- Styles -->
	<style type="text/css">
		body {background: whitesmoke;text-align: center;}
		button{background-color: darkslategrey;color: white;border: 0;font-size: 18px;font-weight: 500;border-radius: 7px;padding: 10px 10px;cursor: pointer;white-space: nowrap;}
		#success{background: green;}
		#error{background: red;}
		#warning{background: coral;}
		#info{background: cornflowerblue;}
		#question{background: grey;}
	</style>
	

</head>
<body>
	<%@include file='all_component/navbar.jsp'%>

	<div class="container-fluid back-img">
		<h2 class=text-center style="color: white">Ebook Managerment
			System</h2>
	</div>
	<%
	Connection con = DBConnect.getCon();
	%>
	<%
	User user = (User) session.getAttribute("userObj");
	%>
	<div class="container text-center justify-content-center">
		<h2 class="mt-3">IT Books</h2>
		<div class="d-flex flex-row flex-wrap justify-content-center">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
			List<BookDtls> listIT = dao.getITBooks();
			for (BookDtls b : listIT) {
			%>
			<div class="card m-3 text-center " style="width: 18rem;">
				<div class="card-body text-center overflow-hidden text-truncate">
					<img class="card-img-top img-thumbnail"
						style="width: 150px; height: 200px;"
						src="image/<%=b.getPhotoName()%>">
					<p>
						Book Name:
						<%=b.getBookname()%></p>
					<p>
						Author:
						<%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<p>
						Price:
						<%=b.getPrice()%><i class="fa-solid fa-money-bill"></i>
					</p>
					<div class="row justify-content-center">
						<%
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							Cart<i class="fa-solid fa-cart-shopping"></i>
						</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-success btn-sm ml-2" id="toastr">Add Cart<i
							class="fa-solid fa-cart-shopping"></i></a>
						<%
						}
						%>
						<a href="view_books.jsp?Id=<%=b.getBookId()%>"
							class="btn btn-primary btn-sm ml-2">View Details<i
							class="fa-regular fa-eye"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class='text-center'>
			<a href="" class="btn btn-success">View All</a>
		</div>
	</div>
	<!-- end recent books-->
	<!-- start new books -->
	<hr>

	<div class="container text-center ">
		<h2 class="mt-3">New Books</h2>
		<div class="d-flex flex-row flex-wrap justify-content-center">
			<%
			List<BookDtls> listNew = dao.getNewBooks();
			for (BookDtls b : listNew) {
			%>
			<div
				class="card m-3 text-center justify-content-center align-items-center"
				style="width: 18rem;">
				<div class="card-body text-center overflow-hidden text-truncate">
					<img class="card-img-top img-thumbnail"
						style="width: 150px; height: 200px;"
						src="image/<%=b.getPhotoName()%>">
					<p>
						Book Name:
						<%=b.getBookname()%></p>
					<p>
						Author:
						<%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<p>
						Price:
						<%=b.getPrice()%><i class="fa-solid fa-money-bill"></i>
					</p>
					<div class="row justify-content-center">
						<%
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-success btn-sm ml-2">Add
							Cart<i class="fa-solid fa-cart-shopping"></i>
						</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-success btn-sm ml-2" id="toastr">Add Cart<i
							class="fa-solid fa-cart-shopping"></i></a>
						<%
						}
						%>
						<a href="view_books.jsp?Id=<%=b.getBookId()%>"
							class="btn btn-primary btn-sm ml-2">View Details<i
							class="fa-regular fa-eye"></i></a>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class='text-center'>
			<a href="" class="btn btn-success">View All</a>
		</div>
	</div>
	<div class="container text-center">
		<h2 class="mt-3">Literature Books</h2>
		<div class="d-flex flex-row flex-wrap justify-content-center">
			<%
			List<BookDtls> listLiterature = dao.getLiteratureBooks();
			for (BookDtls b : listLiterature) {
			%>
			<div
				class="card m-3 text-center ustify-content-center align-items-center"
				style="width: 18rem;">
				<div class="card-body text-center overflow-hidden text-truncate">
					<img class="card-img-top img-thumbnail"
						style="width: 150px; height: 200px;"
						src="image/<%=b.getPhotoName()%>">
					<p>
						Book Name:
						<%=b.getBookname()%></p>
					<p>
						Author:
						<%=b.getAuthor()%></p>
					<p>
						Categories:
						<%=b.getBookCategory()%></p>
					<p>
						Price:
						<%=b.getPrice()%><i class="fa-solid fa-money-bill"></i>
					</p>
					<div class="row justify-content-center">
						<%
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-success btn-sm ml-2" id="toastr">Add
							Cart<i class="fa-solid fa-cart-shopping"></i>
						</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-success btn-sm ml-2">Add Cart<i
							class="fa-solid fa-cart-shopping"></i></a>
						<%
						}
						%>
						<a href="view_books.jsp?Id=<%=b.getBookId()%>"
							class="btn btn-primary btn-sm ml-2">View Details<i
							class="fa-regular fa-eye"></i></a>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class='text-center'>
			<a href="" class="btn btn-success">View All</a>
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
<footer>
	<%@include file="all_component/footer.jsp"%></footer>
</html>