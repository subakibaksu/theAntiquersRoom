<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KBS
  Date: 11/7/2021
  Time: 오전 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <script type="text/javascript">
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })

        $(document).ready(function (){

        var isAjaxing = false;

            $( "#resetPasswordFormSubmit").click(function (){
                console.log('clicked')
                $( "#resetPasswordForm").submit(function (e){

                    console.log('submited')
                    e.preventDefault();

                    var requestdata = $(this).serialize();


                    console.log(requestdata);

                    if( isAjaxing ){
                        return;
                    }

                    isAjaxing = true;
                    $.ajax({
                        async: true,
                        type : 'POST',
                        url : "/users/resetPwd?" + requestdata,
                        dataType : "json",
                        contentType: "application/json; charset=UTF-8",
                        success : function (result) {
                            console.log(result.check);

                            if(result.check){
                                console.log('okay');
                                $('#mymsg').text('okay');
                                $('#inputuserId').val(null);
                                $('#inputNickname').val(null);


                            }else {
                                console.log('nope');
                                $('#mymsg').text('nope');
                                $('#inputuserId').val(null);
                                $('#inputNickname').val(null);


                            }

                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        error : function (error) {

                            console.log("error", error);

                            setTimeout(function (){ isAjaxing = false}, 1000);

                        },
                        complete : function () {

                            console.log("ajax completed")

                        }

                    });

                });

            });

            }
        )
    </script>

    <style>

        .mybtn{

            background-color: brown;
            border-color: aliceblue;


        }

        .mybtn:hover {

            background-color: grey;
            border-color: grey;

        }

        .mybtn:active{

            background-color: brown;
            border-color: aliceblue;
        }

        .mybtn:focus{

            background-color: brown;
            border-color: aliceblue;

        }



    </style>
</head>
<body>
    <h3>resetPwd</h3>


    <button type="button" class="btn btn-secondary mybtn" data-toggle="modal" data-target="#exampleModalCenter" style="" >
        비밀번호찾기
    </button>

    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">비밀번호 찾기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="resetPasswordForm" action=#>
                        <input id="inputuserId" name="userId" placeholder="email">
                        <input id="inputNickname" name="nickName" placeholder="type your nickname">
                        <button type="submit" id="resetPasswordFormSubmit" class="btn btn-secondary mybtn">click this</button>
                    </form>

                </div>
                <div class="modal-footer">
                    <p id="mymsg"></p>

                    <button type="button" class="btn btn-secondary mybtn" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
