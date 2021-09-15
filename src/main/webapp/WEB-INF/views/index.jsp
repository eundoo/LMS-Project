<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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

#login-box {
	width: 600px;
	margin: 0 auto;
}

.label-login {
	display: block;
	margin: 5px 0;
}

#button-login {
	margin: 15px 0;
}
</style>
</head>
<body>
<div id="container">
	<div id="container-in">
		<div id="header"></div>
		<div id="login-box">
			<h1>UNE University</h1>
			<span>LOGIN</span>
			<div>
				<label for="checkbox-prf">교직원</label>
				<input id="checkbox-prf" type="radio" name="kind" value="professor">
				<label for="checkbox-std">학부</label>
				<input id="checkbox-std" type="radio" name="kind" value="user">
			</div>
			<div>
				<form id="form-login" name="formLogin">
					<section>
						<label class="label-login" for="input-id">아이디</label>
						<input id="input-id" name="id">
					</section>
					<section>
						<label class="label-login" for="input-password">비밀번호</label>
						<input id="input-password" name="password">
					</section>
				</form>
				<button id="button-login" class="btn btn-primary" type="button" onclick="buttonClick()" type="button">로그인</button>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function buttonClick() {
	var form  = document.formLogin
	
	var id = $.trim($('#input-id').val())
	var password = $.trim($('#input-password').val())
	
	if(!id || !password) {
		alert('아이디 비밀번호를 확안해주세요.')
		return false
	}else if($('input[name=kind]:checked').val() === 'professor') {
		login()
	}else if($('input[name=kind]:checked').val() === 'user') {
		login()
	}
		function login() {
			var kind = $('input[name=kind]:checked').val()
			var id = $('#input-id').val()
			var password = $('#input-password').val()
			console.log(kind)
			$.ajax({
				url:"/login",
				dataType:"json",
				data:{id: id,
					  password: password,
					  kind: kind},
				success: function(doLogin) {
				console.log(doLogin.check)
					if(doLogin.check === 'FAIL') {
						alert('아이디와 비밀번호를 확인하세요')
						return false
					}else if(doLogin.check === 'GRANTED' && kind == 'professor') {
						console.log(kind)
						form.action = '/professor/main'
						form.submit()
					}else if(doLogin.check === 'GRANTED' && kind == 'user') {
						form.action = '/user/main'
						form.submit()
					}
				} 
			})
		
		}
}

</script>
</body>
</html>