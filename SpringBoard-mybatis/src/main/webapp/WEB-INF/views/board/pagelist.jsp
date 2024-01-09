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
<script src="https://kit.fontawesome.com/69798321c6.js" ></script>
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
						<td class="td_title"><a href="/board?page=${paging.page}&id=${board.id}">${board.boardTitle }
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
		<!-- 검색 영역 -->
		<div style="width:50%; margin: 0 auto;">
		  <form action="/board/paging" method="get">
		  	<div style="display: flex;">
				<select name="field" class="btn btn-outline-secondary dropdown-toggle">
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="i">작성자</option>
				</select>
				<input type="text" class="form-control" name="kw" value="${kw }" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
				<button type="submit" class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
		  	</div>
		  </form>
		</div>
		<!-- 페이지 처리 영역 -->
		<nav>
			<ul class="pagination justify-content-center">
			<c:if test="${paging.startPage > 1}">
			  	<li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.startPage-1}"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
			    </li>
	    	<!-- 이전 페이지 -->
			    <li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.page-1}"><i class="fa-solid fa-play fa-rotate-180"></i></a>
			    </li>
	    	</c:if>
	    	<c:if test="${paging.startPage == 1 && paging.page != 1}">
			  	<li class="page-item">
			      <a class="page-link" href="/board/paging?page=1"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
			    </li>
	    	<!-- 이전 페이지 -->
			    <li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.page-1}"><i class="fa-solid fa-play fa-rotate-180"></i></a>
			    </li>
	    	</c:if>
	    	<c:if test="${paging.page == 1 }">
	    		<li class="page-item disabled">
			      <a class="page-link"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
			    </li>
	    		<li class="page-item disabled">
			      <a class="page-link"><i class="fa-solid fa-play fa-rotate-180"></i></a>
			    </li>
	    	</c:if>
		    <!-- 현재 페이지 -->
		    <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		   		<c:choose>
			   		<c:when test="${paging.page == i}">
						<li class="page-item active"><span class="page-link">${i}</span></li>
					</c:when>
					<c:otherwise>
			   			<li class="page-item"><a class="page-link" href="/board/paging?page=${i}">${i}</a></li>
			    	</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    <!-- 다음 페이지 -->
		    <c:if test="${paging.endPage >= paging.page && paging.endPage != paging.maxPage}">
			    <li class="page-item">						    
			      <a class="page-link" href="/board/paging?page=${paging.page+1}"><i class="fa-solid fa-play"></i></a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.endPage+1}"><i class="fa-solid fa-forward"></i></a>
			    </li>
	    	</c:if>
	    	<c:if test="${paging.endPage == paging.maxPage && paging.page < paging.endPage}">
			    <li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.page+1}"><i class="fa-solid fa-play"></i></a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="/board/paging?page=${paging.endPage}"><i class="fa-solid fa-forward"></i></a>
			    </li>
	    	</c:if>
	    	<c:if test="${paging.maxPage == paging.page }">
	    		<li class="page-item disabled">
			      <a class="page-link"><i class="fa-solid fa-play"></i></a>
			    </li>
			    <li class="page-item disabled">
			      <a class="page-link"><i class="fa-solid fa-forward"></i></a>
			    </li>
	    	</c:if>
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