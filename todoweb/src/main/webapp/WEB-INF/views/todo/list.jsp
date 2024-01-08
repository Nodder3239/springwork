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
					  	<c:forEach items="${todoList }" var="todo">
					    <tr>
					      <th scope="row">${todo.tno }</th>
					      <td>${todo.title }</td>
					      <td>${todo.writer }</td>
					      <td><fmt:formatDate value="${todo.createdDate }" pattern="yyyy-MM-dd"/></td>
					      <td><a href="/todo/delete?tno=${todo.tno }" onclick="return confirm('정말로 삭제하시겠습니까?')"><i class="fa-solid fa-square-xmark" style="color: #000;"></i></a></td>
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
				</div>
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp"/>
	</div>
</body>
</html>