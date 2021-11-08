<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login.jsp</title>
</head>
<body>

    <h3>/WEB-INF/views/users/login.jsp</h3>

    <hr>

    <form action="/users/login" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="userId"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="submit">로그인</button>
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>