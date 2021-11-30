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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

	<div id="wrapper">

		<table id="tableplace">

			<thead>
				<tr class="tablehead">
					<th class="QnAth"></th>
					<th class="QnAth">제목</th>
					<th class="QnAth">내용</th>
					<th class="QnAth">작성자</th>
					<th class="QnAth">작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr class="tablehead">
					
						<td class="QnAtd"><c:out value="${board.bindex}" /></td>
						
						<!-- 답글이라면 앞에 RE: 붙이기 -->
						<td class="QnAtd" id="tdtitle">
								<c:if test="${board.step != 0}">
								<div> RE: </div>
								</c:if>
								
								<c:out value="${board.title}" />
								</a>
						</td>
						
						<td class="QnAtd"  id="content">
						<a href="/board/getQnADetail?bindex=${board.bindex }">
						<c:out value="${board.content}" />
						</a>
						</td>
						
						<td class="QnAtd" ><c:out value="${board.author}" /></td>

						<td class="QnAtd"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
								value="${board.updatedAt}" /></td>
							
					</tr>
				</c:forEach>
			</tbody>
			
		</table>
		<button id="regBtn" type="button">
					<a href="/board/registerQnA?pid=${pid }">등록</a>
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
