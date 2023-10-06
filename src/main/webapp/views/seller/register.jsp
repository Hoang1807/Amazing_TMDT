
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Amazing - Login</title>

<!-- Custom fonts for this template-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/seller/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/seller/seller.css" rel="stylesheet">
</head>
</head>

<body class="bg-gradient-primary">

	<div class="container">
		<c:choose>
			<c:when test="${empty sessionScope.store_account}">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
							<div class="col-lg-7">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Tạo Cửa Hàng Cho Riêng
											Bạn!</h1>
									</div>
									<form class="user" id="register-form" action="/admin/add"
										method="POST">
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="text" name="storePhone"
													value="${store.storePhone }"
													class="form-control form-control-user" id="storePhone"
													placeholder="Số điện thoại">
											</div>
											<div class="col-sm-6">
												<input type="text" name="storeName"
													value="${store.storeName }"
													class="form-control form-control-user" id="storeName"
													placeholder="Tên cửa hàng">
											</div>
										</div>
										<div class="form-group">
											<input type="email" name="storeEmail"
												value="${store.storeEmail }"
												class="form-control form-control-user" id="storeEmail"
												placeholder="Địa chỉ Email">
										</div>
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="password" name="storePassword"
													value="${store.storePassword }"
													class="form-control form-control-user" id="storePassword"
													placeholder="Mật khẩu">
											</div>
											<div class="col-sm-6">
												<input type="password" name="repeatPassword"
													class="form-control form-control-user" id="RepeatPassword"
													placeholder="Nhập lại mật khẩu">
											</div>
										</div>
										<span class="text-danger">${error }</span>
										<button class="btn btn-primary btn-user btn-block">Tạo
											tài khoản</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Forgot
											Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="login">Already have an account?
											Login!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="../js/seller/jquery.min.js"></script>
	<script src="../js/seller/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../js/seller/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/seller/sb-admin-2.min.js"></script>
	<script src="../js/seller/jquery.validate.min.js"></script>
	<script src="../js/seller/register.js"></script>
	</c:when>
	<c:otherwise>
		<c:redirect url="home" />
	</c:otherwise>
	</c:choose>
</body>
</html>