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
<title>User Enrolment</title>
<style type="text/css">
#container-in {
	margin-left: 300px;
}
</style>
</head>
<%@include file = "/WEB-INF/views/common/userLayout.jsp"%>
<body>
<div class="container">
	<div id="container-in">
		<h1>User Enrolment</h1>
		<table class="table" id="table-sbj-list">
			<thead>
				<tr>
					<th scope="col">수강신청 페이지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subject" items="${subjects}" varStatus="loop">
				<tr class="align-middle">
					<th scope="row"></th>
					<td>${subject.sbjNo}</td>
					<td>${subject.major}</td>
					<td>${subject.subject}</td>
					<td>${subject.prfsName}</td>
					<td>${subject.quarter}</td>
					<td>${subject.location}</td>
					<td>${subject.appliedCredit}</td>
					<td><span id="sbj-req-count-${subject.sbjNo}">${subject.reqCount}</span>/<span id="sbj-quota-${subject.sbjNo}">${subject.quota}</span>명</td>
					<td><span id="sbj-available-quota-${subject.sbjNo }">${subject.quota - subject.reqCount }</span> 명</td>
					<td>${subject.classTime}</td>
					<td>
						<button class="btn btn-outline-primary btn-sm ${(subject.quota eq subject.reqCount or empty LOGINED_USER) ? 'disabled' : '' }" 
						id="btn-req-sbj-${subject.sbjNo }"
						data-sbj-no="${subject.sbjNo }">수강신청</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="toast-container position-absolute bottom-0 end-0 p-3"></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 간단한 토스트 메세지에 대한 HTML 템플릿 -->
<script type="text/template" id="toast-simple-template">
	<div class="toast align-items-center text-white bg-primary" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000">
		<div class="d-flex">
			<div class="toast-body">message/div>
		</div>
	</div>
</script>

<!-- 제목을 포함하고 있는 토스트 메세지에 대한 HTML 템플릿 -->
<script type="text/template" id="toast-basic-template">
	<div class="toast role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="5000">
		<div class="toast-header">
			<i class="bi-alarm me-2"></i> <strong class="me-auto"><span>title</span></strong> <span></span>
		</div>
		<div class="toast-body">message</div>
	</div>
</script>
<script type="text/javascript">
$(function() {
	// Toast
	// 알람 메세지를 화면에 표시한다.
	var toastSimpleTemplate = $("#toast-simple-template").html()
	var toastBasicTemplate = $("#toast-basic-template").html()
	var $toastContainer = $('.toast-container')
	
	// 간단한 토스트 메세지를 표시한다.
	function createSimpleToast(message) {
		var $el = $(toastSimpleTemplate)
		$el.find('.toast-body').text(message)
		$el.appendTo($toastContainer)
		
		new bootstrap.Toast($el[0]).show()
	}
	// 제목을 포함하고 있는 토스트 메세지를 표시한다.
	function createBasicToast(title, message, course) {
		var $el = $(toastBasicTemplate)
		$el.find('.me-auto').text(title)
		$el.find('span').text(course.name)
		$el.find('.toast-body').text(message)
		$el.appendTo($toastContainer)
		
		new bootstrap.Toast($el[0]).show()
	}
	// 서버에 웹소켓연결을 요청한다.
	var socket = new WebSocket("ws://localhost/ws/alarm")
	
	// onopen이벤트가 발생했을 때 실행될 함수를 등록한다.
	// onopen이벤트는 서버와 연결이 완료되었을 때 발생하는 이벤트다.
	socket.onopen = function(event) {
		console.log("서버와 연결완료", event)
		createSimpleToast("서버가 보내는 알림을 받을 준비가 되었습니다.")
	}
	// onmessage이벤트가 발생했을 때 실행될 함수를 등록한다.
	// onmessage이벤트는 서버로부터 메세지를 받았을 때 발생하는 이벤트다.
	socket.onmessage = function(event) {
		console.log('서버가 보낸 메세지 수신', event)
		// event.data에는 서버가 클라이언트에게 보낸 데이터가 포함되어 있다.
		// 알람메세지의 경우, title, message, data 항목이 포함되어 있다.
		// 알람메세지의 경우, event.data에는 JSON형식의 텍스트가 저장되어 있다.
		
		// event.data에 저장된 JSON형식의 텍스트를 자바스크립트 객체 혹은 배열로 변환시키기
		var payload = JSON.parse(event.data)
		console.log("수신한 데이터", payload)
		/*
			payload = {
				title: "수강신청",
				message: "홍길동님이 수강신청하였습니다.",
				data: {
					no: 1,					과정번호
					name: '자바 기초 과정',		과정명
					quota: 5,				모집정원
					reqCount: 1				현재 신청자 수
				}
			}
		*/
		
		// payload에서 정보 조회
		var title = payload.title;
		var message = payload.message
		var sbjNo = payload.data.sbjNo;
		var sbjQuota = payload.data.quota;
		var sbjReqCount = payload.data.reqCount;
		
		// 과정 목록 테이블에서 해당 과정의 신청자수, 모집정원, 신청가능 수를 변경한다.
		$("#sbj-req-count-" + sbjNo).text(sbjReqCount);
		$("#sbj-quota-" + sbjNo).text(sbjQuota);
		$("#sbj-available-quota-" + sbjNo).text(sbjQuota - sbjReqCount);
		
		// 알람메세지를 표시한다.
		createBasicToast(title, message, payload.data);
	}

	// 수강신청하기 버튼 클릭시 AJAX 방식으로 서버에 수강신청정보를 전달해서 수강신청처리를 요청한다.
	$("#table-sbj-list tbody .btn-outline-primary").click(function() {
		var $btn = $(this);
		var sbjNo = $btn.data('sbj-no');
		$.ajax({
			url:"/user/ermt/request",
			data: {sbjNo:sbjNo},
			success: function() {
				createSimpleToast("수강신청이 완료되었습니다.");
				$btn.remove();
			},
			error: function() {
				createSimpleToast("수강신청 중 오류가 발생하였습니다.");
			}
		})
	})
})
</script>
</body>
</html>