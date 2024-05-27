<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="/all_component/allCss.jsp"%>
</head>
<body>
	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<%@include file="navbar.jsp"%>
	<div style="background-color: #f0f2f2">
		<h3 class='text-center'>Hello Admin</h3>
		<table class="table">
			<thead class="btn-primary">
				<tr class="text-primary">
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone Number</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getCon());
				List<Book_Order> blist = dao.getBook();
				for (Book_Order b : blist) {
				%>
				<tr>
					<td><%=b.getOrder_Id()%></td>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFulladd()%></td>
					<td><%=b.getPhone()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentMethod()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>