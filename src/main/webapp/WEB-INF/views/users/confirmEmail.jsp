<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KBS
  Date: 11/9/2021
  Time: 오전 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function (){

            //timer에 사용될 변수와, timer div hide()
            $("#timer").hide();
            var counter = 0;
            var lefttime = 0;

            //Ajax로 인한 중복요청문제를 방지하기 위한 변수설정
            var isAjaxing = false;

            //mailSendForAuthorizationForm의 submit을 Ajax로 실행
            $("#sendMailBtn").click(function (){

                //sendMailBtn 클릭시 userId값을 userIdForAuth input에 할당
                var userId = $("#userId").val();
                $("#userIdForAuth").val(userId);

                $("#mailSendForAuthorizationForm").submit(function (event){

                    //태그의 Default로인한 인한 문제를 방지
                    event.preventDefault();

                    //form 내부 input값을 serialize
                    var requestdata = $(this).serialize();

                    //Ajax로 인한 중복요청문제를 방지
                    if( isAjaxing ){
                        return;
                    }

                    isAjaxing = true;

                    //비동기 요청
                    $.ajax({
                        async: true,
                        type : 'POST',
                        url : "/users/sendEmail?" + requestdata,
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function (result) {

                            //emailsend 성공시 타이머생성
                            if(result.check){

                                console.log('emaiisent');
                                lefttime = 180;
                                counter = 0;
                                $("#timer").show();
                                makeTimer();

                            }

                            //Ajax로 인한 중복요청문제를 방지
                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        error : function (error) {

                            console.log("error", error);

                            //Ajax로 인한 중복요청문제를 방지
                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },

                    });

                })

            });

            $("#checkAuthBtn").click(function (){

                $("#checkAuthorizationKeyForm").submit(function (event){

                    //태그의 Default로인한 인한 문제를 방지
                    event.preventDefault();

                    //Ajax로 인한 중복요청문제를 방지
                    if( isAjaxing ){
                        return;
                    }

                    isAjaxing = true;

                    //비동기 요청
                    var requestdata = $(this).serialize();
                    console.log(requestdata);
                    $.ajax({
                        async: true,
                        type : 'POST',
                        url : "/users/confirmEmail?" + requestdata,
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function (result) {

                            //emailconfirm 성공시 #mymsg의 emailCheckStatus태그 내용을 변경
                            if(result.confirmResult){
                                $("#emailCheckStatus").text('이메일 인증이 완료되었습니다.')
                            }else {
                                $("#emailCheckStatus").text('유효하지 않은 인증코드입니다.')
                            }

                            //Ajax로 인한 중복요청문제를 방지
                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        error : function (error) {

                            console.log("error", error);

                            //Ajax로 인한 중복요청문제를 방지
                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },

                    });

                })

            });

            //값을 지정된 시간형태로 바꿔주는 function
            function convertSeconds(s){

                var min = Math.floor(s / 60);
                var sec = s % 60;
                return min + ':' + sec;

            }

            //타이머
            function makeTimer(){

                var setinterval = setInterval(function (){
                    counter++;
                    if(lefttime >= counter){
                        $("#timer").html(convertSeconds(lefttime - counter));
                    } else {
                        $("#timer").html('시간이 만료되었습니다.');
                    }
                }, 1000);

            };

        });

    </script>
</head>
<body>

    <%-- 메일전송 --%>
    <form id = mailSendForAuthorizationForm action="#">
        <input type="email" id="userId" name="userId">
        <button id="sendMailBtn">send</button>
    </form>

    <%-- 인증번호 확인 --%>
    <form id = checkAuthorizationKeyForm action="#">
        <input id="userIdForAuth" name="userId" hidden>
        <input name="auth">
        <button id="checkAuthBtn">check</button>
        <%-- 타이머 --%>
        <div id="timer"></div>
        <%-- 인증결과 --%>
        <p id = "emailCheckStatus"></p>
    </form>

</body>
</html>
