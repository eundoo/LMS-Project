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
<title>Professor Research</title>
<style type="text/css">
#container-in {
	margin-left: 300px;
}
</style>
</head>
<%@include file = "/WEB-INF/views/common/prfsLayout.jsp"%>
<body>
<div class="container">
	<div id="container-in">
		<h1>Professor Research</h1>
		<form id="register-form" method="post" action="/professor/researchRegister">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">논문 목록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">교수명</th>
						<td>
							<input name="prfsNo" value="${professor.prfsNo}" placeholder="${professor.name}" readonly>
						</td>
					</tr>
					<tr>
						<th scope="row">논문명</th>
						<td><input name="title"></td>
					</tr>
					<tr>
						<th scope="row">발행기관</th>
						<td><input name="issuer"></td>
					</tr>
					<tr>
						<th scope="row">학문분야</th>
						<td><input name="area"></td>
					</tr>
					<tr>
						<th scope="row">지원기관</th>
						<td><input name="supportAgency"></td>
					</tr>
					<tr>
						<th scope="row">첨부파일</th>
						<td><input name="attachFile"></td>
					</tr>
				</tbody>
			</table>
			<button class="btn btn-primary" type="submit">등록</button>
		</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>