$(document).ready(() => {
	$.validator.addMethod(
		"email",
		function(value) {
			return /[^@]+@[^@]+\.[a-zA-Z]{2,6}/.test(value);
		},
		"Vui lòng nhập đúng đinh dạng abc@domain.tld"
	);
	$("#register-form").validate({
		rules: {
			storePhone: {
				required: true,
			},
			storeName: {
				required: true,
			},
			storeEmail: {
				required: true,
				email: true
			},
			storePassword: {
				required: true,
			},
			repeatPassword: {
				required: true,
				equalTo: "#storePassword"
			}

		},
		messages: {
			storePhone: {
				required: "vui lòng nhập số điện thoại",
			},
			storeName: {
				required: "Vui lòng nhập tên cửa hàng",
			},
			storeEmail: {
				required: "Vui lòng nhập địa chỉ email",
			},
			storePassword: {
				required: "Vui lòng nhập mật khẩu",
			},
			repeatPassword: {
				required: "Vui lòng nhập lại mật khẩu",
				equalTo: "Mật khẩu không khớp"
			}
		},
	});
	$("#register-form").on("submit", function(event) {
		if ($(this).valid()) {
			$(this).submit();
		}
	})
});