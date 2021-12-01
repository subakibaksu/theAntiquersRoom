<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>

	<link rel="stylesheet" href="/resources/css/mypage.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

</head>
<body>

    <header id="mypage_headerBox">
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"></jsp:include>
    </header>

    <div id="mypage_wrapper">
        <div id="info">
            <h3>${sessionScope.__AUTH_ANTIQUE__.userId}</h3>
            <div>${sessionScope.__AUTH_ANTIQUE__.nickName}</div>
            <div>${sessionScope.__AUTH_ANTIQUE__.phone}</div>
        </div>
        
        <div class="btnset">
            <button id="modifyBtn" >수정하기</button>
            <button id="removeBtn">회원탈퇴</button>
        </div>
    </div>
    
    <form id="modifyForm" action="/users/modify" method="get">
		<input type="hidden" id="userId" name="userId" value="${sessionScope.__AUTH_ANTIQUE__.userId}"/>
	</form>
	
	<form id="removeForm" action="/users/remove" method="post">
		<input type="hidden" id="userId" name="userId" value="${sessionScope.__AUTH_ANTIQUE__.userId}"/>
	</form>
	

    <footer>
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </footer>

      <script>
      
  		let mform = $("#modifyForm");
  		let rform = $("#removeForm");

  	    /* 삭제 버튼 */
  	    $("#removeBtn").on("click", function(e){
  	        rform.submit();
  	    });
  	    
        /* 수정 하기 버튼 */
        $("#modifyBtn").on("click", function(e){
            mform.submit();
        });
        
	</script>
</body>
</html>