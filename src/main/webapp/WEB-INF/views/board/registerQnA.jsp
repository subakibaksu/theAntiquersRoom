<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerQnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/registerQnA.css">

</head>

<body>

<header>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</header>

<div id = "wrapper">

 <!-- 게시판에 신규 게시물을 등록하는 양식 -->
      <form class="registerQnAform" action="/board/registerQnA" method="post">
         <table id="registerTable" >
         <h2 id="registerQnAH2">문의사항 작성</h2>
            <tr>
               <td>제목</td>
               <td><input class="registerQnAInput" type="text" name="title" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea class="registerQnAtextarea" name="content" cols="50" rows="13" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
               <td>작성자</td>
               <td><input class="registerQnAInput" type="text" name="author" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly"></td>
            </tr>
            <tr>
               <td><input class="registerQnAInput" type="hidden" name="pId" value="${sessionScope.__AUTH_ANTIQUE__.userType}"></td>
            </tr>
            <tr>
               <td colspan="2">
                  <button class="registerQnAButton" id="cancleButton" type="button" id="listBtn"><a href="javascript:history.back();">취소</a></button>
                  <button class="registerQnAButton" id="registerButton" type="submit">등록</button>
               </td>
            </tr>
         </table>
      </form>
      
</form>

</div>


<footer>

</footer>

</body>

</html>