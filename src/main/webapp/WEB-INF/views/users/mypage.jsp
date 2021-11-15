<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>

		<link rel="stylesheet" href="../../../resources/css/mypage.css">

</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>




<div id="info">

		 <h3>${sessionScope.__AUTH_ANTIQUE__.userId}</h3>
        <div>${sessionScope.__AUTH_ANTIQUE__.nickName}</div>
        <div>&nbsp;</div>
        <div>${sessionScope.__AUTH_ANTIQUE__.phone}</div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>



    </div>
    
    <div class="btnset">
        <button id="modifyBtn" ><a href="/users/modify?userId=${sessionScope.__AUTH_ANTIQUE__.userId}">수정하기</a></button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button id="cancleBtn">회원탈퇴</button>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>