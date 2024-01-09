<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
	<jsp:include page="../layout/header.jsp"/>
	<!-- 본문 영역 -->
		<div class="row content">
			<div class="col">
				<div class="card" style="width:50%; margin:0 auto;">
					<div class="card-body">
						<form action="/todo/update" method="post">
							<div class="input-group mb-3">
								<span class="input-group-text">번호</span>
								<input type="text" name="tno" class="form-control"
									value="${todo.tno }" readonly>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">할 일</span>
								<input type="text" name="title" class="form-control"
									value="${todo.title }">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">작성자</span>
								<input type="text" name="writer" class="form-control"
									value="${todo.writer }">
							</div>
							<div class="my-4">
								<div class="float-end">
									<input type="submit" class="btn btn-warning" value="Modify">
									<input type="reset" class="btn btn-primary" value="Reset">
									<button type="button" class="btn btn-secondary">List</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../layout/footer.jsp"/>
	</div>
	<script>
		//목록 버튼
		let listBtn = document.querySelector(".btn-secondary");
		
		listBtn.addEventListener("click", function(e){
			location.href = "/todo/list";
		});
	</script>
</body>
</html>