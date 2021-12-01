<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getQnADetail.jsp</title>

<link rel="stylesheet" href="/resources/css/getQnADetail.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

	<header id="getQnADetail_headerBox">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>

	<div id="getQnADetail_wrapper">

		<form action="#">
			<table>
				<h2 id="getQnADetailH2">상세 페이지</h2>

				<tr>
					<td>제목</td>
					<td>
					<input class="getQnADetailInput" name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
					<textarea class="getQnADetailItextarea" cols="50" rows="13" name="content" readonly="readonly"><c:out value="${pageInfo.content}" /></textarea>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
					<input class="getQnADetailInput" name="author" readonly="readonly" value='<c:out value="${pageInfo.author}"/>'>
					</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>
					<input class="getQnADetailInput" name=updatedAt readonly="readonly"
						value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${pageInfo.updatedAt}"/>'>
					</td>
				</tr>
				<tr>
    					<c:choose>
					         <c:when test = "${sessionScope.__AUTH_ANTIQUE__.userId eq pageInfo.author}">
						     <td colspan="2">
							<button class="getQnADetailButton" id="cancle_btn" onclick="back()" type="button">취소</button>
							<button class="getQnADetailButton" id="reply_btn" type="button">답글</button>
							<button class="getQnADetailButton" id="modify_btn" type="button">수정</button>
							</td>
					         </c:when>
					         
					         <c:when test = "${sessionScope.__AUTH_ANTIQUE__.userId eq 'admin@antiquers.com'}">
						     <td colspan="2">
							<button class="getQnADetailButton" id="cancle_btn" onclick="back()" type="button">취소</button>
							<button class="getQnADetailButton" id="reply_btn" type="button">답글</button>
							<button class="getQnADetailButton" id="modify_btn" type="button">수정</button>	
							</td>				       
							  </c:when>
					
					         <c:otherwise>
							<button class="getQnADetailButton" id="reply_btn" type="button">답글</button>
					         </c:otherwise>
					  	  </c:choose>
				</tr>
			</table>
		</form>

		<form id="infoForm" action="/board/modify" method="get">
			<input type="hidden" id="bindex" name="bindex"
				value='<c:out value="${pageInfo.bindex}"/>'>
		</form>

	</div>
	<footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>

	<script>
	let form = $("#infoForm");
	
    /* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modifyQnA");
		form.submit();
	});	
	
    /* 삭제 버튼 */
	$("#reply_btn").on("click", function(e){
		form.attr("action", "/board/registerReQnA?bindex=${pageInfo.bindex}&pId=${pageinfo.pid}");
		form.submit();
	});	
	
    /* 취소 (이전페이지) */
	function back() {
		history.go(-1)
	}
</script>

</body>
</html>