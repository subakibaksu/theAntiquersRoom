<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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

		<table border="1">
			<caption>
				<ul >
					<li>&nbsp;</li>
					<li>QnA</li>
					<li><button id="regBtn" type="button"><a href="/board/registerQnA">REGISTER</a></button></li>
				</ul>
			</caption>
			
			<thead>
				<tr>
					<th>bindex</th>  
					<th>title</th>
					<th>writer</th>
					<th>ref</th>
					<th>step</th>
					<th>depth</th>
					<th>insert_ts</th>
					<th>update_ts</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.bindex}"/></td>
						<td> <a  href="/board/getQnADetail?bindex=${board.bindex}"><c:out value="${board.title}"/></a></td>
						<td><c:out value="${board.author}"/></td>
						<td><c:out value="${board.ref}"/></td>
						<td><c:out value="${board.step}"/></td>
						<td><c:out value="${board.depth}"/></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.createdAt}"/></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.updatedAt}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	<div class="pageInfo_wrap" >
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>				
				
			</ul>
		</div>
	</div>
	<form id="moveForm" method="get">	
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
</div>

      <script>
      
  	let moveForm = $("#moveForm");
	
	$(".pageInfo a").on("click", function(e){
		
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/QnA");
		moveForm.submit();
		
	});
	</script>

</body>
</html>
