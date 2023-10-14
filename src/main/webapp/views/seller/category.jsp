<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Amazing - Loại</title>

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
<link href="../css/seller/dataTables.min.css" rel="stylesheet">

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="layout/sidebar.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="layout/header.jsp"></jsp:include>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Quản Lý Loại Sản Phẩm</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
							data-toggle="modal" data-target="#formCate" id="btnAddCate">
							<i class="fas fa-plus fa-sm text-white-50"></i> Thêm Loại
						</a>

						<div class="modal fade" id="formCate" tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header border-bottom-0">
										<h5 class="modal-title" id="exampleModalLabel">Thêm loại</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form id="formCategory" method="post" autocomplete="off"
										action="/admin/addCategory">
										<input type="hidden" name="cateId">
										<div class="modal-body">
											<div class="form-group">
												<input type="text" name="cateName" class="form-control"
													placeholder="Tên Loại">
											</div>
											<div class="form-group">
												<input type="text" readonly="readonly"
													value="${sessionScope.store_account.storeName }"
													class="form-control">
											</div>
											<span class="text-danger" id="errorCate">${param.errorCate }</span>
										</div>
										<div
											class="modal-footer border-top-0 d-flex justify-content-end">
											<button formmethod="delete" class="btn btn-danger d-none">Xóa</button>
											<button class="btn btn-success">Lưu</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="m-auto col-xl-8">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Danh sách
										loại sản phẩm</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table id="category" class="table table-hover table-bordered"
											style="width: 100%">
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Amazing 2023</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="../js/seller/jquery.min.js"></script>
	<script src="../js/seller/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../js/seller/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/seller/sb-admin-2.min.js"></script>


	<!-- Page level custom scripts -->
	<script src="../js/seller/jquery.validate.min.js"></script>
	<script src="../js/seller/dataTables.min.js"></script>
	<script src="../js/seller/category.js"></script>

</body>
</html>