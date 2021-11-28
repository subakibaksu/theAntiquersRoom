<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>

	<link rel="stylesheet" href="/resources/css/mypage.css">

</head>
<body>

    <header id="mypage_headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"></jsp:include>
    </header>

    <div id="mypage_wrapper">
        <div id="info">
            <h3>${sessionScope.__AUTH_ANTIQUE__.userId}</h3>
            <div>${sessionScope.__AUTH_ANTIQUE__.nickName}</div>
            <div>${sessionScope.__AUTH_ANTIQUE__.phone}</div>
        </div>
        
        <div class="btnset">
            <button id="modifyBtn" ><a href="/users/modify?userId=${sessionScope.__AUTH_ANTIQUE__.userId}">수정하기</a></button>
            <button id="cancleBtn">회원탈퇴</button>
        </div>
    </div>

    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </footer>

</body>
</html>