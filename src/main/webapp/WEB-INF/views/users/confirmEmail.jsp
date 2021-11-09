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

            var isAjaxing = false;

            $("#sendMailBtn").click(function (){

                var userId = $("#userId").val();
                $("#userIdForAuth").val(userId);

                $("#mailSendForAuthorizationForm").submit(function (event){

                    event.preventDefault();

                    var requestdata = $(this).serialize();
                    console.log(requestdata);

                    if( isAjaxing ){
                        return;
                    }

                    isAjaxing = true;

                    $.ajax({
                        async: true,
                        type : 'POST',
                        url : "/users/sendEmail?" + requestdata,
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function (result) {

                            console.log("success ajax");
                            console.log(result.check);

                            if(result.check){

                                console.log('emaiisent');

                            }

                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        error : function (error) {

                            console.log("error", error);
                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },

                    });

                })

            });

            $("#checkAuthBtn").click(function (){

                console.log('clicked');


                $("#checkAuthorizationNumberForm").submit(function (event){

                    event.preventDefault();

                    if( isAjaxing ){
                        return;
                    }

                    isAjaxing = true;

                    var requestdata = $(this).serialize();
                    console.log(requestdata);
                    $.ajax({
                        async: true,
                        type : 'POST',
                        url : "/users/confirmEmail?" + requestdata,
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function (result) {

                            console.log("success ajax")
                            console.log(result.confirmResult);

                            if(result.confirmResult){
                                $("#emailCheckStatus").text('이메일 인증이 완료되었습니다.')
                            }else {
                                $("#emailCheckStatus").text('유효하지 않은 인증코드입니다.')
                            }

                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        error : function (error) {

                            console.log("error", error);

                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },

                    });

                })

            });

        });
    </script>
</head>
<body>

    <form id = mailSendForAuthorizationForm action="#">
        <input id="userId" name="userId">
        <button id="sendMailBtn">send</button>
    </form>

    <form id = checkAuthorizationNumberForm action="#">
        <input id="userIdForAuth" name="userId" hidden>
        <input name="authorizationNumber">
        <button id="checkAuthBtn">check</button>
        <p id = "emailCheckStatus"></p>
    </form>

</body>
</html>
