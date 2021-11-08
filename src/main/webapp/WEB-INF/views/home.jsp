<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Home</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<img onclick="kakaoLogin();" style="cursor: pointer;" src="../../resources/images/kakao_login.png">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
<!-- 카카오 로그인 -->
function kakaoLogin() {

    $.ajax({
        url: '/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }
</script>		
<a href="/users/resetPwd">resetPwd</a>

</body>
</html>
