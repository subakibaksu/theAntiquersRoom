<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/QnA.css">
	<!-- google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Merriweather&family=Nanum+Gothic&display=swap" rel="stylesheet">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

	<div id="QnA_wrapper">
		<h2>문의 사항</h2>
		<table id="tableplace">
			<tr class="tablehead"  id="header">
				<th class="QnAth">제목</th>
				<th class="QnAth">작성자</th>
				<th class="QnAth">작성일</th>
			</tr>
			
			<tbody>
				<c:forEach items="${list}" var="board">
					<tr class="tablehead">
						<!-- 답글이라면 앞에 RE: 붙이기 -->
						<td class="QnAtd" id="tdtitle">
							<c:if test="${board.step != 0}">
								<div> RE: </div>
							</c:if>
							<a href="/board/getQnADetail?bindex=${board.bindex}">
							<c:out value="${board.title}" />
							</a>
						</td>

						<td class="QnAtd" ><c:out value="${board.author}" /></td>
						<td class="QnAtd">
							<fmt:formatDate pattern="MM월 dd일" value="${board.updatedAt}" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button id="regBtn" type="button">
			<a href="/board/registerQnA?pid=${pid}">등록</a>
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
