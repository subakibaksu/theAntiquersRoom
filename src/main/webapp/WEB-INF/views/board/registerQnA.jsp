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
<div>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
</div>

   <div id="wrapper">

      <!-- 게시판에 신규 게시물을 등록하는 양식 -->
      <form action="/board/registerQnA" method="post">
         <table id="registerTable" >
         <h1 id="info">문의사항 작성</h1>
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

<div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</div>

</body>
</html>