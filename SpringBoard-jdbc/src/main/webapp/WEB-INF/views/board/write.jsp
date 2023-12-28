<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 폼...</title>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link >
</head>
<body>
	
	<div id="content">
		<h2>글쓰기</h2>
			<form action='/board/write' method="post">
				<table class = tbl_write>
					<tr>
						<td>
							<input type="text" name="boardTitle" placeholder="글제목">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="boardWriter" value="${sessionId}" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="5" cols="50" name="boardContent">글내용</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>