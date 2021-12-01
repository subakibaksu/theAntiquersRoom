<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerReQnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/registerReQnA.css">

</head>
<body>

    <header id="registerReQnA_headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </header>

   <div id="registerReQnA_wrapper">
   
      <form action="/board/registerReQnA" method="post">
      
         <table >
         <h2 id="registerReQnAH2">문의사항 답글</h2>
            <tr>
               <td>제목</td>
               <td><input class="registerReQnAInput" type="text"  id="title" name="title"  value="${pageInfo.title}의 답글"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea class="registerReQnAtextarea" id="content" name="content" cols="50" rows="10" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
               <td>작성자</td>
               <td><input class="registerReQnAInput" type="text" name="author" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly"></td>
            </tr>
             <tr>
               <td><input class="registerReQnAInput"  type="hidden" name="ref" value="${pageInfo.ref}"></td>
            </tr>   
            <tr>
               <td><input type="hidden" name="pid" value="${pageInfo.pid}"></td>
            </tr>
            <tr>
               <td colspan="2">
                  <button class="registerReQnAButton"  id="cancleButton"  onclick="back()" type="button">취소</button>
                  <button class="registerReQnAButton"  id="registerButton" type="submit">등록</button>
               </td>
            </tr>
         </table>
      </form>
   </div>
   
<footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</footer>

<script>

/* 취소 (이전페이지) */
	function back() {
	history.go(-1)
}

	/* 내용 공백일때 버튼비활성화 */
	 let content = document.querySelector("#content");
	let button = document.querySelector("#registerButton");

	button.disabled = true;
	content.addEventListener("change", stateHandle);

	function stateHandle() {
	  if (document.querySelector("#content").value === "" ) {
	    button.disabled = true; 
	  } else {
	    button.disabled = false;
	  }
	} 
</script>

</body>
</html>