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

            $("#mailSendForAuthorizationForm").submit(function (){

                var requestdata = $(this).serialize();

                $.ajax({
                    async: true,
                    type : 'POST',
                    url : "/users/sendEmail?" + requestdata,
                    dataType : "json",
                    contentType: "application/json; charset=UTF-8",
                    success : function (result) {

                        console.log("success ajax");
                        console.log(result.check);
                        // if(result.check){
                        //     console.log('okay');
                        //     $('#mymsg').text('okay');
                        //     $('#inputuserId').val(null);
                        //     $('#inputNickname').val(null);
                        //
                        //
                        // }else {
                        //     console.log('nope');
                        //     $('#mymsg').text('nope');
                        //     $('#inputuserId').val(null);
                        //     $('#inputNickname').val(null);
                        //
                        //
                        // }

                        setTimeout(function (){ isAjaxing = false}, 1000);

                    },
                    error : function (error) {

                        console.log("error", error);

                        setTimeout(function (){ isAjaxing = false}, 1000);

                    },

                });

            })


            $("#checkAuthorizationNumberForm").submit(function (){

                var requestdata = $(this).serialize();

                $.ajax({
                    async: true,
                    type : 'POST',
                    url : "/users/confirmEmail?" + requestdata,
                    dataType : "json",
                    contentType: "application/json; charset=UTF-8",
                    success : function (result) {
                        log.info("success ajax")
                        // if(result.check){
                        //     console.log('okay');
                        //     $('#mymsg').text('okay');
                        //     $('#inputuserId').val(null);
                        //     $('#inputNickname').val(null);
                        //
                        //
                        // }else {
                        //     console.log('nope');
                        //     $('#mymsg').text('nope');
                        //     $('#inputuserId').val(null);
                        //     $('#inputNickname').val(null);
                        //
                        //
                        // }

                        setTimeout(function (){ isAjaxing = false}, 1000);

                    },
                    error : function (error) {

                        console.log("error", error);

                        setTimeout(function (){ isAjaxing = false}, 1000);

                    },

                });

            })

        });
    </script>
</head>
<body>

    <form id = mailSendForAuthorizationForm action="#">
        <input name="userId">
        <button type="submit">send</button>
    </form>

    <form id = checkAuthorizationNumberForm action="#">
        <input name="authorizationNumber">
        <button type="submit">check</button>
        <div id = "emailCheckStatus"></div>
    </form>

</body>
</html>
