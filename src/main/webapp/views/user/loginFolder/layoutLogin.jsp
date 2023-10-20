<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="loginApp">
<head>
<meta charset="UTF-8">
<title>Amazing - Thương Mại Điện Tử</title>

<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	type="text/css">
<link rel="stylesheet" href="./css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet" href="./css/login.css" type="text/css">
<link rel="stylesheet" href="/static/css/login.css">
</head>

<body ng-controller="loginCtrl">
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All departments</span>
						</div>
						<ul>
							<li><a href="#">Fresh Meat</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter & Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya & Crisps</a></li>
							<li><a href="#">Oatmeal</a></li>
							<li><a href="#">Fresh Bananas</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									All Categories <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="What do yo u need?">
								<button type="submit" class="site-btn">SEARCH</button>
							</form>
						</div>
					</div>
					<div class="wrapper">
						<jsp:include page="login.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/jquery.validate.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.nice-select.min.js"></script>
	<script src="./js/jquery-ui.min.js"></script>
	<script src="./js/jquery.slicknav.js"></script>
	<script src="./js/mixitup.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/main.js"></script>
	<script src="./js/validation.js"></script>
	
	<script>
		const app = angular.module("loginApp", []);
		app.controller("loginCtrl", function ($scope,$rootScope) {
			$rootScope.listItemCart = JSON.parse(localStorage.getItem("items"));
			$scope.SizeCart = function(){
				return $rootScope.listItemCart.length;
			}
		});
	</script>
</body>
</html>
