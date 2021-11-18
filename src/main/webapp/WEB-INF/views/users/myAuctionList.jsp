<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

        <script>
            $(function(){
                 $('#regBtn').click(function(){
                    console.log('regBtn click event triggered..');
    
                    self.location='/product/register';
                }); //regBtn_onclick
            }); //.jq
        </script>

        <div id="wrapper">

            <table id="myAcutionTbl">
                <caption>
                    <ul id="topmenu">
                        <li>&nbsp;</li>
                        <li>My Auction List</li>
                        <li><button id="regBtn" type="button" style="cursor: pointer">판매등록</button></li>
                    </ul>
                </caption>
                <thead>
                    <tr>
                        <th></th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>시작가격</th>
                        <th>현재가격</th>
                        <th>경매기간</th>
                        <th>경매상태</th>
                    </tr>
                </thead>
    
                <tbody>    
                    <c:forEach items="${myAuctionList}" var="myAuction">
                        <tr>
                            <td><img alt="" src="https://live.staticflickr.com/2827/10767844126_63b11d6c53_b.jpg" height="100px" width="100px"> </td>
                            <td><a href="/product/getDetail?pId=${myAuction.pId}"><c:out value="${myAuction.name}"/></a></td>
                            <td><c:out value="${myAuction.categoryName}"/></td>
                            <td><c:out value="${myAuction.startedPrice}"/></td>
                            <td><h3>현재가격</h3></td>

                    		<td>
                            ${myAuction.startedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}<br>
                            ~ ${myAuction.endedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}</td>
                            
                            <td><c:out value="${myAuction.status}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
    
                <tfoot>
    
                </tfoot>
            </table>
    
            <p>&nbsp;</p>
    
            <!-- 현재화면 하단부에 페이징 처리기준에 맞게, 페이지번호목록 표시 -->
            <div id="pagination">
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