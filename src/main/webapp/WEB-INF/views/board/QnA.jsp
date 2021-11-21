<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA.jsp</title>
</head>
<body>

	<div id="wrapper">

		<table border="1">
			<caption>
				<ul id="topmenu">
					<li>&nbsp;</li>
					<li>board</li>
					<li><button id="regBtn" type="button"><a href="/board/registerQnA">REGISTER</a></button></li>
				</ul>
			</caption>
			<thead>
				<tr>
					<th>bno</th>
					<th>title</th>
					<th>writer</th>
					<th>insert_ts</th>
					<th>update_ts</th>
				</tr>
			</thead>

			<tbody>
				<!-- BoardVO를 여러개 담고 있는 리스트 객체를 가지고 목록을 만들어 줘야 합니다 -->

				<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.title}"/></td>
						<td><c:out value="${board.author}"/><</td>
						<td><c:out value="${board.createdAt}"/></td>
						<td><c:out value="${board.updatedAt}"/></td>
					</tr>
				</c:forEach>

			</tbody>

			<tfoot>

			</tfoot>
		</table>

</body>
</html>