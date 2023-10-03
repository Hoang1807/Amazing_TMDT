<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
	<div class="container d-flex justify-content-center mt-5">
		<div class="card">
			<h4 class="text-center pt-4">Hola!</h4>
			<span class="info">To all special dicounts and more <br>
				become a member!
			</span>
			<form class="p-3 mt-3" action="AmazingRegister" method="post">
				<div class="form-group container">
					<input type="text" name="userPhone" placeholder="Phone number" class="form-control form"> 
					<input type="password" name="userPassword" placeholder="password" class="form-control">
					<input type="text" name="userFullname" placeholder="Full name" class="form-control form">
					<input type="email" name="userEmail" placeholder="Email" class="form-control form">	
				</div>
				<div class="text-center container">
					<button class="btn">Sign up</button>
				</div>
			</form>
			<div class="info">${registerFail}</div>
		</div>
	</div>
</body>

</html>
