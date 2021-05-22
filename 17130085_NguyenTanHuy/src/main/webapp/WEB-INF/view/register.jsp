<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="resource/css/register.css" />
<link rel="stylesheet"
	href="resource/bootstrap-4.1.3-dist/css/bootstrap.min.css" />
<style>
label.error {
	color: red;
	padding-left: 2%;
}
.error {
	color: red;
	padding-left: 2%;
}
a{
	border: 1px solid lightgray;
	text-decoration: none;
	color: black;
	border-radius: 3px;
	padding: 3px 5px 3px 5px;
}
a:hover {
	background-color: gray;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Đăng ký thành viên</h1>
		<form:form name="register-form"  modelAttribute="user" action="register">
			<div class="form-group">
				<label for="email" class="lbl obligate">Địa chỉ email:</label>
				<form:input class="form-control" id="email" path="email" />
				<form:errors path="email" cssClass="error"/>
				<span class = "message mailmessage"></span>
			</div>
			<div class="form-group">
				<label for="password" class="lbl obligate">Mật khẩu:</label>
				<form:password class="form-control" id="password" path="password" />
				<form:errors path="password" cssClass="error"/>
			</div>
			<div class="form-group">
				<label for="re_password" class="lbl obligate">Nhập lại mật
					khẩu:</label>
				<input type="password" class="form-control" id="re_password"
					name="re_password"  />
				<span class = "message rePass"></span>
			</div>
			<div class="form-group">
				<label for="userName" class="lbl obligate">Họ tên:</label>
				<form:input class="form-control" id="userName" path="userName" />
				<form:errors path="userName" cssClass="error"/>
			</div>
			<div class="form-group">
				<label for="birthday" class="lbl obligate">Ngày sinh:<br />(dd/MM/yyyy)
				</label>
				<form:input class="form-control" id="birthday" path="birthday" />
				<form:errors path="birthday" cssClass="error"/>
			</div>
			<div class="form-group">
				<label for="tlp" class="lbl">Giới tính:</label>
				<div class="check-form">
					<div class="form-check-inline">
						<label class="form-check-label" for="gender"> <form:checkbox
								class="form-check-input" id="gender"
								path="female" />Nữ
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="" class="lbl">Trình độ văn hóa:</label>
				<form:select class="form-control" path="education" >
					<form:option value="" label="[Chọn]" />
					<form:option value="Tốt nghiệp phổ thông" label="Tốt nghiệp phổ thông" />
					<form:option value="Cao đẳng" label="Cao đẳng" />
					<form:option value="Đại học" label="Đại học" />
					<form:option value="Thạc sĩ" label="Thạc sĩ" />
					<form:option value="Tiến sĩ" label="Tiến sĩ" />

				</form:select>
			</div>
			<div class="form-group">
				<label for="" class="lbl">Địa chỉ:</label>
				 <form:select class="form-control" path="address">
				 	<form:option value="" label="[Chọn]" />
					<form:option value="TP Hồ Chí Minh" label="TP Hồ Chí Minh"/>
					<form:option value="Đà Nẵng" label="Đà Nẵng"/>
					<form:option value="Huế" label="Huế"/>
					<form:option value="Hà Nội" label="Hà Nội"/>
				</form:select>
			</div>
			<div class="form-group">
				<label for="phone_num" class="lbl">Điện thoại:</label> 
				<input type="number" class="form-control" id="phone_num" name="phone"/>
			</div>
			<form:button type="submit" class="btn btn-primary">Lưu</form:button>
		<a href="memberList">Hủy bỏ</a>
			
		</form:form>
	</div>
</body>
<script src="resource/js/jquery.min.js"/></script>
<script src="resource/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<script src="resource/js/jquery.validate.min.js" /></script>
<!-- <script>
    $(function() {
        $("form[name='register-form']").validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                },
                password: {
                    required: true,
                    minlength: 8,
                },
                re_password: {
                    required: true,
                    equalTo: '#password',
                },
                userName: {
                    required: true,
                },
                birthday: {
                    required: true,
                    dateFormat: true,
                },
            },
            messages: {
                email: {
                    required: 'Bạn không thể để trống dữ liệu này',
                    eamil: 'Email không hợp lệ',
                },
                password: {
                    required: 'Bạn không thể để trống dữ liệu này',
                    minlength: 'Mật khẩu ít nhất 8 ký tự',
                },
                re_password: {
                    required: 'Bạn không thể để trống dữ liệu này',
                    equalTo: 'Mật khẩu không tương ứng',
                },
                userName: {
                    required: 'Bạn không thể để trống dữ liệu này',
                },
                birthday: {
                    required: 'Bạn không thể để trống dữ liệu này',
                    dateFormat: "Định dạng ngày không hợp lệ"
                },
            },
        });
    });
</script>
<script>
    jQuery.validator.addMethod(
        'dateFormat',
        function(value, element) {
            var check = false;
            var re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
            if (re.test(value)) {
                var adata = value.split('/');
                var dd = parseInt(adata[0], 10);
                var mm = parseInt(adata[1], 10);
                var yyyy = parseInt(adata[2], 10);
                var xdata = new Date(yyyy, mm - 1, dd);
                if (
                    xdata.getFullYear() === yyyy &&
                    xdata.getMonth() === mm - 1 &&
                    xdata.getDate() === dd
                ) {
                    check = true;
                } else {
                    check = false;
                }
            } else {
                check = false;
            }
            return this.optional(element) || check;
        }

    );
</script> -->

<script>
        $(function () {
            $('#email').blur(function () {
           		checkMail();
            });
        });

       function checkMail() {
           var mail = $('#email').val();
            $.ajax({
                url: 'checkMail' ,
       
                type: 'POST',
                data:{email:mail},
                dataType: 'json',
                encoding: 'UTF-8',
                success:function (data) {
                    $('.mailmessage').text(data).css('color', 'red').css("margin-left", "2%");
                }
            });
       }
       
       $(function() {
           $('#re_password').keyup(function() {
               var rePass = $('#re_password').val();
               var pass = $('#password').val();
               $.ajax({
                   url: 'checkRePass',
                
                   type: 'POST',
                   data: {
                	   Pass : pass,
                       RePass: rePass
                   },
                   dataType: 'json',
                   encoding: 'UTF-8',
                   success: function(data) {
                       $('.rePass').text(data).css('color', 'red').css("margin-left", "2%");
                   }
               });
           });
       });
       
</script>
</html>