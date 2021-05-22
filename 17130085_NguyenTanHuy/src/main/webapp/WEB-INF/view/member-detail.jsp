<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Member Detail</title>
<link rel="stylesheet" href="resource/bootstrap-4.1.3-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="resource/css/member-detail.css"/>
</head>
<body>
	<div class="container">
		<h1>Chi tiết thành viên</h1>
		<div class="content">
			<div class="content-item">
				<label for="">Họ Tên: </label>
				<p>${user.userName}</p>
			</div>
			<div class="content-item">
				<label for="">Ngày sinh: </label>
				<p><fmt:formatDate pattern = "dd/MM/yyyy" value = "${user.birthday}" /></p>
			</div>
			<div class="content-item">
				<label for="">Giới tính: </label>
				<c:if test="${user.female==true}">
					<p>Nữ</p>
				</c:if>
				<c:if test="${user.female==false}">
					<p>Nam</p>
				</c:if>
			</div>
			<div class="content-item">
				<label for="">Trình độ văn hóa: </label>
				<p>${user.education }</p>
			</div>
			<div class="content-item">
				<label for="">Địa chỉ: </label>
				<p>${user.address }</p>
			</div>
			<div class="content-item">
				<label for="">Điện thoại: </label>
				<p>${user.phone } </p>
			</div>
			<div class="content-item">
				<label for="">Điạ chỉ email: </label>
				<p>${user.email }</p>
			</div>
		</div>
		<a href="memberList"> Danh sách thành viên</a>
	</div>

	
</body>
<script src="resource/js/jquery.min.js"></script>
<script src="resource/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
	
</html>