<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 폼...</title>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link >
</head>
<body>
	<div id="content">
		<h2>글 수정</h2>
		<form action='/board/update' method="post">
			<input type="hidden" name="id" value="${board.id}">
			<table class = tbl_write>
				<tr>
					<td>
						<input type="text" name="boardTitle" value="${board.boardTitle }">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="boardWriter" value="${sessionId}" readonly>
					</td>
				</tr>
				<tr>
					<td>
						<textarea rows="5" cols="50" name="boardContent">${board.boardContent }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">수정하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>