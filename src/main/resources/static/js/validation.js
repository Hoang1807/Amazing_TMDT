 // validate phone
  $.validator.addMethod(
    "phone",
    function (value) {
      return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(value);
    },
    "Điện thoại chưa đúng đinh dạng"
  );
  
//validate login form
  $("#loginForm").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userPassword: {
        required: true,
        maxlength: 50,
        noSpace: true,
      }
    },
    messages: {
	  userPhone: {
        required: "Vui lòng nhập số điện thoại",
        maxlength: "vui lòng dưới 10 ký tự",
      },
      userPassword: {
        required: "Vui lòng nhập mật khẩu",
        maxlength: "Vui lòng nhập dưới 50 kí tự",
        noSpace: "Không tạo khoảng trắng!"
      },
    },
  });