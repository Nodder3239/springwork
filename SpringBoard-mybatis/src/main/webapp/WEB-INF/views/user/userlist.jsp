<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<h2>회원 목록</h2>
		<table class="table" id="tbl_list" >		
			<thead>	
			<tr>
				<th scope="col">번호</th>
				<th scope="col">아이디</th>
				<th scope="col">비밀번호</th>
				<th scope="col">이름</th>
				<th scope="col">나이</th>
			</tr>
			</thead>
			<c:forEach items="${userList }" var="user">
			<tbody>
			<tr>
				<th scope="row">${user.id }</th>
				<td><a href="/user?id=${user.id }">${user.userId }</a></td>
				<td>${user.userPasswd }</td>
				<td>${user.userName }</td>
				<td>${user.userAge }</td>
			</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>