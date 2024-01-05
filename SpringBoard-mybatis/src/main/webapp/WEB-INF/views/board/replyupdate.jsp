<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정하기...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<h2>댓글 수정하기</h2>
		<form action="/reply/update" method="post">
			<input type="hidden" name="id" value="${reply.id }">
			<input type="hidden" name="boardId" value="${reply.boardId }">
			<div class="form-group">
				<textarea class="form-control" rows="5" name="replyContent"
					required style="resize: none;">${reply.replyContent }</textarea>
			</div>
			<input class="btn btn-outline-secondary" type="submit" value="수정">
			<input class="btn btn-outline-secondary" type="reset" value="초기화">
			<a href="/board?id=${reply.boardId }"><input type="button" class="btn btn-outline-secondary" value="본문"></a>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>