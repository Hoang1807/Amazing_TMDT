
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Đăng Nhập Cửa Hàng Của
											Bạn!</h1>
									</div>
									<form class="user" method="post" action="login">
										<div class="form-group">
											<input type="text" name="phone" required="required"
												class="form-control form-control-user" id="phone"
												placeholder="Số điện thoại">
										</div>
										<div class="form-group">
											<input type="password" name="password"
												class="form-control form-control-user" id="password"
												placeholder="Password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<button class="btn btn-primary btn-user btn-block">
											Đăng nhập</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Quên mật
											khẩu?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register">Tạo tài khoản!</a>
									</div>
								</div>
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

</body>
</html>