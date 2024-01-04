<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기...</title>
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
					<div class="text-left" style="font-size: 33px; font-weight: 500;">
					${board.boardTitle }
					</div>
					<div style="margin-left: 10px; font-size: 15px">
					<c:choose>
						<c:when test="${not empty board.updatedTime }">
							작성일: <fmt:formatDate value="${board.createdTime }" pattern="yyyy-MM-dd HH:mm:ss"/><br>
							수정일: <fmt:formatDate value="${board.updatedTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:when>
						<c:otherwise>
							작성일: <fmt:formatDate value="${board.createdTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</c:otherwise>
					</c:choose>
					</div>
					<div class="text-right" class="font-weight-light">
					조회수: ${board.hit }회
					</div>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<p class="text-left" class="font-weight-light" style="font-size: 18px">
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
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test = "${sessionId eq board.userId}">
					<a href="/board/update?id=${board.id }"><button class="btn btn-outline-secondary">수정</button></a>
					<a href="/board/delete?id=${board.id }"><button class="btn btn-outline-secondary"
					 onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</button></a>
					</c:if>
					<a href="/board/"><button class="btn btn-outline-secondary">목록</button></a>
				</td>
			</tr>
		</table>
		<!-- 댓글 목록 -->
		<div class = "reply">
			<div class = "replyer" >
				<p class="text-left" style="font-size: 18px">닉네임</p>
			</div>
			<div class = "replyContent">
				<p class="text-left">댓글 내용입니다.</p>
				<p class="text-left" style="font-size: 13px">2024-01-04 18:00:00</p>
			</div>
		</div>
		<!-- 댓글 등록 -->
		<c:if test="${not empty sessionId}">
		<div class="replyWrite">
			<form action="/reply/insert" method="post" id="replyform">
				<input type="hidden" name="boardId" value="${board.id }">
				<input type="hidden" name="replyer" value="${sessionId }">
				<p>
				<textarea name="replyContent" class="form-control" rows="5"
						placeholder="댓글 작성란" style="resize: none;"></textarea>
				</p>
				<button type="submit" class="btn btn-outline-secondary">등록</button>
			</form>	
		</div>
		</c:if>	
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>