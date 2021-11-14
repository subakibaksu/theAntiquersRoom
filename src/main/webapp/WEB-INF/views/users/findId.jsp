<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login.jsp</title>
        
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
            <p>아이디 찾기</p>
        </div>
        <div id="loginDiv">
        

            
            <form action="/users/findId" name="findform" method="post">
            <table id="loginForm">
                <tr>
                    <td><input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요"></td>
                </tr>
                <tr>
                    <td><input type="text" id="phone" name="phone" placeholder="폰 번호를 입력하세요."></td>
                </tr>
                <tr>
                    <td>
                        
                        <button type="submit" id="loginBtn">찾기</button>
                        
                    </td>
                </tr>
            </table>



        
                <!-- 이름과 전화번호가 일치하지 않을 때-->
<%--                 <c:if test="${check == 1}">
                    <script>
                        opener.document.findform.nickName.value = "";
                        opener.document.findform.phone.value = "";
                    </script>

                </c:if> --%>
        
                <!-- 이름과 비밀번호가 일치할때 -->
                <c:if test="${check == 0 }">
                <label>${userId}</label>
                <div>&nbsp;</div>
                


                </c:if>
        
            </form>


	</script>












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
        <div>
            <img id="kakaoBtn" onclick="kakaoLogin();" style="cursor: pointer;" src="../../resources/images/kakao_login.png">
        </div>
    </div>
</body>
</html>