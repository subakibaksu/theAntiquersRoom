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
</head>
<body>
    <h3>resetPwd</h3>

    <form action="/users/resetPwd" method="post">
        <input name="id" placeholder="email">
        <button type="submit">click this</button>
    </form>
</body>
</html>
