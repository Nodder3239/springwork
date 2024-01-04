<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div id="content_join">
			<h2>회원 가입</h2>
			<form action="/user/join" method="post" name="userform">
				<div class="mb-3">
		          <label for="userId">아이디</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userId" id="userId" placeholder="4자 이상 15자 까지 " onblur="checkId()" required>
		          	<!-- <button type="button" id="basic-addon3" value="N" 
							class="input-group-text" >ID 중복확인</button> -->
		          </div>
		          <p id="check-result"></p>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="userPasswd" id="userPasswd" placeholder="영문자, 숫자, 특수문자 포함 8자 이상" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호 확인</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="userPasswd2" id="userPasswd2" placeholder="비밀번호 재입력" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userName" id="userName" placeholder="한글만 입력" required>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="userAge" id="userAge" placeholder="숫자만 입력">
		          </div>
		        </div>
		        <div class="mb-3">
		        	<input class="btn btn-secondary" type="button" onclick="checkUser()" value="등록">
					<input class="btn btn-secondary" type="reset" value="취소">
		        </div>
			</form>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>