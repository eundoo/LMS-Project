<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Professor Management</title>
<style type="text/css">
#container-in {
	margin-left: 300px;
}

table, th, td {	border: 1px solid black; border-collapse: collapse }

</style>
</head>
<body>
<%@include file = "/WEB-INF/views/common/prfsLayout.jsp"%>
<h1>Professor Management</h1>
<div class="container">
	<div id="container-in">
		<h1>User AppForm</h1>
		<table id="table-list">
			<c:choose>
			<c:when test="${empty user}">
			<tr>
				<td>등록된 신청서가 존재하지 않습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="user" items="${user}">
			<tr>
				<th>학생 학번</th>
				<th>학생 이름</th>
				<th>학생 이메일</th>
				<th>학생 생년월일</th>
				<th>학생 성별</th>
				<th>학생 졸업 유무</th>
				<th>자퇴 사유</th>
				<th>처리</th>
			</tr>
			<tr>
				<td><button id="user-no" class="btn-outline-primary" data-std-no="${user.no}">${user.studentId }</button></td>
				<td>${user.name }</td>
				<td>${user.email }</td>
				<td>${user.birth }</td>
				<td>${user.gender }</td>
				<td>${user.isGraduated }</td>
				<td>${user.title }</td>
				<!-- 모달창띄워 -->
				<c:if test="${user.status eq 'W' }">
					<td id="cng-status" data-std-status="${user.status }">대기</td>
				</c:if>
				<c:if test="${user.status eq 'A' }">
					<td id="cng-status" data-std-status="${user.status }">승인</td>
				</c:if>
				<c:if test="${user.status eq 'D' }">
					<td id="cng-status" data-std-status="${user.status }">반려</td>
				</c:if>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div>
			<!-- for문돌때 id로 하지말고 data로해야됨 -->
			<span id="app-no"></span>
			<span id="app-kind"></span>
			<span id="app-quarter"></span>
			<span id="app-uploaded-date"></span>
			<h3 id="app-title"></h3>
			<div id="app-description"></div>
			<div id="app-upfile"></div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" value="A">승인</button>
        <button type="button" class="btn btn-primary" value="D">거절</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() { 

	var modal = new bootstrap.Modal(document.getElementById('myModal'))

	$('#table-list').on('click', '.btn-outline-primary', function() {
		var stdNo = $(this).data('std-no')
		console.log(stdNo)
		
		$.getJSON("/professor/management/json", {no:stdNo}, function(response) {
				
			if(response != null) {
				$.each(response, function(index, app) {

					$('#app-no').text(app.appNo).val(app.appNo)
					$('#app-kind').text(app.kind)
					$('#app-quarter').text(app.quarter)
					$('#app-uploaded-date').text(app.uploadedDate)
					$('#app-title').text(app.title)
					$('#app-description').text(app.description)
					$('#app-upfile').text(app.upFile)
				})
			}
			modal.show()
		})
		
		$('#myModal').on('click', '.btn-primary', function() {
		var appNo = $('#app-no').val()
		var status = $(this).val()
		console.log(appNo)
		console.log(status)
			
			$.ajax({
			url:'/professor/management/update',
			dataType: 'json',
			data: {status:status,
				   appNo:appNo},
			success: 
				alert("제출되었습니다.")
				//여기서 대기 승인 반려 추가해야됨
		})
			
		})
	})
})
</script>
</body>
</html>