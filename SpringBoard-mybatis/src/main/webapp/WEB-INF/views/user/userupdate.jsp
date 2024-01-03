<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div id="content_join">
			<h2>회원 수정</h2>
			<form action="/user/update" method="post">
				<input type="hidden" name="id" value="${user.id }">
				<div class="mb-3">
		          <label for="userId">아이디</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userId" id="userId" placeholder="${user.userId }" readonly>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="userPasswd" id="userPasswd" placeholder="Password" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userName" id="userName" value="${user.userName }" required>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userAge" id="userAge" value="${user.userAge }">
		          </div>
		        </div>
		        <div class="mb-3">
		        	<input class="btn btn-secondary" type="submit" value="수정하기">
					<input class="btn btn-secondary" type="reset" value="초기화">
		        </div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>