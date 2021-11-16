<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300&display=swap" rel="stylesheet">
    <style>

        #productListWraper{

            margin: 0;
            padding: 0;
            width: 100%;
            height: 150%;

        }

        #categoryTitle{

            font-family: Merriweather;
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

            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bolder;
            float: right;
            position: relative;
            right: 15%;

        }

        #productListContainer{

            float: left;
            list-style: none;
            position: relative;
            width: 70%;
            left: 15%;
        }

        .product{

            float: left;
            width: 30%;
            margin-right: 1.5%;
            margin-left: 1.5%;
            padding-top: 2%;
            margin-bottom: 5%;
            text-align: center;
            border: solid 0.1rem;
            border-radius: 5%;
            border-color: #c2b1b1;



        }

        #productName{
            font-weight: bold;
            font-size: 1em;
        }

        .img{

            width: 70%;
        }

        ul{
            padding-inline-start: 0;
        }

        #pagingnationContainer{

            float: left;
            width: 100%;
            text-align: center;

        }

        .pagination{
            padding-inline-start: 0px;
            margin-bottom: 5%;
        }

        #currPage{
            border: solid 0.1rem;
            border-color: #c2b1b1;
            background-color: #c2b1b1;
            text-decoration: none;
            color: white;
            padding-right: 0.8rem;
            padding-left: 0.8rem;
            padding-top: 0.6rem;
            padding-bottom: 0.6rem;
            border-radius: 20%;
        }

        .page{

            border: solid 0.1rem;
            border-color: #c2b1b1;
            text-decoration: none;
            color: #3C3C3C;
            padding-right: 0.8rem;
            padding-left: 0.8rem;
            padding-top: 0.6rem;
            padding-bottom: 0.6rem;
            border-radius: 20%;

        }


    </style>

    <script type="text/javascript">

        $(document).ready(function (){

            var timearr = [];

            $(".leftTimeTimer").hide();

            $(".leftTimeTimer").each(function (){

                var time = $(this).text();
                var timeSecond = Number(time);
                timearr.push(timeSecond);
                // $(this).text(convertSeconds(timeSecond));
            });
            console.log(timearr);

            setInterval(function (){

                $(".leftTimeTimer").show();

                var count = 0;

                $(".leftTimeTimer").each(function (){

                    console.log("hi");
                    timearr[count] = timearr[count]-1
                    $(this).text(convertSeconds(timearr[count]));
                    count++;

                });

                count = 0;

            },1000);


            function convertSeconds(s){
                var day = Math.floor(s / (60*60*24));
                var hour = Math.floor(s /(60*24))%24;
                var min = Math.floor(s / 60 )%60;
                var sec = s % 60;
                return day + '일' + hour + '시간' +  min + '분' + sec + '초';

            }

        });

    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <div id="productListWraper">
        <div id="categoryTitle">
            <c:choose>
                <c:when test="${productCommand.category_id eq 0}"><h1>Chair</h1></c:when>
                <c:when test="${productCommand.category_id eq 1}"><h1>Cabinet</h1></c:when>
                <c:when test="${productCommand.category_id eq 2}"><h1>Bed</h1></c:when>
                <c:when test="${productCommand.category_id eq 3}"><h1>Closet</h1></c:when>
                <c:when test="${productCommand.category_id eq 4}"><h1>Dressing table</h1></c:when>
                <c:when test="${productCommand.category_id eq 5}"><h1>etc.</h1></c:when>
                <c:otherwise>Search Result</c:otherwise>
            </c:choose>
        </div>

        <div id = filterContainer>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=3">
                &nbsp;높은입찰가순
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=2">
                &nbsp;낮은입찰가순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=1">
                &nbsp;경매임박순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=0">
                등록순 |
            </a>
        </div>


        <c:set value="${productList}" var="list"/>

        <ul id="productListContainer">
            <c:forEach items="${productList}" var="product">
                <a href="/product/getDetail?${product.pId}">
                <li class="product">
                    <img class="img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7l2yA1G_b4-kI_Pc8uh4esNvynw6NYealww&usqp=CAU">
                    <p id="productName">${product.name}</p>
                    <p>경매 시작가 : ${product.startedPrice}</p>
                    <p>현재가 : ${product.startedPrice}</p>
                    <c:choose>
                        <c:when test="${product.leftTime < 0}">
                            <p>경매가 종료되었습니다.</p>
                        </c:when>
                        <c:otherwise>
                            <p class="leftTimeTimer">${product.leftTime}</p>
                        </c:otherwise>
                    </c:choose>
                </li>
                </a>
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
                        <c:choose>
                            <c:when test="${pageMaker.cri.page eq index}">
                                <a id="currPage">${index}</a>
                            </c:when>
                            <c:otherwise>
                                <a class="page" href="/product/productList${pageMaker.makeQuery(index)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">${index }</a>
                            </c:otherwise>
                        </c:choose>

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
