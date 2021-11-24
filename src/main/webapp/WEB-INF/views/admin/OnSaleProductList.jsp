<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnSaleProductList.jsp</title>

    <link rel="stylesheet" href="/resources/css/myAuctionList.css"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
    <script>

	function getDetail(index){
		$( '#detail_'+index ).slideToggle();
	}
	
	
	function requestConfirm() {

		console.log("requestConfirm clicked");
	    var checkBoxArr = [];   
	    $("input[name='checkPId']:checked").each(function(i){	
	    	checkBoxArr.push($(this).val());   
		})
	 
	    $.ajax({
	        url: '/admin/confirmRequest'
	        , type: 'post'
	        , dataType: 'text'
	        , data: {
	        	checkBoxArr: checkBoxArr
	        }
	    	, success: function(data){
	    		alert("승인완료");
				window.location.href='/admin/main';
	    	}
	    });
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
	                <li>승인 요청 상품</li>
	            </ul>
	        </caption>
	        <thead>
	            <tr>
	                <th></th>
	                <th>상품명</th>
	                <th>카테고리</th>
	                <th>판매자</th>
	                <th>시작가격</th>
	                <th>경매기간</th>
	                <th>승인상태</th>
	                <th>승인</th>
	            </tr>
	        </thead>
			<tbody>    
				<c:forEach items="${requestedList}" var="reqProduct" varStatus="myIndex">
					<tr>
						<td>
							<img onclick="getDetail(${myIndex.index})" alt="" src="https://live.staticflickr.com/2827/10767844126_63b11d6c53_b.jpg" height="100px" width="100px">
							<div hidden id="detail_${myIndex.index}"><c:out value="${reqProduct.content}"/></div>
						</td>
						<td><c:out value="${reqProduct.name}"/></td>
						<td><c:out value="${reqProduct.categoryName}"/></td>
						<td><c:out value="${reqProduct.nickname}"/></td>
						<td><c:out value="${reqProduct.startedPrice}"/></td>
						<td>
						<b>시작</b> ${reqProduct.startedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}<br>
						<b>종료</b> ${reqProduct.endedAt.format(DateTimeFormatter.ofPattern("MM월 dd일 HH시"))}
						</td>
						<td><c:out value="${reqProduct.status}"/></td>
						<td>
							<c:choose>
								<c:when test="${reqProduct.status=='승인대기중'}">
									<form action="/admin/confirmRequest" method="post">
										<input type="checkbox" name="checkPId" id="myCheck" value="${reqProduct.pId}" >
									</form>
								</c:when>
								<c:otherwise>
									<i class="fas fa-check"></i>
								</c:otherwise>
							</c:choose>

						</td>
					</tr>
				</c:forEach>
			</tbody>
	       
	    </table>
	  
	    <button id="reqBtn" type="button" style="cursor: pointer" onclick="requestConfirm();">판매중단</button>
	
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
                         <li class="prev"><a class='prev' href="requestedList?currPage=${pageMaker.startPage -1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">이전</a></li>
                     </c:if>
                     
                     <!-- 페이지번호목록 표시 -->
                     <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
              	        <c:choose>
	                     	<c:when test="${pageMaker.cri.currPage == pageNum}">
	                        	<li class="active">${pageNum}</li>
	                        </c:when>
	                        <c:otherwise>
	                        	<li><a href="/admin/requestedList?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a></li>
                     		</c:otherwise>
                     	</c:choose>
                     </c:forEach>
 
                     <!-- 2. 다음 이동여부표시(next) -->
                     <c:if test="${pageMaker.next}">
						<li class="next"><a class='next' href="requestedList?currPage=${pageMaker.endPage +1}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">다음</a></li>
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