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
               <td><input class="registerReQnAInput" type="text" name="title" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea class="registerReQnAtextarea" name="content" cols="50" rows="10" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
               <td>작성자</td>
               <td><input class="registerReQnAInput" type="text" name="author" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly"></td>
            </tr>
             <tr>
               <td><input class="registerReQnAInput"  type="hidden" name="ref" value="${pageInfo.ref}"></td>
            </tr>   
            <tr>
               <td><input type="hidden" name="pId" value="${pageInfo.pId}"></td>
            </tr>
            <tr>
               <td colspan="2">
                  <button class="registerReQnAButton"  id="cancleButton"   type="button"><a href="/board/QnA">취소</a></button>
                  <button class="registerReQnAButton"  id="registerButton" type="submit">등록</button>
               </td>
            </tr>
         </table>
      </form>
   </div>
   
<footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</footer>

</body>
</html>