<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bindex" readonly="readonly" value='<c:out value="${pageInfo.bindex}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.author}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name=createdAt readonly="readonly"  value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${pageInfo.createdAt}"/>'>
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name=updatedAt readonly="readonly"  value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${pageInfo.updatedAt}"/>'>
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="modify_btn">수정 하기</a>
		<a class="btn" id="reply_btn">답글</a>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bindex" name="bindex" value='<c:out value="${pageInfo.bindex}"/>'>
	</form>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bindex").remove();
		form.attr("action", "/board/QnA");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modifyQnA");
		form.submit();
	});	
	
	$("#reply_btn").on("click", function(e){
		form.attr("action", "/board/registerReQnA?bindex=${pageInfo.bindex}&pId=${pageinfo.pid}");
		form.submit();
	});	
</script>	
</body>
</html>
