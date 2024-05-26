<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/all_component/allCss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin: Edit Books</title>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="navbar.jsp"%>
	<%@page import="com.DAO.BookDAOImpl"%>
	<div class="container">
		<div class="row ">
			<div class="col-md-4 offset-md-4 ">
				<div class="card">
					<div class="card-body">
						<h4>Edit Books</h4>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						System.out.println(id);
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getCon());
						BookDtls b = dao.getBookById(id);
						%>
						<form action="../editBooks" method="post">
							<div class="mb-3">
							<input type="hidden" value="<%=b.getBookId()%>" name="id" >
								<label for="exampleFormControlInput1" class="form-label">Book
									Name*</label> <input type="text" class="form-control"
									id="exampleFormControlInput1" name="bName" required="required"
									value='<%=b.getBookname()%>' />
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Author
									Name*</label> <input type="text" class="form-control"
									id="exampleFormControlInput1" name="author" required="required"
									value="<%=b.getAuthor()%>" />
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">Price*</label>
								<input type="number" class="form-control"
									id="exampleFormControlInput1" name="price" required="required"
									value="<%=b.getPrice()%>" />
							</div>
							<div class="mb-3">
								<label for="inputState">Book Status</label> <select
									class="form-control" name="bstatus"
									value="<%=b.getBookname()%>">
									<%
									if (b.getStatus().equalsIgnoreCase("active")) {
									%>
									<option value="Active">Active</option>
									<option value="InActive">InActive</option>
									<%
									} else {
									%>
									<option value="InActive">InActive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>