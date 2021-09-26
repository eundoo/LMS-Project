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
table, th, td {border: 1px solid #2e8a9d; border-collapse: collapse }
section {margin:0}
#container-in {
	margin: 50px 50px 50px 350px;
}

.division {
	margin: 10px 0;
}

#info-table {
	border-width: 2px; 
}

#total-table {
	float : left;
}

#space-pic {
	height:110px;
}

.table-title {
	background-color: #a7dbf796;
}

#score-table {
	float : right;
}

</style>
</head>
<%@include file = "/WEB-INF/views/common/userLayout.jsp"%>
<body>
<div id="container">
	<div id="container-in">
		<h1>User Class</h1>
		<table class="division" id="head-table" style="width:100%">
			<colgroup>
				<col width="4%">
				<col width="5%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
				<col width="5%">
				<col width="11%">
					
			</colgroup>
			<tr>
				<th rowspan="3" id="space-pic">사진</th>
				<td class="table-title">학번</td>
				<td>${user.studentId }</td>
				<td class="table-title">이름</td>
				<td>${user.name }</td>
				<td class="table-title">성별</td>
				<td>${user.gender }</td>
				<td class="table-title">생년월일</td>
				<td>${user.birth }</td>
				<td class="table-title">이메일</td>
				<td>${user.email }</td>
			</tr>
			<tr>
				<td class="table-title">학부</td>
				<td>${user.facCode }</td>
				<td class="table-title">전공</td>
				<td>${user.majCode}</td>
				<td class="table-title">학년</td>
				<td>?</td>
			</tr>
			<tr>
				<td class="table-title">이수</td>
				<td>-</td>
				<td class="table-title">연계전공</td>
				<td>-</td>
				<td class="table-title">부전공</td>
				<td>-</td>
				<td class="table-title">특이사항</td>
				<td colspan="3">-</td>
			</tr>
		</table>
		<table class="division" style="width:100%">
			<tr>
				<td class="table-title" rowspan="2">교양선택</td>
				<td class="table-title" rowspan="2">교양필수</td>
				<td class="table-title" colspan="3">제1전공</td>
				<td class="table-title" rowspan="2">취득</td>
				<td class="table-title" rowspan="2">평점</td>
				<td class="table-title" rowspan="2">백분</td>
			</tr>
			<tr>
				<td class="table-title" colspan="1">학기</td>
				<td class="table-title" colspan="1">전공</td>
				<td class="table-title" colspan="1">계</td>
			</tr>
			<tr>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
				<td colspan="1">?</td>
			</tr>
		</table>
		<table id="total-table" style="width:30%">
			<tr>
				<th class="table-title">년도/학기</th>
				<th class="table-title">신청학점</th>
				<th class="table-title">취득학점</th>
				<th class="table-title">평점평균</th>
			</tr>
		<c:forEach var="score" items="${scores}">
			<tr>
				<td>${score.quarter }</td>
				<td>${score.appliedCredit }</td>
				<td>${score.acquisitionCredit }</td>
				<td>-</td>
			</tr>
		</c:forEach>

		</table>
		<table id="score-table" style="width:69.5%">
			<tr>
				<th class="table-title">이수구분</th>
				<th class="table-title">과목코드</th>
				<th class="table-title">과목명</th>
				<th class="table-title">신청학점</th>
				<th class="table-title">등급</th>
				<th class="table-title">재이수</th>
			</tr>
			<c:forEach var="subject" items="${subjects}">
			<tr>
				<td>${subject.division }</td>
				<td>${subject.sbjCode }</td>
				<td>${subject.subject }</td>
				<td>${subject.appliedCredit }</td>
				<c:if test="${subject.gotGrade eq '4.5' }">
					<td>A+</td>
				</c:if>
				<c:if test="${subject.gotGrade eq '4' }">
					<td>A</td>
				</c:if>
				<c:if test="${subject.gotGrade eq '3.5' }">
					<td>B+</td>
				</c:if>
				<c:if test="${subject.gotGrade eq '3' }">
					<td>B</td>
				</c:if>
				<c:if test="${subject.gotGrade eq '2.5' }">
					<td>C+</td>
				</c:if>
				<c:if test="${subject.gotGrade eq '2' }">
					<td>C</td>
				</c:if>
				<c:if test="${subject.gotGrade lt '2' }">
					<td>F</td>
				</c:if>
				<c:if test="${empty subject.gotGrade }">
					<td>-</td>
				</c:if>
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