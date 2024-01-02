<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div id="content_login" class="text-center">
			<form class="form-signin" action="/user/login" method="post" >
			  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
			  <label for="inputEmail" class="sr-only">아이디</label>
			  <input type="text" id="inputEmail" class="form-control" placeholder="ID" required autofocus name="userId">
			  <label for="inputPassword" class="sr-only">비밀번호</label>
			  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="userPasswd">
			  <div class="checkbox mb-3">
			  </div>
			  	<button type="submit" class="btn btn-secondary">로그인</button>
      			<button type="reset" class="btn btn-secondary">취소</button>
			  <p class="mt-5 mb-3 text-muted">&copy; 2023-2024</p>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>