<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 폼...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css"/>
<link >
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<h2>글 상세보기</h2>
		<table class="tbl_detail">
			<tr>
				<td>
					<p class="text-left" style="font-size: 33px; font-weight: 500;">
					${board.boardTitle }
					</p>
					<p class="text-right" class="font-weight-light">
					조회수: ${board.hit }회
					</p>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<p class="text-left" class="font-weight-light">
					작성자: ${board.userId }
					</p>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<p class="text-left">
					${board.boardContent }
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test = "${sessionId eq board.userId}">
					<a href="/board/update?id=${board.id }"><button class="btn btn-outline-secondary">수정</button></a>
					<a href="/board/delete?id=${board.id }"><button class="btn btn-outline-secondary">삭제</button></a>
					</c:if>
					<a href="/board/"><button class="btn btn-outline-secondary">목록</button></a>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>