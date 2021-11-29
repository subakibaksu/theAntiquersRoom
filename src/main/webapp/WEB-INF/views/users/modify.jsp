<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>modify.jsp</title>

    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
	<link rel="stylesheet" href="/resources/css/modify.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script> 
</head>
     
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>

    <div id="outline">
        <div id="inline">
            <form action="/users/modify" method="post">
            
            <div class="text" >NickName: <input class="modifyInput" type="text"  name="nickName" id="nickname" value="${sessionScope.__AUTH_ANTIQUE__.nickName}"><!-- <i class="fas fa-check" id="check"></i> --></div>
            <div>&nbsp;</div>
            <div class="nicknamecheck"></div> 
            <div>&nbsp;</div>

            <div class="text">Email: <input class="modifyInput" type="text" name="userId" id="email" value="${sessionScope.__AUTH_ANTIQUE__.userId}" readonly="readonly" ></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div class="text">Paswword: <input class="modifyInput" type="password" id="password" name="password" ></div>
            <div>&nbsp;</div>
			<p class="passwordcheck"></p>
            <div>&nbsp;</div>

            <div class="text">Check Paswword: <input class="modifyInput" type="password" id="passwordconfirm"  name="passwordconfirm" ></div>
            <div>&nbsp;</div>
            <p class="pwdconfirmcheck"></p>
            <div>&nbsp;</div>

            <div>Phone: <input class="modifyInput" type="text"  name="phone" id="phonenumber" value="${sessionScope.__AUTH_ANTIQUE__.phone}"></div>
            <div>&nbsp;</div>
            <p class="phonenumbercheck"></p>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div class="btnset"> 
                <button type="submit" id="modifyBtn">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button id="cancleBtn"><a href="/users/mypage">취소</a></button>
            </div>

			</form>          
        </div>  
    </div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script src="/resources/js/modifyCheck.js"/>
</body>
</html>