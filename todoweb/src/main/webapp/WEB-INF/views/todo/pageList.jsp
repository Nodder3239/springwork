<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<script src="https://kit.fontawesome.com/69798321c6.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../layout/header.jsp"/>
		<div class="row content" style="width:60%; margin:0 auto;">
			<div class="col">
				<div class="card" style="padding: 20px;">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col" style="width:40%; text-overflow: ellipsis;">Title</th>
					      <th scope="col">Writer</th>
					      <th scope="col">Date</th>
					      <th scope="col" style="width:10%;">Delete</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<c:forEach items="${responseDTO.dtoList }" var="todo">
					    <tr>
					      <th scope="row">${todo.tno }</th>
					      <td><a href="/todo?tno=${todo.tno }&page=${responseDTO.page}">${todo.title }</a></td>
					      <td>${todo.writer }</td>
					      <td><fmt:formatDate value="${todo.createdDate }" pattern="yyyy-MM-dd"/></td>
					      <td><a href="/todo/delete?tno=${todo.tno }" onclick="return confirm('정말로 삭제하시겠습니까?')"><i class="fa-solid fa-square-xmark" style="color: #000;"></i></a></td>
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
					<!-- 검색 영역 -->
					<!-- <form action="/todo/paging" method="get">
						<div class="mb-3">
							<input type="checkbox" name="types" value="t">제목
							<input type="checkbox" name="types" value="w">작성자
							<div style="display: flex;">
								<input type="text" name="keyword" class="form-control">
								<button type="submit" class="btn btn-primary">Search</button>
								<button type="reset" class="btn btn-info">Clear</button>
							</div>
						</div>
					</form> -->
					<div style="width:50%; margin: 0 auto;">
					  <form action="/todo/paging" method="get">
					  	<div style="display: flex;">
							<select name="types" class="btn btn-outline-secondary dropdown-toggle">
								<option value="t">제목</option>
								<option value="w">작성자</option>
							</select>
							<input type="text" class="form-control" name="keyword" value="${keyword }">
							<button type="submit" class="btn btn-outline-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
					  	</div>
					  </form>
					</div>
					<!-- 페이지 처리 영역 -->
					<nav class="my-3">
						<ul class="pagination justify-content-center">
						<c:if test="${responseDTO.startPage > 1}">
						  	<li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.startPage-1}"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
						    </li>
				    	<!-- 이전 페이지 -->
						    <li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.page-1}"><i class="fa-solid fa-play fa-rotate-180"></i></a>
						    </li>
				    	</c:if>
				    	<c:if test="${responseDTO.startPage == 1 && responseDTO.page != 1}">
						  	<li class="page-item">
						      <a class="page-link" href="/todo/paging?page=1"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
						    </li>
				    	<!-- 이전 페이지 -->
						    <li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.page-1}"><i class="fa-solid fa-play fa-rotate-180"></i></a>
						    </li>
				    	</c:if>
				    	<c:if test="${responseDTO.page == 1 }">
				    		<li class="page-item disabled">
						      <a class="page-link"><i class="fa-solid fa-forward fa-rotate-180"></i></a>
						    </li>
				    		<li class="page-item disabled">
						      <a class="page-link"><i class="fa-solid fa-play fa-rotate-180"></i></a>
						    </li>
				    	</c:if>
					    <!-- 현재 페이지 -->
					    <c:forEach var="i" begin="${responseDTO.startPage}" end="${responseDTO.endPage}">
					   		<c:choose>
						   		<c:when test="${responseDTO.page == i}">
									<li class="page-item active"><span class="page-link">${i}</span></li>
								</c:when>
								<c:otherwise>
						   			<li class="page-item"><a class="page-link" href="/todo/paging?page=${i}">${i}</a></li>
						    	</c:otherwise>
					    	</c:choose>
					    </c:forEach>
					    <!-- 다음 페이지 -->
						<c:if test="${responseDTO.endPage >= responseDTO.page && responseDTO.endPage != responseDTO.maxPage}">
						    <li class="page-item">						    
						      <a class="page-link" href="/todo/paging?page=${responseDTO.page+1}"><i class="fa-solid fa-play"></i></a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.endPage+1}"><i class="fa-solid fa-forward"></i></a>
						    </li>
				    	</c:if>
				    	<c:if test="${responseDTO.endPage == responseDTO.maxPage && responseDTO.page < responseDTO.endPage}">
						    <li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.page+1}"><i class="fa-solid fa-play"></i></a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="/todo/paging?page=${responseDTO.endPage}"><i class="fa-solid fa-forward"></i></a>
						    </li>
				    	</c:if>
				    	<c:if test="${responseDTO.maxPage == responseDTO.page }">
				    		<li class="page-item disabled">
						      <a class="page-link"><i class="fa-solid fa-play"></i></a>
						    </li>
						    <li class="page-item disabled">
						      <a class="page-link"><i class="fa-solid fa-forward"></i></a>
						    </li>
				    	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp"/>
	</div>
</body>
</html>