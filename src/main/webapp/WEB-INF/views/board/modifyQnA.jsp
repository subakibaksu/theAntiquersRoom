<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/modifyQnA.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
</head>
<body>

	<header id="modifyQnA_headerBox">
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</header>
                     
	<div id="modifyQnA_wrapper">
	
		<form id="modifyForm" action="/board/modifyQnA" method="post">
 			<table>
				<h2 id="modifyQnAH2">수정 페이지</h2>
				<input type="hidden" name="pid" value="${pageInfo.pid}"/>
				<input type="hidden" name="bindex"  value="${pageInfo.bindex}"/>
				
				<tr>
					<td>제목</td>
					<td>
					<input class="modifyQnAInput" id="title" name="title" placeholder='<c:out value="${pageInfo.title}"/>'>
					</td>
				</tr>
				<tr>
					<td>내용</td>
               		<td><textarea class="modifyQnAtextarea" id="content" name="content" cols="50" rows="13"  placeholder='<c:out value="${pageInfo.content}"/>'></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
					<input class="modifyQnAInput" name="author" readonly="readonly" value='<c:out value="${pageInfo.author}"/>'>
					</td>
				</tr>

				<tr>
				    	<c:choose>
					         <c:when test = "${sessionScope.__AUTH_ANTIQUE__.userId eq pageInfo.author}">
							<td colspan="2">
							<button class="modifyQnAButton" id="cancle_btn" onclick="back()" type="button">취소</button>
							<button class="modifyQnAButton" id="delete_btn" type="button">삭제</button>
							<button class="modifyQnAButton" id="modify_btn" type="button">수정</button>
							</td>
					        </c:when>
					         
					         <c:when test = "${sessionScope.__AUTH_ANTIQUE__.userId eq 'admin@antiquers.com'}">
							<td colspan="2">
							<button class="modifyQnAButton" id="cancle_btn" onclick="back()" type="button">취소</button>
							<button class="modifyQnAButton" id="delete_btn" type="button">삭제</button>
							<button class="modifyQnAButton" id="modify_btn" type="button">수정</button>
							</td>			       
							  </c:when>
					
					         <c:otherwise>
					         </c:otherwise>
					  	  </c:choose>
				</tr>
			</table> 
		</form>
		
						<form id="deleteForm" action="/board/removeQnA" method="post">
                           <input type="hidden" id="pid" name="pid" value="${pageInfo.pid}">
                           <input type="hidden" id="bindex" name="bindex" value="${pageInfo.bindex}">
                  	   </form>
                  	   
          </div>
          
    <footer>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	</footer>
	        	   
      <script>
      let dform = $("#deleteForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
      let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
      
 
      /* 수정 하기 버튼 */
      $("#modify_btn").on("click", function(e){
          mForm.submit();
      });
      
      /* 삭제 버튼 */
      $("#delete_btn").on("click", function(e){
          dform.attr("action", "/board/removeQnA");
          dform.attr("method", "post");
          dform.submit();
      });
      
      /* 취소 (이전페이지) */
	  	function back() {
			history.go(-1)
		}
      
	  	/* 제목, 내용 공백일때 버튼비활성화 */
	  	 let title = document.querySelector("#title");
	  	 let content = document.querySelector("#content");
	  	let button = document.querySelector("#modify_btn");

	  	button.disabled = true;
	  	title.addEventListener("change", stateHandle);
	  	content.addEventListener("change", stateHandle);

	  	function stateHandle() {
	  	  if (document.querySelector("#title").value === "" && document.querySelector("#content").value === "" ) {
	  	    button.disabled = true; 
	  	  } else {
	  	    button.disabled = false;
	  	  }
	  	} 
	  	
	</script>
</body>
</html>
