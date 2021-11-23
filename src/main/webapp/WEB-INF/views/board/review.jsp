<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>reviewpage</title>
        <link rel="stylesheet" href="/resources/css/review.css">
        
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        
    </head>

    <body>
    
    
	    <div id= "reviewcontainer">
		
			<p>33</p>
		
	        <table id="tableplace">
	        
	        	<div class="tablehead">
		            <th id="tableImage">이미지</th>
		            <th id="tableContent">글내용 </th>
		            <th id="tableId">작성자 아이디</th>
		            <th id="tableRating">별점</th>
	            </div>
	            
	        	<div class="tablehead">
		            <tr>
		                <td>${file_image}</td>
		                <td>${review}</td>
		                <td>${user_id}</td>
		                <td>${star_rating}</td>
		            </tr>
	            </div>
	            <tr>
	                <td>images</td>
	                <td>content</td>
	                <td>nickname</td>
	                <td>별별별별별</td>
	            </tr>
	            
	        </table>
	        	
		</div>
		
		<%-- <div id="footer">
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		</div> --%>

    </body>
    

    </html>