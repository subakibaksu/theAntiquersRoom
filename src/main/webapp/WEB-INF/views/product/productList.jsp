<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/css/productList.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function (){

            var timearr = [];

            $(".leftTimeTimer").each(function (){

                var time = $(this).text();
                var timeSecond = Number(time);
                timearr.push(timeSecond);
            });

            setInterval(function (){

                $(".leftTimeTimer").fadeIn();
                var count = 0;

                $(".leftTimeTimer").each(function (){

                    timearr[count] = timearr[count]-1
                    $(this).text(convertSeconds(timearr[count]));
                    count++;
                });
                count = 0;
            },1000);


            function convertSeconds(s){
                if(s<0){
                    return '경매가 종료되었습니다';

                }else {
                    var day = Math.floor(s / (60*60*24));
                    var hour = Math.floor(s /(60*24))%24;
                    var min = Math.floor(s / 60 )%60;
                    var sec = s % 60;
                    return day + '일' + hour + '시간' +  min + '분' + sec + '초';
                }
            }
        });
    </script>
</head>
<body>
    <header id="headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </header>

    <div id="productListWraper">
        <div id="categoryTitle">
            <c:choose>
                <c:when test="${productCommand.category_id eq 0}"><h2>의자</h2></c:when>
                <c:when test="${productCommand.category_id eq 1}"><h2>테이블</h2></c:when>
                <c:when test="${productCommand.category_id eq 2}"><h2>수납장</h2></c:when>
                <c:when test="${productCommand.category_id eq 3}"><h2>침대</h2></c:when>
                <c:when test="${productCommand.category_id eq 4}"><h2>옷장</h2></c:when>
                <c:when test="${productCommand.category_id eq 5}"><h2>화장대</h2></c:when>
                <c:when test="${productCommand.category_id eq 6}"><h2>기타</h2></c:when>
                <c:otherwise>Search Result</c:otherwise>
            </c:choose>
        </div>

        <div id = filterContainer>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=3">
                &nbsp;높은입찰가순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=2">
                &nbsp;낮은입찰가순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=1">
                &nbsp;경매임박순 |
            </a>
            <a class="filter" href="/product/productList?category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=0">
                등록순
            </a>
        </div>


        <c:set value="${productList}" var="list"/>

        <ul id="productListContainer">
            <c:forEach items="${productList}" var="product">
                <a href="/product/getDetail?pid=${product.pid}">
                    <li class="product">
                        <img class="img" src="${product.imageUrl}" alt="">
                        <p id="productName">${product.name}</p>
                        <p>경매 시작가 : ${product.startedPrice} 원</p>
                        <c:choose>
                            <c:when test="${empty product.currPrice}">
                                <p>현재가 : ${product.startedPrice} 원</p>
                            </c:when>
                            <c:otherwise>
                                <p>현재가 : ${product.currPrice} 원</p>
                            </c:otherwise>
                        </c:choose>
                        <p hidden class="leftTimeTimer">${product.leftTime}</p>
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

    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </footer>

</body>
</html>
