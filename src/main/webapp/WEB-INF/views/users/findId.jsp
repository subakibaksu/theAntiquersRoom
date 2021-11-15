<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>findId.jsp</title>
        
    <link rel="stylesheet" href="../../../resources/css/login.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

    <div id="wrapper">
        <div class="logo">
            <img src="../../../resources/images/logoImg.png" alt="image not found">
            <ul>
                <li>The</li>
                <li>Antiquer's Room</li>
            </ul>
        </div>
        <div class="greeting">
            <p>이메일 아이디 찾기</p>
            <hr>
           	<div> &nbsp;</div>
            <h6>등록한 휴대폰 번호를 입력하면</h6>
            <h6>이메일 주소를 알려드립니다.</h6>
        </div>
        <div id="loginDiv">
          
            <form action="/users/findId" name="findform" method="post">
            <table id="loginForm">
                <tr>
                    <td><input type="text" id="phone" name="phone" placeholder="연락처를 입력하세요."></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" id="loginBtn">이메일 아이디 찾기</button>
                    </td>
                </tr>
            </table>

                <!-- 이름과 전화번호가 일치하지 않을 때-->
               <c:if test="${check == 1}">
                    <script>
                        opener.document.findform.nickName.value = "";
                        opener.document.findform.phone.value = "";
                    </script>
                    <label >일치하는 정보가 존재하지 않습니다.</label>
                	<div>&nbsp;</div>
                </c:if>
        
                <!-- 전화번호가 일치할때 -->
                <c:if test="${check == 0 }">
                <label>찾으시는 아이디는 ${userId} 입니다.</label>
                <div>&nbsp;</div>
                </c:if>
            </form>

        </div>
        <div id="findIdPwd">
            <div>
                <a class="signinLink" href="#">회원가입</a>
            </div>
            <div>
                <a href="/login">로그인 하기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
 
    </div>
</body>
</html>
