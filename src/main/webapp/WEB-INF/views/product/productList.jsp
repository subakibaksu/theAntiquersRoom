<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <style>

        #productListWraper{

            margin: 0;
            padding: 0;
            width: 100%;
            height: 150%;

        }

        #categoryTitle{

            font-family: "Times New Roman";
            margin-top: 10%;
            margin-bottom: 5%;
            text-align: center;

        }

        #filterContainer{
            float: right;
            position: relative;
            width: 100%;
            margin-bottom: 5%;

        }

        .filter{

            font-family: a타이틀고딕2;
            float: right;
            margin-right: 0.8rem;
            position: relative;
            right: 20%;

        }

        #productListContainer{

            float: left;
            list-style: none;
            position: relative;
            width: 60%;
            left: 20%;
        }

        .product{

            float: left;
            width: 33%;


        }

        .img{

            width: 60%;

        }

        #pagingnationContainer{

            float: left;
            width: 100%;
            text-align: center;

        }

        .pagination{
            padding-inline-start: 0px;
        }

        .page{

            background-color: #3C3C3C;
            text-decoration: none;
            color: white;
            padding-right: 0.8rem;
            padding-left: 0.8rem;
            padding-top: 0.6rem;
            padding-bottom: 0.6rem;
            border-radius: 20%;

        }


    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div id="productListWraper">
        <div id="categoryTitle">
            <c:choose>
                <c:when test="${productCommand.category_id eq 0}"><h1>Chair</h1></c:when>
                <c:when test="${productCommand.category_id eq 1}"><h1>Cabenet</h1></c:when>
                <c:when test="${productCommand.category_id eq 2}"><h1>Bed</h1></c:when>
                <c:otherwise>Search Result</c:otherwise>

            </c:choose>
        </div>

        <div id = filterContainer>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=0">
                | 최근등록순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=1">
                | 늦은등록순 |
            </a>
        </div>


        <c:set value="${productList}" var="list"/>

        <ul id="productListContainer">
            <c:forEach items="${productList}" var="product">
                <li class="product">
                    <img class="img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7l2yA1G_b4-kI_Pc8uh4esNvynw6NYealww&usqp=CAU">
                    <p>${product.name}</p>
                    <p>${product.userId}</p>
                    <p>${product.startedPrice}</p>
                </li>
            </c:forEach>
        </ul>

        <div id="pagingnationContainer">
            <ul class="pagination">

                    <c:if test="${pageMaker.prev}">
                        <li>
                            <a class="page" href="/product/productList${pageMaker.makeQuery(pageMaker.startPage - 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">이전</a>
                        </li>

                    </c:if>
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
                        <a class="page" href="/product/productList${pageMaker.makeQuery(index)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">${index }</a>
                    </c:forEach>

                    <c:if test="${pageMaker.next }">
                        <li>
                            <a class="page" href="/product/productList${pageMaker.makeQuery(pageMaker.endPage + 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">다음</a>
                        </li>
                    </c:if>

            </ul>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
