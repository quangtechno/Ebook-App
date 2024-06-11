<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color:
}
</style>
<%@include file="/all_component/allCss.jsp"%>
</head>
<c:if test="${empty userObj}">
<c:redirect url="../login.jsp"/></c:if>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row text-center">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-plus-square fa-3x"></i><br>
							<h4>Add Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center text-danger">
						<i class="fa fa-book fa-3x"></i><br>
						<h4>All Books</h4>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center text-warning">
						<i class="fas fa-box-open fa-3x"></i><br>
						<h4>Orders</h4>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="../Logout"data-toggle="modal" data-target="#exampleModal">
				<div class="card">
					<div class="card-body text-center">
						<i class="fas fa-sign-out-alt fa-3x"></i><br>
						<h4>Log Out</h4>
					</div>
				</div>
				</a>
			</div>
		</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <h4>Do you want to Logout ?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../Logout"type="button" class="btn btn-danger">LogOut</a>
      </div>
    </div>
  </div>
</div>
	</div>
</body>
</html>