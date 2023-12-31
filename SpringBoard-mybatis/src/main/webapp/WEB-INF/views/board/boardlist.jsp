<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록...</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/style.css"/>
<script src="/resources/js/bootstrap.bundle.js"></script>
<link >
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div id="content">
		<div class="content_list">
		<h2 class="text-left">글 목록</h2>
		<table class="table" id="tbl_list">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">글제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board">
					<tr>
						<th scope="row">${board.id }</th>
						<td class="td_title"><a href="/board?id=${board.id}">${board.boardTitle }
							<c:if test="${board.replyCount ne 0}">
								<small>[&nbsp;<c:out value="${board.replyCount}"/>&nbsp;]</small>
							</c:if>
						</a></td>
						<td>${board.userId }</td>
						<td><c:choose>
							<c:when test="${not empty board.updatedTime }">
								<fmt:formatDate value="${board.updatedTime }" pattern="yyyy-MM-dd"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${board.createdTime }" pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose></td>
						<td>${board.hit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
		  <ul class="pagination justify-content-center">
		  	<li class="page-item">
		      <a class="page-link" href="#">Start</a>
		    </li>
		    <li class="page-item disabled">
		      <a class="page-link">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#">End</a>
		    </li>
		  </ul>
		</nav>
		<div class="btn_write">
			<a href = "/board/write"><button class="btn btn-outline-secondary">글쓰기</button></a>
		</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>