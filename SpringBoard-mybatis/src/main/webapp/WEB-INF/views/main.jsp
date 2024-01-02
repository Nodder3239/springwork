<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khit 홈...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"/>
	<h1>${sessionId }님, 환영합니다.</h1>
	<h3>
		<button onclick="update()">회원정보 수정</button>
		<button onclick="logout()">로그아웃</button>
		<button onclick="board()">글목록</button>
		<a href="/"><button>홈</button></a>
	</h3>
	<script>
		const logout = () => {
			location.href = "/users/logout";
		}
		const update = () => {
			location.href = "/user/update?userId="${sessionid};
		}
		const board = () => {
			location.href = "/board/";
		}
	</script>
	<jsp:include page="layout/footer.jsp"/>
</body>
</html>