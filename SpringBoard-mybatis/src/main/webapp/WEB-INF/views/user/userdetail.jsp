<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div id="content_join">
		<h2>회원 상세보기</h2>
		<div class="mb-3">
		          <label for="userId">아이디</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userId" id="userId" placeholder="${user.userId }" readonly>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="userPasswd" id="userPassWd" placeholder="${user.userPasswd }" readonly>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userName" id="userName" placeholder="${user.userName }" readonly>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userAge" id="userAge" placeholder="${user.userAge }" readonly>
		          </div>
		        </div>
		        <div class="mb-3">
		        	<button class="btn btn-secondary" onclick="list()">목록</button>
		        </div>
		    </div>
		</div>
	<script>
		let list = function(){
			location.href = "/user/";
		}
	</script>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>