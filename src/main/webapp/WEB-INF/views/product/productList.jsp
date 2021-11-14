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


    <ul class="pagination">
    <!--
        이전 버튼이 클릭가능한 조건이면, a태그를 이용해 이전 버튼이 뜨도록 하고, href로 링크를 걸되
        아까 만든 makeQuery 메서드를 이용해서 쿼리문자열을 만들어 줍니다.
        ?page=어쩌고&perPageNum=어쩌고 이 부분을 생성해서 넣게 되는데 단 이전 버튼을 클릭하면
        현재 페이지가 시작페이지의 -1 이 되도록 되어야 함으로 그 부분만 신경써 주면 됩니다.
     -->
    <c:if test="${pageMaker.prev}">
        <li>
            <a href="/product/productList${pageMaker.makeQuery(pageMaker.startPage - 1)}">[이전]</a>
        </li>

    </c:if>

    <!--
        [1][2][3]....[10] 이 부분을 삽입하는 부분이다. jstl 이용해for문을 돌면서 startPage ~ endPage까지
        표시해주되, a태그 눌렀을 때 이동하는 page 부분에 index 지정하는 부분을 유의깁게 보길 바란다.
     -->
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
        <a href="/product/productList${pageMaker.makeQuery(index)}&category_id=${productCommand.category_id}">[${index }]</a>
    </c:forEach>

    <c:if test="${pageMaker.next }">
        <!--
        이전버튼과 마찬가지로 다음버튼을 끝 페이지보다1개 큰게 현재 페이지가 되도록 makeQuery에 page를 넣어줍시다.
        -->
        <li>
            <a href="/product/productList${pageMaker.makeQuery(pageMaker.endPage + 1)}">[다음]</a>
        </li>
    </c:if>
    </ul>


</body>
</html>
