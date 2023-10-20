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
			<h4 class="text-center pt-4">Đăng kí</h4>
			<span class="info">Đăng kí để giúp chúng tôi quản trị <br>
				thông tin các bạn 1 cách tốt nhất
			</span>
			<form class="p-3 mt-3" action="AmazingRegister" method="post" enctype="multipart/form-data">
				<div class="form-group container">
					<input type="text" name="userPhone" placeholder="Phone number" class="form-control form mb-2"> 
					<input type="password" name="userPassword" placeholder="password" class="form-control mb-2">
					<input type="text" name="userFullname" placeholder="Full name" class="form-control form mb-2">
					<input type="email" name="userEmail" placeholder="Email" class="form-control form mb-2" >	
					<input type="file" name="pFile" placeholder="Image upload" class="form-control form mb-2" >	                      
				</div>
				<div class="text-center container">
					<button class="btn">Đăng kí</button>
				</div>
			</form>
			<div class="info">${registerFail}</div>
		</div>
	</div>
</body>

</html>
