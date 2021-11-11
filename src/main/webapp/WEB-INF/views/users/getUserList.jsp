<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>getUserList.jsp</title>
</head>
<body>

    <h3>/WEB-INF/views/users/getUserList.jsp</h3>




				<c:forEach items="${list}" var="user">
					

						
				<table border="1">
				<tr>
					<td>아이디</td>
					<td><a href="/users/get?userId=${user.userId}"><c:out value="${user.userId}"/></a></td>
				</tr>
					<tr>
					<td>비밀번호</td>
					<td><c:out value="${user.password}"/></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><c:out value="${user.nickName}"/></td>
				</tr>
				<tr>
					<td>폰번호</td>
					<td><c:out value="${user.phone}"/></td>
				</tr>

				
				</c:forEach>



			

        
    </form>
</body>
</html>