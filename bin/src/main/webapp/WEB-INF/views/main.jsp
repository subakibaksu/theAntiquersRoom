<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main.jsp</title>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        $(function(){
            console.clear;
            console.log('jquery started..');

            $('#logoutBtn').click(function(){
                console.log('click event triggered..');

                self.location='/users/logout';
            }); //onclick
        }); //.jq
    </script>
    
</head>
<body>

    <h3>/WEB-INF/views/main.jsp</h3>

    <hr>

    <h3>${userId}</h3>

    <hr>

    <button type="button" id="logoutBtn">로그아웃</button>

</body>
</html>