<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: all Books</title>
<%@include file="/all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div style="background-color: #f0f2f2; min-height: 400px">
		<h3 class='text-center'>Hello Admin</h3>
		<c:if test="${empty userObj}">
			<c:redirect url="../login.jsp" />
		</c:if>
		<body>
			<c:if test="${not empty succMsg }">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>
			<c:if test="${not empty failedMsg }">
				<p class="text-center text-danger">${failedMsg}</p>
				<c:remove var="failedMsg" scope="session" />
			</c:if>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Image</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Categories</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
					%>
					<%
					for (BookDtls book : dao.getAllBooks()) {
					%>
					<tr>
						<td scope="row"><img src="../image/<%=book.getPhotoName()%>"
							style="width: 50px; height: 50px"></td>

						<td><%=book.getBookname()%></td>
						<td><%=book.getAuthor()%></td>
						<td><%=book.getPrice()%></td>
						<td><%=book.getBookCategory()%></td>
						<td><%=book.getStatus()%></td>
						<td><a href="edit_books.jsp?id=<%=book.getBookId()%>"
							class="btn btn-primary"><i
								class="fa-regular fa-pen-to-square"></i>Edit</a> <a
							href="../delete?id=<%=book.getBookId()%>" class="btn btn-danger"><i
								class="fa-solid fa-trash"></i>Delete</a></td>
					</tr>
					<%
					System.out.println(book.toString());
					}
					%>

				</tbody>
			</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>