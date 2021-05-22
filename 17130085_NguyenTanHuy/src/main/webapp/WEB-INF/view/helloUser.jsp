<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello User</title>
	<style type="text/css">
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
	<h1> Chào mừng bạn ${user.userName }.</h1>
    <p>Bạn có thể đăng nhập với tên: <b>${user.email }</b> và mật khẩu là: <b>${user.password }</b></p>
    <a href="memberList">Đóng</a>
</body>
</html>