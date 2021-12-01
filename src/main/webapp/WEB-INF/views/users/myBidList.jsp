
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/css/myBidList.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function (){
            $("#productListContainer").fadeIn();
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
    <!-- header -->
    <header id="headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>
    </header>

    <div id="myPageWrapper">

        <div id="categoryTitle">
            <h1>My Bid</h1>
        </div>

        <table id="myBidTbl">
            <thead>
            <tr>
                <th></th>
                <th>상품명</th>
                <th>시작가격</th>
                <th>현재가격</th>
                <th>입찰금액</th>
                <th>구분</th>
                <th id="leftTimeTableHead">남은 시간</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${myBidList}" var="myBid">
                <tr>
                    <td><a href="/product/getDetail?pid=${myBid.pid}"><img src="${myBid.imageUrl}" height="100px" width="100px" alt=""></a></td>
                    <td><a href="/product/getDetail?pid=${myBid.pid}"><c:out value="${myBid.name}"/></a></td>
                    <td><c:out value="${myBid.startedPrice}"/></td>
                    <td><c:out value="${myBid.currPrice}"/></td>
                    <td><c:out value="${myBid.myBidPrice}"></c:out></td>
                    <c:choose>
                        <c:when test="${myBid.myBidPrice >= myBid.currPrice && !myBid.expiration}">
                            <td>낙찰</td>
                        </c:when>
                        <c:when test="${myBid.myBidPrice < myBid.currPrice && !myBid.expiration}">
                            <td>패찰</td>
                        </c:when>
                        <c:when test="${myBid.myBidPrice >= myBid.currPrice}">
                            <td>낙찰예상</td>
                        </c:when>
                        <c:otherwise>
                            <td>패찰예상</td>
                        </c:otherwise>
                    </c:choose>
                    <td><p hidden class = "leftTimeTimer"><c:out value="${myBid.leftTime}"></c:out><p></td>
                    <td>
                        <c:if test="${myBid.myBidPrice >= myBid.currPrice && !myBid.expiration}">
                            <a href="/users/chat?pid=${myBid.pid}"><button type="button" class="mybtn">연락</button></a>
                            <br>
                            <br>
                            <a href="/board/registerReview?pid=${myBid.pid}"><button type="button" class="mybtn reviewWrite">리뷰쓰기</button></a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="pagingnationContainer">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li>
                    <a class="page" href="/users/getMyBidList${pageMaker.makeQuery(pageMaker.startPage - 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">이전</a>
                </li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
                <c:choose>
                    <c:when test="${pageMaker.cri.page eq index}">
                        <a id="currPage">${index}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="page" href="/users/getMyBidList${pageMaker.makeQuery(index)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">${index }</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pageMaker.next }">
                <li>
                    <a class="page" href="/users/getMyBidList${pageMaker.makeQuery(pageMaker.endPage + 1)}&category_id=${productCommand.category_id}&searchQuery=${productCommand.searchQuery}&filter=${productCommand.filter}">다음</a>
                </li>
            </c:if>
        </ul>
    </div>
    </div>

    <footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
</body>
</html>
