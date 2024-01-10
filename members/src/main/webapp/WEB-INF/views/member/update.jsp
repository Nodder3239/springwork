<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입...</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
	.content{margin-left: 30px;}
	#content_join {width: 30%; margin: 10px auto;}
</style>
</head>
<body>
	<div class="content">
		<div id="content_join">
		<h2>회원 가입</h2>
		<form action="/member/update" method="post" name="userform">
				<div class="mb-3">
		          <label for="userId">이메일</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="email" id="email" value="${member.email }" readonly>
		          </div>
		          <p id="check-result"></p>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="password" id="password" value="${member.password }" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="name" id="name" value="${member.name }" required>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="age" id="age" value="${member.age }">
		          </div>
		        </div>
		        <div class="mb-3">
		        	<input class="btn btn-secondary" type="submit" value="등록">
					<input class="btn btn-secondary" type="reset" value="취소">
		        </div>
			</form>
		</div>
	</div>
</body>
</html>