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
         <h2>경매상품</h2>
         <div class="search-container">
         	<form action="/admin/searchItemList" method="post">
         		<div id=searchKwdBox>
		            <input id="searchBar" type="text" name="keyword" placeholder="'닉네임' 또는 '상품명'">
					<button class="searchBtn" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
         </div>
         <div id="total">
	         <c:choose>
		    	<c:when test="${ null eq pageMaker.cri.keyword}">
			            <p>총 상품수 : ${pageMaker.totalAmount}개</p>
		        </c:when>
		        <c:otherwise>
			            <p>"${pageMaker.cri.keyword}" 검색 결과 : ${pageMaker.totalAmount}개</p>
		        </c:otherwise>
         </c:choose>
         </div>

	     <table id="myAcutionTbl">
	        <thead>
	            <tr>
	                <th></th>
	                <th>상품명</th>
	                <th>카테고리</th>
	                <th>판매자</th>
					<th>현재가격</th>
	                <th>시작가격</th>
	                <th>경매기간</th>
	                <th>
		                <div class="dropdown">
		                	<button class="dropbtn">경매상태 &nbsp; <i class="fas fa-caret-down"></i></button>
							<div class="dropdown-content">
								 <a href="/admin/auctionProductList">전체보기</a>
								 <a href="#">승인완료</a>
								 <a href="#">판매취소</a>
								 <a href="#">경매중</a>
								 <a href="#">낙찰완료</a>
								 <a href="#">미낙찰</a>
								 <a href="#">유찰중</a>
								 <a href="#">경매종료</a>
							</div>
						</div>
	                </th>
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
	    
	    <c:choose>
	    	<c:when test="${ null eq pageMaker.cri.keyword}">
		         <!-- 전체 경매상품 페이징 표시 -->
		         <div id="pagination">
		             <form action="#" id="paginationForm">
		                 <input type="hidden" name="currPage">
		                 <input type="hidden" name="amount">
		                 <input type="hidden" name="pagesPerPage">
		 
		                 <ul>
		                     <!-- 이전 이동여부표시 -->
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
			                        	<li><a href="auctionProductList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
		                     		</c:otherwise>
		                     	</c:choose>
		                     </c:forEach>
		 
		                     <!-- 다음 이동여부표시 -->
		                     <c:if test="${pageMaker.next}">
								<li class="next"><a class='next' href="auctionProductList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">다음</a></li>
							</c:if>
		                 </ul>
		             </form>
		         </div>	    	
	    	</c:when>
	    	
	    	<c:otherwise>
	    	     <!-- 검색 결과 페이징 표시 -->
		         <div id="pagination">
		             <form action="#" id="paginationForm">
		                 <input type="hidden" name="currPage" value="${pageMaker.cri.currPage}">
		                 <input type="hidden" name="amount" value="${pageMaker.cri.currPage}">
		                 <input type="hidden" name="pagesPerPage" value="${pageMaker.cri.pagesPerPage}">
		                 <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		 
		                 <ul>
		                     <!-- 이전 이동여부표시 -->
		                        <c:if test="${pageMaker.prev}">
		                         <li class="prev"><a class='prev' href="searchItemList?currPage=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&keyword=${pageMaker.cri.keyword}">이전</a></li>
		                     </c:if>
		                     
		                     <!-- 페이지번호목록 표시 -->
		                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
		              	        <c:choose>
			                     	<c:when test="${pageMaker.cri.currPage == pageNum}">
			                        	<li class="active">${pageNum}</li>
			                        </c:when>
			                        <c:otherwise>
			                        	<li><a href="searchItemList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&keyword=${pageMaker.cri.keyword}">${pageNum}</a></li>
		                     		</c:otherwise>
		                     	</c:choose>
		                     </c:forEach>
		 
		                     <!-- 다음 이동여부표시 -->
		                     <c:if test="${pageMaker.next}">
								<li class="next"><a class='next' href="searchItemList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&keyword=${pageMaker.cri.keyword}">다음</a></li>
							</c:if>
		                 </ul>
		             </form>
		         </div>
	    	</c:otherwise>
	    </c:choose>

    </div>

	<footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>

</body>
</html>