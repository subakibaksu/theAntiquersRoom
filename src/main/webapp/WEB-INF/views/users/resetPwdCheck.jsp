<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: KBS
  Date: 11/7/2021
  Time: 오전 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

    <c:if test="${checkemailsent}">
        <h3>이메일로 새로운 비밀번호가 전송되었습니다.</h3>
    </c:if>

    <c:if test="${!checkemailsent}">
        <h3>가입한회원이 아닙니다. 닉네임과 이메일을 확인해주세요</h3>
    </c:if>


    <a href="/">home</a>
</body>
</html>
