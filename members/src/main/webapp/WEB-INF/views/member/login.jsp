<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인...</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	#content_login {width: 20%; margin: 200px auto;}
</style>
</head>
<body>
	<div id="content">
		<div id="content_login" class="text-center">
			<form class="form-signin" action="/member/login" method="post" >
			  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
			  <label for="inputEmail" class="sr-only">이메일</label>
			  <input type="text" id="inputEmail" class="form-control" placeholder="Email" required autofocus name="email">
			  <label for="inputPassword" class="sr-only">비밀번호</label>
			  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password">
			  <div class="checkbox mb-3">
			  </div>
			  	<button type="submit" class="btn btn-secondary">로그인</button>
      			<button type="button" class="btn btn-secondary" onclick="main()">취소</button>
			  <p class="mt-5 mb-3 text-muted">&copy; 2023-2024</p>
			</form>
		</div>
	</div>
	<script>
		const main = function(){
			location.href="/main";
		}
	</script>
</body>
</html>