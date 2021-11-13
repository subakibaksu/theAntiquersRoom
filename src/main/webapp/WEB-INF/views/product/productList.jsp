<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

    <p>this is productList</p>
    <c:set value="${productList}" var="list"/>

    <c:forEach items="${productList}" var="product">
        <p>${product.name}</p>
        <p>${product.user_id}</p>
    </c:forEach>


</body>
</html>
