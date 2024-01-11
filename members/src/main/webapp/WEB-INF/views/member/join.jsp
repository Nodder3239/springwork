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
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
	.content{margin-left: 30px;}
	#content_join {width: 30%; margin: 10px auto;}
</style>
</head>
<body>
	<div class="content">
		<div id="content_join">
		<h2>회원 가입</h2>
		<form action="/member/join" method="post" name="userform">
				<div class="mb-3">
		          <label for="userId">이메일</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="email" id="email" placeholder="@" onblur="checkEmail()" required>
		          </div>
		          <p id="check-result"></p>
		        </div>
				<div class="mb-3">
		          <label for="userPassWd">비밀번호</label>
		          <div class="input-group">
		            <input type="password" class="form-control" name="password" id="password" placeholder="영문자, 숫자, 특수문자 포함 8자 이상" required>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="name" id="name" placeholder="한글만 입력" required>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="age" id="age" placeholder="숫자만 입력">
		          </div>
		        </div>
		        <div class="mb-3">
		        	<input class="btn btn-secondary" type="submit" value="등록">
					<input class="btn btn-secondary" type="reset" value="취소">
		        </div>
			</form>
		</div>
	</div>
	<script>
		//이메일 입력값을 가져오고, (ajax()가)입력값을 서버(컨트롤러)로 전송
		//이메일이 체크된 후 사용 가능 여부를 입력창의 아래에 표시
		const checkEmail = function(){
			let inputEmail = document.getElementById("email").value;
			let checkResult = document.getElementById("check-result");
			console.log("이메일: ", email);
			
			$.ajax({
				//요청방식, url, data, 함수 - (성공, 실패)
				type: "POST",
				url: "/member/checkemail",
				data:{
					email: inputEmail
				},
				success: function(res){
					console.log("성공: ", res)
					if(res == "OK"){
						checkResult.innerHTML = "사용가능한 이메일입니다.";
						checkResult.style.color = "green";
					}else{
						checkResult.innerHTML = "이미 가입된 이메일입니다.";
						checkResult.style.color = "red";
					}
				},
				error: function(err){
					console.log("실패: ", err)
				}
				
			})
		}
	</script>
</body>
</html>