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
		<form id="register-form" method="post" action="/prfsRegister">
			<section>
				<label for="input-prfs-id">교수 아이디</label>
				<input id="input-prfs-id" name="prfsId">
				<label for="input-prfs-password">교수 비밀번호</label>
				<input id="input-prfs-password" name="password">
				<label for="input-prfs-name">교수 이름</label>
				<input id="input-prfs-name" name="name">
			</section>
			<section>
				<select id="select-fac" name="faculty">
				<c:forEach var="code" items="${faculty}">
					<option id="option-fac" value="${code.commonCode }">${code.codeName}</option>
				</c:forEach>
				</select>
				<select id="select-major" name="major">
					<option>전공</option>
				</select>
				<label for="input-prfs-email">교수 이메일</label>
				<input id="input-prfs-email" name="email">
			</section>
			<section>
				<label for="input-prfs-birth">교수 생년월일</label>
				<input id="input-prfs-birth" type="date" name="birth">
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
	$('[name=faculty]').change(function() {
		var fac = $(this).val()
		doFiltering(fac)
	})
	
	$('[name=major]').change(function() {
		var fac = $(this).val()
		console.log(fac)
		doFiltering(fac)
	})
	function doFiltering(fac) {
		$.ajax({
				url:'/prfsRegisterJson',
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