<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 폼...</title>
<link rel="stylesheet" href="/resources/css/style.css"/>
<link >
</head>
<body>
	<div id="content">
		<h2>글 상세보기</h2>
				<table>
					<tr>
						<td>
							<input type="text" name="boardTitle" value="${board.boardTitle }" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="boardWriter" value="${board.boardWriter }" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="5" cols="50" name="boardContent" readonly>${board.boardContent }</textarea>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test = "${sessionId eq board.boardWriter}">
							<a href="/board/update?id=${board.id }"><button>수정</button></a>
							<a href="/board/delete?id=${board.id }"><button>삭제</button></a>
							</c:if>
							<a href="/board/list"><button>목록</button></a>
						</td>
					</tr>
				</table>
	</div>
</body>
</html>