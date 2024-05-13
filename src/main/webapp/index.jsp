<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%> 
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

</head>
<body>
	<%@include file='all_component/navbar.jsp'%>

	<div class="container-fluid back-img">
		<h2 class=text-center style="color: white">Ebook Managerment
			System</h2>
	</div>
	<% Connection con=DBConnect.getCon();
	System.out.println(con);
	out.print(con);%>
	<div class="container text-center">
		<h2 class="mt-3">Recent Books</h3>
		<!-- <img alt="" src="image/1.png"> -->
		<%@include file='all_component/bookList.jsp'%>
		<div class="d-flex flex-row mb-3 flex-wrap justify-content-between" id="Recent"></div>
     <div class='text-center'><a href="" class="btn btn-success">View All</a></div>
	</div>
<!-- end recent books-->
<!-- start new books -->
<hr>
<div class="container text-center">
<h2 class="mt-3">New Books</h3>
<%-- 		<%@include file='all_component/bookList.jsp'%> --%>
		<div class="d-flex flex-row mb-3 flex-wrap justify-content-between" id="New"></div>
     <div class='text-center'><a href="" class="btn btn-success">View All</a></div>
     </div>
</body>
<footer>
<%@include file="all_component/footer.jsp" %></footer>
</html>