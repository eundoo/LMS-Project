<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>ADMIN</title>
<style type="text/css">
</style>
</head>
<body>
<h1>Admin Main</h1>
<input type="button" name="register" value="user" onclick="doRegister(this.value)">학생등록
<input type="button" name="register" value="professor" onclick="doRegister(this.value)">교수등록
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	//학생 || 교수 등록하기
	function doRegister(value) {
		if(value === 'user') {
			location.href='/userRegister'
		}else if(value === 'professor') {
			location.href='/prfsRegister'
		}
	}
</script>
</body>
</html>