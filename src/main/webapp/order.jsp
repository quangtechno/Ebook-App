<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.DAO.BookOrderDAO"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>

<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allCss.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

	<c:if test="${ empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
<div class="container p-1">
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
       <th scope="col">Price</th>
        <th scope="col">Payment Method</th>
    </tr>
  </thead>
  <tbody>
  <%User user=(User)session.getAttribute("userObj");
  BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnect.getCon());
  List<Book_Order> blist=dao.getBook(user.getEmail());
  for(Book_Order b:blist)
  {
  %>
    <tr>
      <td><%=b.getOrder_Id() %></td>
      <td><%=b.getUserName() %></td>
    <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentMethod()%></td>
    </tr>
    <%} %>
    
  </tbody>
</table>
</div>
</body>
</html>