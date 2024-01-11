<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/69798321c6.js" ></script>
</head>
<body>
	<c:if test="${empty sessionEmail }">
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다.");
			location.href = "/member/login";
		</script>
	</c:if>
	<div id="content">
		<h2>회원 목록</h2>
		<table class="table" id="tbl_list" style="width:60%; margin:0 auto;">		
			<thead>	
			<tr>
				<th scope="col">번호</th>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
				<th scope="col">조회</th>
				<th scope="col">삭제</th>
			</tr>
			</thead>
			<c:forEach items="${memberList }" var="member">
			<tbody>
			<tr>
				<th scope="row">${member.id }</th>
				<td>${member.email }</td>
				<td>${member.password }</td>
				<td>${member.name }</td>
				<td>${member.age }</td>
				<td>
					<button type="button" onclick="detail(${member.id})"><i class="fa-solid fa-eye" style="color: #000;"></i></button>
				</td>
				<td>
					<button type="button" onclick="del(${member.id})"><i class="fa-solid fa-square-xmark" style="color: #000;"></i></button>
				</td>
			</tr>
			</tbody>
			</c:forEach>
		</table>
		<p><a href="/main">뒤로</a></p>
	</div>
	<script>
		const detail = function(mid){
			location.href="/member?id=" + mid;			
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