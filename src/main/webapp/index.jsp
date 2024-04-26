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
	<div class="container-fluid">
		<h3>Recent Books</h3>
		<!-- <img alt="" src="image/1.png"> -->
		<%@include file='all_component/bookList.jsp'%>

	</div>

</body>
</html>