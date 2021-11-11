<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login.jsp</title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
        
    <style>
        *{
            padding: 0;
            margin: 0;
        }

		html{
			background: 
                url(../../resources/images/flowerBack.jpg)
                no-repeat center center fixed;
            background-size: cover;
		}

        body{
            display: flex;
            justify-content: center;

            padding-top: 4rem;
        }

        #wrapper{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            width: 350px;

            background: rgba(255, 255, 255, 0.9);

            /* padding-top: 1.3rem; */
            padding: 2rem;
        }

        .logo{
            display: flex;
            justify-content: center;

            margin-bottom: 6em;
        }

        .logo img,
        .logo ul{
            margin: auto 0;
        }

        .logo img{
            height: 73px;
        }

        .logo ul{
            list-style: none;
        }

        .logo ul li{
            font-family: 'Merriweather', serif;
            font-weight: bold;

            margin-bottom: 2px;
            margin-left: 2px;
        }

        .greeting{
            font-family: 'Merriweather', serif;
            font-size: 1.5em;

            text-align: center;

            margin-bottom: 2rem;
        }

        #loginDiv{
            display: flex;
        }

        #loginForm input{
            width: 24em;
            height: 3.3em;

            margin-bottom: 1rem;
            padding-left: 0.8rem;
        }

        #loginForm button{
            width: 25.3em;
            height: 3.2em;

            font-weight: 400;
            color: whitesmoke;
            background-color: rgba(156, 0, 0, 0.8);

            border-style: none;
            border-radius: 5px;

            margin-bottom: 1rem;
        }

        #findIdPwd{
            display: flex;
            justify-content: space-between;
            border-bottom: 1.7px solid;
            border-color: rgba(190, 190, 190, 0.6);

            padding-bottom: 0.5rem;
            margin-bottom: 1rem;
            
            width: 350px;
        }

        #findIdPwd a{
            font-size: 0.5rem;
            font-weight: 500;
            color: rgb(0, 7, 100);
            text-decoration: none;
            
            padding-right: 0.7rem;
        }

        .signinLink{
            padding-left: 0.7rem;
        }

        #kakaoBtn{
            width: 21em;
        }
    </style>

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
            <p>Welcome !</p>
        </div>
        <div id="loginDiv">
            
            <form action="/users/loginPost" method="post">
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
                <a href="#">비밀번호 찾기</a>
            </div>
        </div>
        <div>
            <img id="kakaoBtn" onclick="kakaoLogin();" style="cursor: pointer;" src="../../resources/images/kakao_login.png">
        </div>
    </div>
</body>
</html>