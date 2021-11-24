<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login.jsp</title>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/resetPassword.css">
    <link rel="stylesheet" href="../../../resources/css/login.css">
    <script src="/resources/js/resetPassword.js"/>
</head>
<body>
    <!-- 카카오 로그인 -->
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

    <div id="wrapper">
        <div class="logo">
            <img src="../../../resources/images/logoImg.png" alt="image not found">
            <ul>
                <li>The</li>
                <li>Antiquer's Room</li>
            </ul>
        </div>
        <div class="greeting">
            <p>Welcome !</p>
        </div>
        <div id="loginDiv">
            
            <form action="/loginCheck" method="post">
            <table id="loginForm">
                <tr>
                    <td><input type="text" name="userId" placeholder="이메일 주소를 입력하세요"></td>
                </tr>
                <tr>
                    <td><input type="password" name="password" placeholder="비밀번호"></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" id="loginBtn">로그인</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
        <div id="findIdPwd">
            <div>
                <a class="signinLink" href="#">회원가입</a>
            </div>
            <div>
                <a href="#">아이디 찾기</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" style="" >
                    비밀번호찾기
                </a>
                <%-- 비밀번호 찾기 시 나오는 모달 --%>
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">비밀번호 찾기</h5>
                            </div>
                            <div class="modal-body">
                                <form id="resetPasswordForm" action=#>
                                    <input id="inputuserId" name="userId" placeholder="이메일을 입력하세요">
                                    <input id="inputNickname" name="nickName" placeholder="닉네임을 입력하세요">
                                    <button type="submit" id="resetPasswordFormSubmit" class="mybtn">재발급</button>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <p id="mymsg"></p>
                                <button type="button" class="mybtn" data-dismiss="modal">닫기</button>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div>
            <img id="kakaoBtn" onclick="kakaoLogin();" style="cursor: pointer;" src="../../resources/images/kakao_login.png">
        </div>
    </div>
</body>
</html>