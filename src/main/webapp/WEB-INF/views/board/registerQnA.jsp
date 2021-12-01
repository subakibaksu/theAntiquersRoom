<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerQnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/registerQnA.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
</head>

<body>

    <header id="registerQnA_headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </header>

<div id="registerQnA_wrapper">

      <form id="registerFrom" action="/board/registerQnA" method="post">  
         <table >
         <h2 id="registerQnAH2">문의사항 작성</h2>
            <tr>
               <td>제목</td>
               <td><input class="registerQnAInput" type="text"  id="title" name="title" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea class="registerQnAtextarea" id="content" name="content" cols="50" rows="13" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
               <td>작성자</td>
               <td><input class="registerQnAInput" type="text" name="author" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly"></td>
            </tr>
       
               <input class="registerQnAInput" type="hidden" name="pid" value="${product.pid}">
           
            <tr>
               <td colspan="2">
                  <button class="registerQnAButton" id="cancleButton"  onclick="back()" type="button">취소</button>
                  <button class="registerQnAButton" id="registerButton" type="submit"  >등록</button>
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
};

/* 제목, 내용 공백일때 버튼비활성화 */
 let title = document.querySelector("#title");
 let content = document.querySelector("#content");
let button = document.querySelector("#registerButton");

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