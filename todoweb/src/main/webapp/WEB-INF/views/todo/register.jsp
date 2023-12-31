<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<form action="/todo/register" method="post">
							<div class="input-group mb-3">
								<span class="input-group-text">할 일</span>
								<input type="text" name="title" class="form-control"
									placeholder="Title">
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text">작성자</span>
								<input type="text" name="writer" class="form-control"
									placeholder="Writer">
							</div>
							<div class="my-4">
								<div class="float-end">
									<input type="submit" class="btn btn-success" value="Register">
									<input type="reset" class="btn btn-secondary" value="Reset">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../layout/footer.jsp"/>
	</div>
</body>
</html>