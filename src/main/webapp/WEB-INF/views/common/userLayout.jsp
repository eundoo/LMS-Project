<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
ul {
    list-style: none;
    margin: 0px; 
    padding: 0px;
}
#layout-container {
	background-color: yellow;
}

#layout-left-bar {
	border: 1px solid black;
	width: 300px;
	height: 100%;
	position: fixed;
	z-index: 100;
	bottom: 0;
	left: 0;
}

#layout-user-bar #layout-nav {
	padding: 60px;
}

.layout-user-ul li{
	margin-top: 35px;
}
</style>
</head>
<body>
<div id="layout-container">
	<div id="layout-left-bar">
		<div id="layout-user-bar">
			<nav id="layout-nav">
				<ul class="layout-user-ul">
					<li>학생메인</li>
					<li><a href="/user/class">수업/성적</a></li>
					<li><a href="/user/enrolment">수강신청</a></li>
				</ul>
				<ul class="layout-user-ul">
					<li>학생어쩌고</li>
					<li><a href="/user/appForm">휴학/복학/자퇴</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
})
</script>
</body>
</html>