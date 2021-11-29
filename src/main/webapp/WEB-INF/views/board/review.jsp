<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>reviewpage</title>
    <link rel="stylesheet" href="/resources/css/review.css">        
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document)
			.ready(function(){
			$("#content").onclick(function(){
 				$("#content").removeAttr('style');
			});
		});
	</script>
	
</head>

<body>
 	<div id= "reviewcontainer">
		     <table id="tableplace">
		     
		     	<tr class="tablehead" id="header">
		          <th id="tableImage">이미지</th>
		          <th id="tableContent">리뷰</th>
		          <th id="tableId">닉네임</th>
		          <th id="tableRating">별점</th>
		        </tr>
		<c:forEach items="${reviewList}" var="review">
	           <tr class="tablehead">
	              <td id="img"><c:out value="image"/></td>
	              <td id="content" style='white-space: nowrap; overflow: hidden;'><c:out value="${review.content}"/></td>
	              <td id="nick"><c:out value="${sessionScope.__AUTH_ANTIQUE__.nickName}"/></td>
	              <td id="rating">
	              	<c:choose>
	              		<c:when test="${review.score eq '1'}">
	              			<c:out value="★☆☆☆☆"/>
	              		</c:when>
	              		<c:when test="${review.score eq '2'}">
	              			<c:out value="★★☆☆☆"/>
	              		</c:when>
	              		<c:when test="${review.score eq '3'}">
	              			<c:out value="★★★☆☆"/>
	              		</c:when>
	              		<c:when test="${review.score eq '4'}">
	              			<c:out value="★★★★☆"/>
	              		</c:when>
	              		<c:when test="${review.score eq '5'}">
	              			<c:out value="★★★★★"/>
	              		</c:when>
	              	</c:choose>
	              </td>
	           </tr>
	    </c:forEach>
		     </table>
       	
	</div>
</body>

</html>