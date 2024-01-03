<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div id="content_join">
			<h2>회원 가입</h2>
			<form action="/user/join" method="post">
				<div class="mb-3">
		          <label for="userId">아이디</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userId" id="userId" placeholder="ID" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="userPasswd" id="userPassWd" placeholder="Password" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userName" id="userName" placeholder="Name" required>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userAge" id="userAge" placeholder="Age">
		          </div>
		        </div>
		        <div class="mb-3">
		        	<input class="btn btn-secondary" type="submit" value="등록">
					<input class="btn btn-secondary" type="reset" value="취소">
		        </div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>