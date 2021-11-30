<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA.jsp</title>

<link rel="stylesheet" href="/resources/css/QnA.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

	<div id="wrapper">

		<table id="tableplace">

			<thead>
				<tr class="tablehead">
					<th>글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>수정일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr class="tablehead">
					
						<td><c:out value="${board.bindex}" /></td>
						
						<!-- 답글이라면 앞에 RE: 붙이기 -->
						<td>
								<c:if test="${board.step != 0}">
								<div> RE: </div>
								</c:if>
								
								<c:out value="${board.title}" />
								</a>
						</td>
						
						<td id="content">
						<a href="/board/getQnADetail?bindex=${board.bindex }">
						<c:out value="${board.content}" />
						</a>
						</td>
						
						<td><c:out value="${board.author}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
								value="${board.createdAt}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
								value="${board.updatedAt}" /></td>
							
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		<button id="regBtn" type="button">
					<a href="/board/registerQnA?pId=${pId }">등록</a>
					</button>
	</div>
	<script>
		let moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/QnA");
			moveForm.submit();

		});
	</script>

</body>
</html>
