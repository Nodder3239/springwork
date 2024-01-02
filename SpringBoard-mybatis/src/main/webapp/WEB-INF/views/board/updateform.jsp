<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<h2>글 수정</h2>
		<form action="/board/update" method="post">
			<input type="hidden" name="id" value="${board.id }">
			<input type="text" name="boardTitle" class="form-control mt-4 mb-2"
				placeholder="${board.boardTitle }" required
			>
			<div class="form-group">
				<textarea class="form-control" rows="10" name="boardContent"
					placeholder="${board.boardContent }" required style="resize: none;"
				></textarea>
			</div>
			<input class="btn btn-outline-secondary" type="submit" value="수정">
			<input class="btn btn-outline-secondary" type="reset" value="초기화">
			<a href="/board/"><input type="button" class="btn btn-outline-secondary" value="목록"></a>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>