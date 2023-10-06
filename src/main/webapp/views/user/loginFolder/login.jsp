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
			<form id="loginForm" class="p-3 mt-3" action="AmazingLogin" method="post">
				<div class="form-group container">
					<input type="text" name="userPhone" placeholder="Phone number" class="form-control form"> 
					<input type="password" name="userPassword" placeholder="password" class="form-control">
					<select name="roleLogin" id="validationCustom04" required>
						  <option selected value="user">User</option>
						   <option value="seller">Seller</option>
						   <option value="shipper">Shipper</option>
					</select>			
				</div>
				<div class="text-center container">
					<button class="btn mt-3">login</button>
					<a href="/AmazingRegister" class="btn mt-3">Register</a>
				</div>
			</form>
			<div class="info">${loginFail}</div>
		</div>
	</div>
</body>

</html>
