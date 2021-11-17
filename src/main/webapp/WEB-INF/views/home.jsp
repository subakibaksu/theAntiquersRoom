<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Home</title>

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script>
        $(function(){
            $('#loginBtn').click(function(){
                console.log('loginBtn click event triggered..');

                self.location='/login';
            }); //login_onclick
            
            $('#logoutBtn').click(function(){
                console.log('click event triggered..');

                self.location='/users/logout';
            }); //logout_onclick
        }); //.jq
    </script>
</head>
<body>

    <jsp:include page="common/header.jsp"></jsp:include>
    <h1>HimNaeYo GamDongHeeJo!!</h1>

    <P>  The time on the server is ${serverTime}. </P>

    <P>  Kakao Id : ${kakaoUserId}. </P>
    <P>  Kakao usertype : ${usertype}. </P>

    <img onclick="kakaoLogin();" style="cursor: pointer;" src="../../resources/images/kakao_login.png">

    <hr>
    <a href="/product/productList?category_id=0">0</a>
    <a href="/product/productList?category_id=1">1</a>
    <a href="/product/productList?category_id=2">2</a>

    <form action="/product/productList" method="get">
        <input name="searchQuery" placeholder="type">
        <button type="submit">click</button>
    </form>


    <a href="/users/resetPwd">resetPwd</a>

    <hr>
    <button type="button" id="loginBtn">로그인</button>

    <hr>
	<h3>${sessionScope.__AUTH_ANTIQUE__}</h3>
    <button type="button" id="logoutBtn">로그아웃</button>

	<hr>
	<a href="/product/getDetail">상세보기</a>
<!---------------- 카카오 로그인 ---------------->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
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
</body>
</html>
