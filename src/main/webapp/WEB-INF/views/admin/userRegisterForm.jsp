<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>샘플 애플리케이션</title>
<style type="text/css">
#container-in {
	width: 1080px;
	margin: 0 auto;	
}
/*지워야됨*/
#header {
	margin-top: 300px;
}
#form section {
	margin: 30px 0;
}

</style>
</head>
<body>
<div id="container">
	<div id="container-in">
	<div id="header"></div>
		<form id="register-form" method="post" action="/userRegister">
			<section>
				<label for="input-student-id">학생 아이디</label>
				<input id="input-student-id" name="studentId">
				<label for="input-student-password">학생 비밀번호</label>
				<input id="input-student-password" name="password">
				<label for="input-student-name">학생 이름</label>
				<input id="input-student-name" name="name">
			</section>
			<section>
				<select id="select-fac" name="facCode">
				<c:forEach var="code" items="${faculty}">
					<option id="option-fac" value="${code.commonCode }">${code.codeName}</option>
				</c:forEach>
				</select>
				<select id="select-major" name="majCode">
					<option>전공</option>
				</select>
				<label for="input-student-email">학생 이메일</label>
				<input id="input-student-email" value="email" name="email">
			</section>
			<section>
				<label for="input-student-date">학생 생년월일</label>
				<input id="input-student-date" type="date" name="birth">
				<select id="select-gender" name="gender">
					<option>성별</option>
					<option>F</option>
					<option>M</option>
					<option>Gender Non-binary</option>
				</select>
			</section>
			<button class="btn btn-primary" type="submit">등록</button>
		</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$('[name=facCode]').change(function() {
		var fac = $(this).val()
		doFiltering(fac)
	})
	
	$('[name=majCode]').change(function() {
		var fac = $(this).val()
		console.log(fac)
		doFiltering(fac)
	})
	function doFiltering(fac) {
		$.ajax({
				url:'/userRegisterJson',
				data: {facCode: fac},
				dataType:'json',
				success:
					function(filtering) {
					$.each(filtering, function(index, codes) {
						var fac = $('#select-fac').val()
						console.log(fac)
						if(fac == codes.parentCode) {
							var row = ''
							row += '<option name="major" value='+codes.commonCode+'>'+codes.codeName+'</option>'
							$('#select-major').append(row)
						}
					})
				}
		})
	}
	
})

</script>
</body>
</html>