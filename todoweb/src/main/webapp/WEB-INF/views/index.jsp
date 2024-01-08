<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index...</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>	
	<div class="container-fluid">
	<jsp:include page="layout/header.jsp"/>
		<div class="row content">
			<div class="col">
				<div class="card">
					<div class="card-body">
						<div class="input-group mb-3">
							<h1 class="my-4">Todo 프로젝트입니다.</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="layout/footer.jsp"/>
	</div>
	<p><a href="/todo/register">등록</a></p>
</body>
</html>