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
		<h2>회원 상세보기</h2>
		<table class="tbl_join">
			<tr>
			   <td><label>아이디</label></td>
				<td>
					${user.userId }
				</td>
			</tr>
			<tr>
			    <td> <label>비밀번호</label></td>
				<td>
					${user.userPasswd }
				</td>
			</tr>
			<tr>
			    <td><label>이름</label></td>
				<td>
					${user.userName }
				</td>
			</tr>
			<tr>
			    <td><label>나이</label></td>
				<td>
					${user.userAge }
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button onclick="list()">목록</button>
				</td>
			</tr>
		</table>
	</div>
	<script>
		let list = function(){
			location.href = "/user/";
		}
	</script>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>