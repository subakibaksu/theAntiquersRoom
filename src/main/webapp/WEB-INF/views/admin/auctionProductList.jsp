<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>auctionProductList.jsp</title>

    <link rel="stylesheet" href="/resources/css/myAuctionList.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
    <script>

	function getDetail(index){
		$( '#detail_'+index ).slideToggle();
	}

	</script>
</head>
<body>

    <header>
        <jsp:include page="../common/adminHeader.jsp"></jsp:include>
    </header>
    
	<div id="myPageWrapper">
	
	     <table id="myAcutionTbl">
	        <caption>
	            <ul id="topmenu">
	                <li>&nbsp;</li>
	                <li>경매상품</li>
	            </ul>
	        </caption>
	        <thead>
	            <tr>
	                <th></th>
	                <th>상품명</th>
	                <th>카테고리</th>
	                <th>판매자</th>
					<th>현재가격</th>
	                <th>시작가격</th>
	                <th>경매기간</th>
	                <th>경매상태</th>
	            </tr>
	        </thead>
			<tbody>    
				<c:forEach items="${auctionProductList}" var="aucProduct" varStatus="myIndex">
					<tr>
						<td>
							<img onclick="getDetail(${myIndex.index})" src="${aucProduct.imageUrl}" height="100px" width="100px">
							<div hidden id="detail_${myIndex.index}"><c:out value="${aucProduct.content}"/></div>
						</td>
						<td><c:out value="${aucProduct.name}"/></td>
						<td><c:out value="${aucProduct.categoryName}"/></td>
						<td><c:out value="${aucProduct.nickname}"/></td>
						<td><c:out value="${aucProduct.currPrice}"/></td>
						<td><c:out value="${aucProduct.startedPrice}"/></td>
						<td>
						<b>시작</b> ${aucProduct.startedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}<br>
						<b>종료</b> ${aucProduct.endedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}
						</td>
						<td>
							<c:out value="${aucProduct.status}"/><br>
							<c:if test="${aucProduct.status!='판매취소' and aucProduct.status!='낙찰완료' and aucProduct.status!='미낙찰' and aucProduct.status!='경매종료'}">
								<form action="/admin/stopSale" method="post">
									<input type="hidden" id="pId" name="pId" value="${aucProduct.pId}">
									<input type="submit" id="stopBtn" value="판매중단">
								</form>	
							</c:if>
						</td>
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
                         <li class="prev"><a class='prev' href="auctionProductList?currPage=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">이전</a></li>
                     </c:if>
                     
                     <!-- 페이지번호목록 표시 -->
                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
              	        <c:choose>
	                     	<c:when test="${pageMaker.cri.currPage == pageNum}">
	                        	<li class="active">${pageNum}</li>
	                        </c:when>
	                        <c:otherwise>
	                        	<li><a href="/admin/auctionProductList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
                     		</c:otherwise>
                     	</c:choose>
                     </c:forEach>
 
                     <!-- 2. 다음 이동여부표시(next) -->
                     <c:if test="${pageMaker.next}">
						<li class="next"><a class='next' href="auctionProductList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">다음</a></li>
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