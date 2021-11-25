<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerReQnA.jsp</title>

	<link rel="stylesheet" href="/resources/css/registerQnA.css">

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <div id="wrapper">
   
      <!-- 게시판에 신규 게시물을 등록하는 양식 -->
      <form action="/board/registerReQnA" method="post">
         <table id>
         <h1 >문의사항 답글작성</h1>
            <tr>
               <td>제목</td>
               <td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
               <td>내용</td>
               <td><textarea name="content" cols="50" rows="10" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
               <td>작성자</td>
               <td><input type="text" name="author" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly"></td>
            </tr>
             <tr>
               <td><input type="hidden" name="ref" value="${pageInfo.ref}"></td>
            </tr>   
            <tr>
               <td><input type="hidden" name="pId" value="${sessionScope.__AUTH_ANTIQUE__.userType}"></td>
            </tr>
            <tr>
               <td colspan="2">
                  <button type="submit">REGISTER</button>
                  <button type="button" id="listBtn"><a href="/board/QnA">LIST</a></button>
               </td>
            </tr>
         </table>
      </form>
   </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>