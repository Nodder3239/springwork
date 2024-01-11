<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>members...</title>
</head>
<body>
	<h2>Members 프로젝트 입니다.</h2>
	<c:choose>
		<c:when test="${empty sessionEmail }">
			<a href="/member/join">회원가입</a>
			<a href="/member/login">로그인</a>
			<a href="/member/">회원목록</a>
		</c:when>
		<c:otherwise>
			<p>${sessionEmail }님, 안녕하세요</p>
			<a href="/member/update">회원정보 수정</a>
			<a href="/member/logout">로그아웃</a>
			<a href="/member/">회원목록</a>
		</c:otherwise>
	</c:choose>
</body>
</html>