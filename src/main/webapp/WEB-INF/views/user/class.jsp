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
<title>User Class</title>
<style type="text/css">
#container-in {
	margin-left: 300px;
}

table, th, td {	border: 1px solid black; border-collapse: collapse }

#total-table {
	float : left
}
</style>
</head>
<%@include file = "/WEB-INF/views/common/userLayout.jsp"%>
<body>
<div class="container">
	<div id="container-in">
		<h1>User Class</h1>
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
			<td>학년</td>
			<td>22222</td>
			<td>전공</td>
			<td>${user.majCode}</td>
		</tr>
		<tr>
			<td>이수</td>
			<td>33333</td>
			<td>연계전공</td>
			<td>-</td>
			<td>부전공</td>
			<td>-</td>
			<td>기타</td>
			<td colspan="3">-</td>
		</tr>
	</table>
	
	<table style="width:100%">
		<tr>
			<td rowspan="2">교양선택</td>
			<td rowspan="2">교양필수</td>
			<td colspan="3">제1전공</td>
			<td rowspan="2">취득</td>
			<td rowspan="2">평점</td>
			<td rowspan="2">백분</td>
		</tr>
		<tr>
			<td colspan="1">학기</td>
			<td colspan="1">전공</td>
			<td colspan="1">계</td>
		</tr>
		<tr>
			<td colspan="1">?</td>
			<td colspan="1">?</td>
			<td colspan="1">?</td>
			<td colspan="1">${user.majCode }</td>
			<td colspan="1">?</td>
			<td colspan="1">?</td>
			<td colspan="1">?</td>
			<td colspan="1">?</td>
		</tr>
	</table>
	<table id="total-table">
		<tr>
			<th>년도/학기</th>
			<th>신청학점</th>
			<th>취득학점</th>
			<th>평점평균</th>
		</tr>
		<tr>
			<td>?</td>
			<td>?</td>
			<td>?</td>
			<td>?</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>이수구분</th>
			<th>과목코드</th>
			<th>과목명</th>
			<th>신청학점</th>
			<th>등급</th>
			<th>재이수</th>
		</tr>
	<c:forEach var="subject" items="${subjects}">
		<tr>
			<td>${subject.division }</td>
			<td>${subject.sbjCode }</td>
			<td>${subject.subject }</td>
			<td>${subject.appliedCredit }</td>
			<td>${subject.gotGrade }</td>
			<td>-</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>