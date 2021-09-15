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
</style>
</head>
<body>
<div id="container">
	<div id="container-in">
		<div id="header">
			<form id="register-form" method="post" action="/subjectRegister"> 
				<select name="prfsNo">
				<c:forEach var="professor" items="${professors }">
					<option value="${professor.prfsNo}">${professor.name}</option>
				</c:forEach>
				</select>
				<select id="fac-code"name="facCode">
				<c:forEach var="faculty" items="${faculties }">
					<option value="${faculty.commonCode}">${faculty.codeName}</option>
				</c:forEach>
				</select>
				<select id="major-code" name="majCode">
					<option>전공</option>
				</select>
				<select id="sbj-code" name="sbjCode">
					<option>과목</option>
				</select>
				<select name="quarter">
				<c:forEach var="quarter" items="${quarter }">
					<option value="${quarter.commonCode}">${quarter.codeName}</option>
				</c:forEach>
				</select>
				<select name="division">
					<option>이수구분</option>
					<option>전공</option>
					<option>교양필수</option>
					<option>교양선택</option>
				</select>
				<select name="appliedCredit">
					<option>학점</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
				<input value="quota" name="quota">
				<select id="date">
					<option>시간</option>
					<option>월</option>
					<option>화</option>
					<option>수</option>
					<option>목</option>
					<option>금</option>
				</select>
				<select id="period">
					<option>교시</option>
					<option>1/2/3</option>
					<option>4,5,6</option>
					<option>7,8,9</option>
					<option>1,2</option>
					<option>3,4</option>
					<option>5,6</option>
					<option>7,8</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
				</select>
				<input id="class-time" type="hidden" name="classTime">
				<select name="location">
				<c:forEach var="location" items="${locations }">
					<option value="${location.commonCode }">${location.codeName }</option>
				</c:forEach>
					<option>
				</select>
				<button onclick="sum()" class="btn btn-primary" type="submit">등록</button>
			</form>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function sum() {
	var classTime = $('#date').val()
	var period = $('#period').val()
	var hiddenClassTime = document.getElementById('class-time')
	
	var thisDate = classTime+period
	
	hiddenClassTime.setAttribute("value",thisDate)
}
$(function() {
	$('[name=facCode]').change(function() {
		var fac = $(this).val()
		doFiltering(fac)
	})
	
	$('[name=majCode]').change(function() {
		var fac = $(this).val()
		doFiltering(fac)
	})
	function doFiltering(fac) {
		$.ajax({
			url:'/subjectRegisterJson',
			data: {facCode: fac},
			dataType:'json',
			success:
				function(filtering) {
				$.each(filtering, function(index, codes) {
					var fac = $('#fac-code').val()
					if(fac == codes.parentCode) {
						var row = ''
							row += '<option name="majCode" value='+codes.commonCode+'>'+codes.codeName+'</option>'
							$('#major-code').append(row)
					}
					var maj = $('#major-code').val()
					if(maj == codes.parentCode) {
						var row = ''
							row += '<option name="sbjCode" value='+codes.commonCode+'>'+codes.codeName+'</option>'
							$('#sbj-code').append(row)
					}
				})
			}
		})
	}
})

</script>
</body>
</html>