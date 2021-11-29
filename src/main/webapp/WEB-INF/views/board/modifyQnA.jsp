<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQnA.jsp</title>

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
					<li><button id="list_btn" type="button">목록 페이지</button></li>
					<form action="/board/removeQnA" method="post">
                           <input type="hidden" id="pId" name="pId" value="${pageInfo.pId}">
                           <input type="hidden" id="bindex" name="bindex" value="${pageInfo.bindex}">
                           <input type="submit" id="Btn"  value="deleteTest">
                     </form>
				</ul>
			</caption>
			<thead>
				<tr>
					<th>게시판 번호</th>
					<th>게시판 제목</th>
					<th>게시판 내용</th>
					<th>게시판 작성자</th>
					<th>작성일</th>
					<th>수정일</th>
				</tr>
			</thead>
			<tbody>
				<form id="modifyForm" action="/board/modifyQnA" method="post">
					<td><input type="hidden" name="pId" value="${pageInfo.pId}"/></td>
					<tr>
						<td><input name=bindex readonly="readonly"  value="${pageInfo.bindex}"/></td>
						<td><input name=title placeholder="${pageInfo.title}"/></td>
						<td><input name=content placeholder="${pageInfo.content}"/></td>
						<td><input name=author readonly="readonly"  value="${pageInfo.author}"/></td>
					</tr>
			</tbody>
		</table>
						<li><button id="modify_btn" type="button">수정</button></li>
		</form>
		
		<form id="infoForm" action="/board/modifyQnA" method="get">
			<input type="hidden" id="bindex" name="bindex" value='<c:out value="${pageInfo.bindex}"/>'>
		</form>
		
      <script>
      let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
      let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
      
      /* 목록 페이지 이동 버튼 */
      $("#list_btn").on("click", function(e){
          form.find("#bno").remove();
          form.attr("action", "/board/QnA");
          form.submit();
      });
      
      /* 수정 하기 버튼 */
      $("#modify_btn").on("click", function(e){
          mForm.submit();
      });
      
      /* 삭제 버튼 */
      $("#delete_btn").on("click", function(e){
          form.attr("action", "/board/removeQnA");
          form.attr("method", "post");
          form.submit();
      });
	</script>
</body>
</html>
