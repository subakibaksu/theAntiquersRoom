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
        <link rel="stylesheet" href="/resources/css/myAuctionList.css">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    	
    </head>
    <body>
   		<!-- header -->
		<header>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	        <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>
        </header>


        <script>
            $(function(){
                 $('#regBtn').click(function(){
                    console.log('regBtn click event triggered..');
    
                    self.location='/product/register';
                }); //regBtn_onclick
            }); //.jq
        </script>

        <div id="myPageWrapper">

            <table id="myAcutionTbl">
                <caption>
                    <ul id="topmenu">
                        <li>&nbsp;</li>
                        <li id="myAuction_title">My Auction List</li>
                        <li><button id="regBtn" type="button">판매등록</button></li>
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
                            <td><a href="/product/getDetail?pid=${myAuction.pid}"><img src="${myAuction.imageUrl}" height="100px" width="100px"></a></td>
                            <td><a href="/product/getDetail?pid=${myAuction.pid}"><c:out value="${myAuction.name}"/></a></td>
                            <td><c:out value="${myAuction.categoryName}"/></td>
                            <td><c:out value="${myAuction.startedPrice}"/>원</td>
                            <td>
                                <c:choose>
                                    <c:when test="${empty myAuction.currPrice}">
                                        <c:out value="${myAuction.startedPrice}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${myAuction.currPrice}"/>
                                    </c:otherwise>
                                </c:choose>
                            원</td>
                    		<td>
                            <b>시작</b> ${myAuction.startedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}<br>
                            <b>종료</b> ${myAuction.endedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}
                            </td>
                            <c:choose>
                            	<c:when test="${myAuction.status=='승인대기중'}">
                            		<td>
                            			<c:out value="${myAuction.status}"/><br>
                            			<form action="/product/modify" method="get">
	                            			<input type="hidden" id="pid" name="pid" value="${myAuction.pid}">
	                            			<input type="submit" id="modifyBtn" value="수정">
	                            		</form>
	                            		<form action="/product/remove" method="post">
	                            			<input type="hidden" id="pid" name="pid" value="${myAuction.pid}">
	                            			<input type="submit" id="removeBtn" value="삭제">
	                            		</form>
                            		</td>
                            	</c:when>
                            	<c:when test="${myAuction.status=='미낙찰'}">
                            	    <td>
                            			<c:out value="${myAuction.status}"/><br>
                            			<form action="/product/reRegister" method="get">
	                            			<input type="hidden" id="pid" name="pid" value="${myAuction.pid}">
	                            			<input type="submit" id="reRegisterBtn" value="재경매">
	                            		</form>
                            		</td>
                            	</c:when>
                            	<c:when test="${myAuction.status=='낙찰완료'}">
                            	    <td>
                            			<c:out value="${myAuction.status}"/><br>
                            			<form action="/users/chat?pid=${myAuction.pid}" method="get">
	                            			<input type="hidden" id="pid" name="pid" value="${myAuction.pid}">
	                            			<input type="submit" id="reRegisterBtn" value="채팅">
	                            		</form>
                            		</td>
                            	</c:when>                            	
                            	<c:otherwise>
                            		<td><c:out value="${myAuction.status}"/></td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </tbody>

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
                            <li class="prev"><a class='prev' href="myAuctionList?currPage=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">이전</a></li>
                        </c:if>
                        
                        <!-- 페이지번호목록 표시 -->
                        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                        	<c:choose>
   	                        	<c:when test="${pageMaker.cri.currPage == pageNum}">
                                	<li class="active">${pageNum}</li>
                                </c:when>
                        		<c:otherwise>
                          			<li><a href="/users/myAuctionList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
								</c:otherwise>
							</c:choose>
                        </c:forEach>
    
                        <!-- 2. 다음 이동여부표시(next) -->
                        <c:if test="${pageMaker.next}">
                            <li class="next"><a class='next' href="myAuctionList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">다음</a></li>
                        </c:if>
                    </ul>
    
                </form>
            </div>
        </div>
        
    <footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
    </body>
</html>