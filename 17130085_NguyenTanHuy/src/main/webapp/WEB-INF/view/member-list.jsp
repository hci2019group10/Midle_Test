<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member list</title>
<link rel="stylesheet" href="resource/bootstrap-4.1.3-dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="resource/css/member-list.css">
</head>
<body>
	<div class="container">
        <h1>DANH SÁCH THÀNH VIÊN</h1>
        <div class="member">
            <div class="left">
                <p><b>Tổng số thành viên: ${listMemberSize }</b></p>
                <p><b>Chọn giới tính:</b>
                    <select id="changeGender">
                            <option value="">[Chọn]</option>
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>

                    </select>
                </p>
            </div>
            <div class="right">
                <a href="http://localhost:8080/17130085_NguyenTanHuy/">Thêm thành viên</a>
            </div>
        </div>
        <div class="table-list">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Họ tên</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${listMember}">
                    <tr class="tr-body">
                        <td class="name">${item.userName}</td>
                        <td class="birthday"><fmt:formatDate pattern = "dd/MM/yyyy" value = "${item.birthday}" /></td>
                        <c:if test="${item.female==true}">
                        <td class="gender">Nữ</td>
                        </c:if>
                        <c:if test="${item.female==false}">
                        <td class="gender">Nam</td>
                        </c:if>
                        <td class="email"><a href= "memberDetail?email=${item.email }">${item.email}</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
<script src="resource/js/jquery.min.js"></script>

<script src="resource/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
<!-- <script src="resource/js/popper.min.js"></script> -->
<script>
         $(function () {
            $('#changeGender').change(function () {
            	var gen = $('#changeGender').val();
                $.ajax({
                    url: 'chooseGender' ,
                    type: 'POST',
                    data:{gender:gen},
                    dataType: 'json',
                    encoding: 'UTF-8', 
                    success:function (data) {
                    	$(".tr-body").hide();
                    	for (var i = 0; i < data.length; i++) {
                    		var isGender = data[i].female;
                    		var gender;
                    		if(isGender===true){
                    			gender = "Nữ";
                    		}
                    		if(isGender === false){
                    			gender = "Nam";
                    		}
                    		var date = new Date(data[i].birthday);
                    		var birth = date.getDate()+"/"+ date.getMonth()+"/"+date.getYear();
                    		
                            $("table tbody").append("<tr class= 'tr-body'><td class='name'>" + data[i].userName + "</td><td class='birthday'>" + birth + "</td><td class='gender'>" + gender + "</td><td class='email'><a href='memberDetail?email="+data[i].email+"'>" + data[i].email + "</a></td></tr>");
                        }
                    }
                });
            });
        });

</script>
</html>