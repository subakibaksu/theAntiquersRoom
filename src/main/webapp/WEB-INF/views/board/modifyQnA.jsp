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

	<form id="modifyForm" action="/board/modifyQnA" method="post">
	<div id="wrapper">

		<table border="1">
		
			<caption>
				<ul >
					<li>&nbsp;</li>
					<li>QnA</li>
					<li><button id="list_btn" type="button">목록 페이지</button></li>
					<li><button id="modify_btn" type="button">수정 완료</button></li>
				</ul>
			</caption>
			
			<thead>
				<tr>
					<th>게시판 번호</th>
					<th>게시판 제목</th>
					<th>게시판 내용</th>
					<th>게시판 작성자</th>
					<th>게시판 등록일</th>
					<th>게시판수정일</th>
				</tr>
			</thead>

			<tbody>

					<tr>
						<td><input name=bindex readonly="readonly" value='<c:out value="${pageInfo.bindex}"/>'></td>
						<td><input name=title  value='<c:out value="${pageInfo.title}"/>'></td>
						<td><input name=content  value='<c:out value="${pageInfo.content}"/>'></td>
						<td><input name=author readonly="readonly" value='<c:out value="${pageInfo.author}"/>'></td>
						<td><input name=updatedAt readonly="readonly" value="${pageInfo.updatedAt}"/>' ></td>
						
						
					</tr>

			</tbody>


		</table>
		
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
      
  
      
      
	</script>

</body>
</html>
