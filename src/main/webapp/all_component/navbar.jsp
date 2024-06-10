<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3">

	<div class="row">
		<div class="col-md-3">
			<h3 style="color: #228B22">
				<i class="fa fa-book"></i>EBook
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>


		</div>
		<div class="col-md-3">
			<c:if test="${not empty userObj}">
				<a href="checkout.jsp" class="mt-2"><i
					class="fa-solid fa-cart-shopping fa-2x"></i></a>
				<a href="setting.jsp" class="btn btn-success"><i class="fa-regular fa-user"></i>${userObj.name}</a>
				<a href="../logout" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal"><i
					class="fa-solid fa-right-from-bracket"></i>Logout</a>
			</c:if>
			<c:if test="${empty userObj}">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-regular fa-circle-user"></i>Login</a>
				<a href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i>Register</a>
			</c:if>
		</div>
		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Confirmation</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h4>Do you want to Logout ?</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="Logout" type="button" class="btn btn-danger">LogOut</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active m-1"><a class="nav-link"
				href="index.jsp"><i class="fa fa-home"></i>Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active m-1"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa fa-book"></i>New Book</a></li>
			<li class="nav-item active m-1"><a class="nav-link"
				href="all_IT_book.jsp"><i class="fa fa-book"></i>IT Book</a></li>
			<li class="nav-item active m-1"><a class="nav-link"
				href="all_literature_book.jsp"><i class="fa fa-book"></i>Literature
					Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<c:if test="${not empty userObj}">
				<a href="setting.jsp" class="btn btn-outline-dark my-2 my-sm-0 m-2"
					type="submit"> <i class="fa fa-cog"></i>Setting
				</a>
			</c:if>
<!-- 			<a class="btn btn-outline-dark my-2 my-sm-0" type="submit"> <i -->
<!-- 				class="fa fa-phone"></i>Contact us -->
<!-- 			</a> -->
		</form>
	</div>
</nav>