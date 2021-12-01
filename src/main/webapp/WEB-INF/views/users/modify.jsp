<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
	<link rel="stylesheet" href="/resources/css/modify.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script> 
</head>
     
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>

    <div id="outline">
        <form action="/users/modify" method="post">
            <div class="text">NickName: 
                <input class="modifyInput" type="text"  name="nickName" id="nickname" value="${sessionScope.__AUTH_ANTIQUE__.nickName}">
            </div>

            <div class="text">Email: 
                <input class="modifyInput" type="text" name="userId" id="email" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly" >
            </div>

            <div class="text">Paswword: 
                <input class="modifyInput" type="password" id="password" name="password" >
            </div>

            <div class="text">Check Paswword: 
                <input class="modifyInput" type="password" id="passwordconfirm"  name="passwordconfirm" >
            </div>

            <div class="text">Phone: 
                <input class="modifyInput" type="text"  name="phone" id="phonenumber" value="${sessionScope.__AUTH_ANTIQUE__.phone}">
            </div>

            <div class="btnset"> 
                <button type="submit" id="modifyBtn">수정</button>
                <button id="cancleBtn"><a href="/users/mypage">취소</a></button>
            </div>
        </form> 
    </div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script src="/resources/js/modifyCheck.js"/>
</body>
</html>