<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>errorpage</title>
    <style>
    	img  {
    		margin: auto;
    		display: flex;
    	}
    	button {
    		border: 1px solid lightblue; 
    		background-color: lightblue;
    		font-size: 1.5rem;
    		border-radius: 0.5rem;
    		color: white;
    		text-align: center;
    		margin:auto;
    		display: block;
    		cursor: pointer;
    		margin-bottom: 4rem;
    	}
    </style>
</head>
<body>

<img alt="error.jpeg" src="/resources/images/errorpage.jpg" style="width: 600px;">

<button type="button" onclick="location.href='/'">메인페이지로 돌아가기</button>

</body>
</html>
