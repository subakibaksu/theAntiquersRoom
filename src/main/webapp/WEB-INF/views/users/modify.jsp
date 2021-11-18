<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>modify.jsp</title>

     <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
     
	<link rel="stylesheet" href="../../../resources/css/modify.css">



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


     
</head>
     
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>


    <div id="outline">
        
        <div id="inline">

                 <form action="/users/modify" method="post">
 
            <div class="text" >NickName: <input class="modifyInput" type="text"  name="nickName" value="${sessionScope.__AUTH_ANTIQUE__.nickName}"><!-- <i class="fas fa-check" id="check"></i> --></div>
            <div>&nbsp;</div>
            <div id="checkNickName">&nbsp;&nbsp;&nbsp;&nbsp;</div> 
            <div>&nbsp;</div>

            <div class="text">Email: <input class="modifyInput" type="text" name="userId"  value="${sessionScope.__AUTH_ANTIQUE__.userId}" ></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div class="text">Paswword: <input class="modifyInput" type="password"   name="password" value="${sessionScope.__AUTH_ANTIQUE__.password}"></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div class="text">Check Paswword: <input class="modifyInput" type="password"  name="passworcheck" ></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div>Phone: <input class="modifyInput" type="text"  name="phone" value="${sessionScope.__AUTH_ANTIQUE__.phone}"></div>

            <div>&nbsp;</div>
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



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>


</html>