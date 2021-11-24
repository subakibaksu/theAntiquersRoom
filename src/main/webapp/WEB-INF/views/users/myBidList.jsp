<%--
  Created by IntelliJ IDEA.
  User: KBS
  Date: 11/25/2021
  Time: 오전 6:23
  To change this template use File | Settings | File Templates.
--%>
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
<!-- header -->
<header>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>
</header>

<div id="myPageWrapper">



</div>

<footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</footer>
</body>
</html>