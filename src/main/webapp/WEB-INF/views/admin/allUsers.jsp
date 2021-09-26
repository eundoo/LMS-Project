<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>ADMIN</title>
<style type="text/css">
</style>
</head>
<body>
<h1>게시판</h1>
<div class="container my-3">
	<div class="row mb-1">
		<div class="col">
			<div class="bordered bg-dark text-white fw-bold p-2">
				모든 유저 리스트
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="bordered bg-light p-2">
				<div class="form-check" id="box-category-list">
				<!-- 학생 교수자리 -->
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-1">
		<div class="col">
			<div class="bordered bg-dark text-white fw-bold p-2">
				모든 유저 리스트
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="bordered bg-light p-2">
				<table class="table" id="table-product-list">
					<colgroup>
						<col width="10%">
						<col width="13%">
						<col width="13%">
						<col width="13%">
						<col width="13%">
						<col width="13%">
					</colgroup>
					<thead>
						<tr>
							<th>no.</th>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>상세정보</th>
							<th>추가정보</th>
						</tr>
					</thead>
					<tbody>
					<!-- 리스트 자리 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 상품 상세정보 모달  -->
<div id="modal-user-detail" class="modal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered" id="table-product-detaiil">
					<colgroup>
						<col width="13%">
						<col width="20%">
						<col width="13%">
						<col width="20%">
						<col width="13%">
						<col width="20%">
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td id="all-no"></td>
							<th>아이디</th>
							<td id="all-id"></td>
							<th>졸업여부</th>
							<td id="all-graduated"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td id="all-birth"></td>
							<th>이름</th>
							<td id="all-name"></td>
							<th>성별</th>
							<td id="all-gender"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="all-email"></td>
							<th>학부</th>
							<td id="all-fac"></td>
							<th>전공</th>
							<td id="all-maj"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- 상품 리뷰리스트 모달  -->
<div id="modal-review-list" class="modal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">상품리뷰 리스트</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p class="card-text fw-bold">샘베딩 플레인 침대 SS(색상2종)+노뜨 매트 2종</p>
				<table class="table" class="table-review-list">
					<colgroup>
						<col width="10%">
						<col width="">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	var allDetailModal = new bootstrap.Modal(document.getElementById("modal-user-detail"),{
		keyboard:false
	})
	var productReviewModal = new bootstrap.Modal(document.getElementById("modal-review-list"),{
		keyboard:false
	})
	
	var $categoryDivBox = $('#box-category-list').empty()
	
	$.ajax({
		url:'/list',
		dataType:'json',
		success: function(response) {
			$.each(response, function(index, category) {
				var div = '<div class="form-check form-check-inline">'
				div += '<input class="form-check-input" data-radio-value-user="'+category.commonCode+'" type="radio" name="status" value="'+category.commonCode+'">'
				div += '<label class="form-check-label">'+category.codeName+'</label>'
			 	div += '</div>'
				
			 	$categoryDivBox.append(div)
			})
		}
	})
	
	$('#box-category-list').on('change', ':radio', function() {
		var category = $(this).val()
		console.log(category)
		var $tbody = $('#table-product-list tbody').empty()
		alert(category)
		$.getJSON("userList", {ctg:category}, function(response) {
			var users = response.users
			var prfs = response.prfs
			console.log(response)
			
			$.each(users, function(index, user) {
				if(user != null && category == 'CTG01') {
				    var row = '<tr class="align-middle">'
					row += 		'<td>'+(index+1)+'</td>'					
					row += 		'<td>'+user.userNo+'</td>'					
					row += 		'<td>'+user.studentId+'</td>'					
					row += 		'<td>'+user.name+'</td>'					
					row += 		'<td>'
					row +=			'<button class="btn btn-outline-primary btn-sm" data-all-no="'+user.userNo+'">상세정보</button>'
					row += 		'</td>'		
					row += 		'<td>'
					row +=			'<button class="btn btn-outline-dark btn-sm" data-all-no="'+user.userNo+'">리뷰보기</button>'	
					row += 		'</td>'		
					row += 	'</tr>'	
					
					$tbody.append(row)
				}
			})
			$.each(prfs, function(index, prfs) {
				if(prfs != null && category === 'CTG02') {
				    var row = '<tr class="align-middle">'
					row += 		'<td>'+(index+1)+'</td>'	
					row += 		'<td>'+prfs.prfsNo+'</td>'					
					row += 		'<td>'+prfs.prfsId+'</td>'					
					row += 		'<td>'+prfs.name+'</td>'					
					row += 		'<td>'
					row +=			'<button class="btn btn-outline-primary btn-sm" data-all-no="'+prfs.prfsNo+'">상세정보</button>'
					row += 		'</td>'		
					row += 		'<td>'
					row +=			'<button class="btn btn-outline-dark btn-sm" data-all-no="'+prfs.prfsNo+'">리뷰보기</button>'	
					row += 		'</td>'			
					row += 	'</tr>'	
					
					$tbody.append(row)
				}
				
			})
		})
	})
	// 유저의 상세보기 버튼을 클릭할 때마다 실행되는 요청핸들러 함수를 등록ㅎ기
	$('#table-product-list').on('click', '.btn-outline-primary', function() {
		var allNo = $(this).data('all-no')
		console.log(allNo)
		var radioValueUser = $(this).data('radio-value-user')
		alert(allNo)
		$.getJSON("detail", {no:allNo}, function(response) {
			var user = response.user
			var prfs = response.prfs

			console.log(response)
			
			if(user != null) {
				
				$('#all-no').text(user.userNo)
				$('#all-id').text(user.studentId)
				$('#all-birth').text(user.birth)
				$('#all-name').text(user.name)
				$('#all-gender').text(user.gender)
				$('#all-email').text(user.email)
				$('#all-fac').text(user.facCode)
				$('#all-maj').text(user.majCode)
				$('#all-graduated').text(user.isGraduated)
				
				allDetailModal.show()
			}
			
			if(prfs != null) {
				
				$('#all-no').text(prfs.prfsNo)
				$('#all-id').text(prfs.prfsId)
				$('#all-birth').text(prfs.birth)
				$('#all-name').text(prfs.name)
				$('#all-gender').text(prfs.gender)
				$('#all-email').text(prfs.email)
				$('#all-fac').text(prfs.facCode)
				$('#all-maj').text(prfs.majCode)
				$('#all-graduated').text('-')
				
				allDetailModal.show()
			}
			
		})
	})
	
})
</script>
</body>
</html>