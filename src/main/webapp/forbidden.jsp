<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

    <meta charset="UTF-8">
    <title>Error 403 - Forbidden</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            text-align: center;
        }
        h1 {
            color: #dc3545;
        }
        p {
            color: #333;
        }
    </style>
</head>
<body>
	<%@include file='all_component/navbar.jsp'%>

    <div class="container">
        <h1>Error 403 - Forbidden</h1>
        <p>Sorry, you don't have permission to access this page.</p>
    </div>
</body>
</html>
