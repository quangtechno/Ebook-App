<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container text-center ">
			<h2 class="mt-3">
				New Books
				</h3>
				<div class="d-flex flex-row flex-wrap">
					<%
					User user = (User) session.getAttribute("userObj");
               BookDAOImpl dao=new BookDAOImpl(DBConnect.getCon());
					List<BookDtls> listNew = dao.getAllNewBooks();
					for (BookDtls b : listNew) {
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
						%> <a href="view_books.jsp?Id=<%=b.getBookId()%>"
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

</body>
</html>