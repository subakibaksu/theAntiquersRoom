<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

    <p>this is productList</p>
    <c:set value="${productList}" var="list"/>

    <a href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=0">
        최근등록순
    </a>

    <a href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=1">
        늦은등록순
    </a>


    <c:forEach items="${productList}" var="product">
        <p>${product.name}</p>
        <p>${product.userId}</p>
        <p>${product.startedPrice}</p>
    </c:forEach>


    <ul class="pagination">
    <c:if test="${pageMaker.prev}">
        <li>
            <a href="/product/productList${pageMaker.makeQuery(pageMaker.startPage - 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">[이전]</a>
        </li>

    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
        <a href="/product/productList${pageMaker.makeQuery(index)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">[${index }]</a>
    </c:forEach>

    <c:if test="${pageMaker.next }">
        <li>
            <a href="/product/productList${pageMaker.makeQuery(pageMaker.endPage + 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">[다음]</a>
        </li>
    </c:if>
    </ul>


</body>
</html>
