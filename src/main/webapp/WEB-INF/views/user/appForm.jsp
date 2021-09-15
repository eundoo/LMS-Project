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

</style>
</head>
<%@include file = "/WEB-INF/views/common/userLayout.jsp"%>
<body>
<div class="container">
	<div id="container-in">
		<h1>User AppForm</h1>
		<table>
			<tr>
				<th rowspan="3">사진</th>
				<td>학번</td>
				<td>${user.studentId }</td>
				<td>이름</td>
				<td>${user.name }</td>
				<td>성별</td>
				<td>${user.gender }</td>
				<td>생년월일</td>
				<td>${user.birth }</td>
				<td>이메일</td>
				<td>${user.email }</td>
			</tr>
			<tr>
				<td>학부</td>
				<td>${user.facCode }</td>
				<td>전공</td>
				<td>${user.majCode}</td>
			</tr>
		</table>
		<form id="drop-out">
		<a href="/user/dropOutUpload">자퇴신청</a>
			<table>
				<tr>
					<th>신청일자</th>
					<th>신청학기</th>
					<th>자퇴사유</th>
					<th>사유</th>
					<th>처리구분</th>
					<th>삭제</th>
				</tr>
			</table>
		</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>