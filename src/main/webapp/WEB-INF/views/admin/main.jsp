<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main.jsp</title>

    <link rel="stylesheet" href="/resources/css/myAuctionList.css"> 

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    
</head>
<body>

    <header>
        <jsp:include page="../common/adminHeader.jsp"></jsp:include>
    </header>

	<div id="wrapper">
	
	     <table id="myAcutionTbl">
	        <caption>
	            <ul id="topmenu">
	                <li>&nbsp;</li>
	                <li>승인 요청 상품</li>
	                <li><button id="regBtn" type="button" style="cursor: pointer">승인</button></li>
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
	            </tr>
	        </thead>
	
	        <tbody>    
	                <tr>
	                    <td><img alt="" src="https://live.staticflickr.com/2827/10767844126_63b11d6c53_b.jpg" height="100px" width="100px"></td>
	                    <td>productName</td>
	                    <td>categoryName</td>
	                    <td>startedPrice</td>
	                    <td>현재가격</td>
	            		<td>
	                    <b>시작</b> MM월 dd일 HH시<br>
	                    <b>종료</b> MM월 dd일 HH시
	                    </td>
	                </tr>
	        </tbody>
	
	        <tfoot>
	
	        </tfoot>
	    </table>
	
	    <p>&nbsp;</p>

    </div>

	<footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>

</body>
</html>