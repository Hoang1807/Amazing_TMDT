$(document).ready(() => {
	$('#category').DataTable({
		ajax: {
			url: "http://localhost:8080/admin/categories",
			dataSrc: ""
		},
		columns: [
			{ title: "Mã loại", data: "cateId" },
			{ title: "Tên loại", data: "cateName" },
		],
		language: {
			search: 'Tìm Kiếm',
			lengthMenu: 'Xem _MENU_ Mục',
			info: 'Trang _PAGE_/_PAGES_',
			infoEmpty: 'Không tìm thấy ',
			infoFiltered: '(lọc từ _MAX_ mục)',
			zeroRecords: 'Không tìm thấy',
		},
		rowCallback: (row, data) => {
			$('td', row).on('click', () => {
				$("#formCategory").attr('action', '/admin/updateCategory');
				$(".btn-success").text("Cập nhật");
				$("input[name='cateId'").val(data.cateId);
				$("input[name='cateName'").val(data.cateName);
				$("#formCate").modal('show');

				if ($(".btn.btn-danger").hasClass("d-none")) {
					$(".btn.btn-danger").removeClass("d-none");
					$(".btn.btn-danger").attr("formaction", `/admin/${data.cateId}`);
				};
			});
			return row;
		},

	});

	$("#btnAddCate").on('click', () => {
		if (!$(".btn.btn-danger").hasClass("d-none")) {
			$(".btn.btn-danger").addClass("d-none");
		};
		$("#formCategory").attr('action', '/admin/addCategory');
		$(".btn-success").text("Lưu");
	});

	$("#formCategory").validate({
		errorClass: "error text-danger",
		validClass: "valid",
		rules: {
			cateName: {
				required: true,
			},
		},
		messages: {
			cateName: {
				required: "vui lòng nhập số điện thoại",
			},
		},
	});
	if (!!$("#errorCate").text()) {
		$("#formCate").modal('show');
	}
})