<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>User AppForm</title>
<style type="text/css">
#container-in {
	margin-left: 300px;
}

table, th, td {	border: 1px solid black; border-collapse: collapse }

.board {
	width: 1080px;
}

#main-board {
	height: 700px;
}
</style>
</head>
<%@include file = "/WEB-INF/views/common/userLayout.jsp"%>
<body>
<div class="container">
	<div id="container-in">
		<h1>User AppForm</h1>
		<form id="drop-out-of" enctype="multipart/form-data" action="/user/dropOutUpload" method="post">
			<span>신청일자</span>
			<input name="uploadedDate" type="date">
			<span>신청학기</span>
			<select name="quarter">
				<option>2022/1학기</option>
				<option>2022/2학기</option>
				<option>2022/3학기</option>
				<option>2022/4학기</option>
			</select>
			<select name="kind">
				<option>휴학</option>
				<option>자퇴</option>
				<option>유예</option>
			</select>
			<div>
				<h2>사유</h2>
				<textarea name="title" class="board" rows="1" cols="55" required></textarea>
			</div>
			<div>
				<textarea name="description" id="main-board"class="board" name="" required></textarea>
			</div>
			<input id="upload" type="file" value="파일 업로드">
			<button type="submit">신청</button>
		</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>