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
		<h2>상세 보기</h2>
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
		            <input type="text" class="form-control" name="password" id="password" value="${member.password }" readonly>
		          </div>
		        </div>
				<div class="mb-3">
		          <label for="userName">이름</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="name" id="name" value="${member.name }" readonly>
		          </div>
		        </div>
		        <div class="mb-3">
		          <label for="userAge">나이</label>
		          <div class="input-group">
		            <input type="text" class="form-control" name="age" id="age" value="${member.age }" readonly>
		          </div>
		        </div>
		        <div class="mb-3">		        	
					<button class="btn btn-secondary" type="button" onclick="update(${member.id})">수정</button>
					<button class="btn btn-secondary" type="button" onclick="del(${member.id})">삭제</button>
		       		<button class="btn btn-secondary" type="button" onclick="list()">목록</button>
		       </div>
		</div>
	</div>
		<script>
		const list = function(){
			location.href="/member/";			
		}
		const update = function(mid){
			location.href="/member/update2?id=" + mid;			
		}
		const del = function(mid){
			let c = confirm("정말로 삭제하시겠습니까?");
			if(c == true){
				location.href="/member/delete?id=" + mid;
			}
		}
	</script>
</body>
</html>