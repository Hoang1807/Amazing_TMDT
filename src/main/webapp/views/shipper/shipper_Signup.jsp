<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html></html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://demo.voidcoders.com/htmldemo/fitgear/main-files/assets/css/animate.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet"
	href="/css/shipper/shipper_css/shipper_signup.css">
<title>Insert title here</title>
</head>
<body>
	<div class="bg-gradient position-relative h-100vh">
		<div class="home-table">
			<div class="home-table-center">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">

							<div class="account_box bg-gradient">

								<form id="signUpForm_Shipper">
									<div class="text-center">
										<p class="mb-4 pb-3 text-warning h2">Sign Up Shipper</p>
									</div>

									<div class="col-lg-12 mt-3">
										<label class="text-white">Phone</label> <input type="text"
											id="exampleInputEmail1" class="form-control trial-input"
											placeholder="Phone Number" name="shipperPhone">
									</div>
									<div class="col-lg-12 mt-3">
										<label class="text-white">Password</label> <input
											type="password" id="password1"
											class="form-control trial-input" placeholder="Password"
											name="shipperPassword">
									</div>
									<div class="col-lg-12 mt-3">
										<label class="text-white">Fullname</label> <input
											type="text" id="password1"
											class="form-control trial-input" placeholder="Password"
											name="shipperFullname">
									</div>
									<div class="col-lg-12 mt-3">
										<label class="text-white">Date</label> <input type="date"
											id="password1" class="form-control trial-input"
											placeholder="Password" name="shipperDate">
									</div>

									<div class="col-lg-12">
										<button class="btn btn-custom w-100 mt-3"
											formaction="/shipper/sign-up">Sign Up</button>
									</div>
									<div class="text-success text-center">${success}</div>
									<div class="text-danger text-center">${fail}</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.nice-select.min.js"></script>
	<script src="../js/jquery-ui.min.js"></script>
	<script src="../js/jquery.slicknav.js"></script>
	<script src="../js/mixitup.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/main.js"></script>
	<script src="../js/validation.js"></script>

</body>
