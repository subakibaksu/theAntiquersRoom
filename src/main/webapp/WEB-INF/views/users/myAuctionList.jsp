<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>myAuctionList.jsp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../../../resources/css/myAuctionList.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>

        <div id="wrapper">

            <table border="1">
                <caption>
                    <ul id="topmenu">
                        <li>&nbsp;</li>
                        <li>나의 경매</li>
                        <li><button id="regBtn" type="button">판매등록</button></li>
                    </ul>
                </caption>
                <thead>
                    <tr>
                        <th></th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>판매자</th>
                        <th>시작가격</th>
                        <th>현재가격</th>
                        <th>경매기간</th>
                        <th>경매상태</th>
                    </tr>
                </thead>
    
                <tbody>    
                    <c:forEach items="${myAuctionList}" var="myAuction">
                        <tr>
                            <td><h3>이미지 넣기</h3></td>
                            <td><a href="/product/register?pId=${myAuction.pId}"><c:out value="${myAuction.name}"/></a></td>
                            <td><c:out value="${myAuction.categoryName}"/></td>
                            <td><c:out value="${myAuction.nickname}"/></td>
                            <td><c:out value="${myAuction.startedPrice}"/></td>
                            <td><h3>현재가격</h3></td>
                            <td><fmt:formatDate pattern="MM월 dd일 HH시" value="${myAuction.startedAt}"/><br>
                            <fmt:formatDate pattern="MM월 dd일 HH시" value="${myAuction.endedAt}"/></td>
                            <td><c:out value="${myAuction.status}"/></td>

                        </tr>
                    </c:forEach>
                </tbody>
    
                <tfoot>
    
                </tfoot>
            </table>
    
            <p>&nbsp;</p>
    
            <!-- 현재화면 하단부에 페이징 처리기준에 맞게, 페이지번호목록 표시 -->
            <div id="pagingnation">
                <form action="#" id="paginationForm">
                    <input type="hidden" name="currPage">
                    <input type="hidden" name="amount">
                    <input type="hidden" name="pagesPerPage">
    
                    <ul>
                        <!-- 1. 이전 이동여부표시(prev) -->
                        <c:if test="${pageMaker.prev}">
                            <li class="prev"><a class='prev' href="${pageMaker.startPage -1}">Prev</a></li>
                        </c:if>
                        
                        <!-- 페이지번호목록 표시 -->
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                            <li><a href="/users/getMyAuctionList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
                        </c:forEach>
    
                        <!-- 2. 다음 이동여부표시(next) -->
                        <c:if test="${pageMaker.next}">
                            <li class="next"><a class='next' href="${pageMaker.endPage +1}">Next</a></li>
                        </c:if>
                    </ul>
    
                </form>
            </div>
        </div>
    </body>
</html>