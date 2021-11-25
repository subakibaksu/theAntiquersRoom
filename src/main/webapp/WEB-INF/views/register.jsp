<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">
		<title>앤티커스 : 회원가입</title>

		<link rel="stylesheet" href="../../../resources/css/register.css">

		<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

	</head>

	<body>
	
		<!-- 사이트 로고-->
		<div class="basecontainer">
			<div class="top-header">
				<a href="#" class="logo">
					<div class="logo">The</div>
					<div class="logo">Antiquer's Room</div>
				</a>
			</div>
			<div>
				<div id="subject">회원가입</div>
			</div>

			<form name="infoRegister" action="/registerCheck" method="post">

				<!-- container -->
				<div class="form-container">
					<div class="regbase">

						<!-- 이메일 입력 -->
						<div class="regcontainer">
							<div class="regconfirm">

								<input class="registerEmail" id="email" type="text" name="userId" placeholder="이메일">
								<input class="regbtn" id="emailbtn" type="button" value="중복확인">
								<p id="idchecker"></p>
							</div>
							<button class="emailbtn" type="button" id="sendMailBtn">이메일 인증</button>
							<%-- 타이머 --%>

							<%-- 인증결과 --%>
							<div id="timer"></div>
							<!--이메일 인증번호 입력 -->
							<div class="emailconfirm">
								<input class="registerEmail" id="authInput" placeholder="인증번호">
								<input class="regbtn" type="button" id="checkAuthBtn" value="인증하기"/>
							</div>

						</div>

						<!-- 비밀번호 입력  -->
						<div class="regconfirm">
							<input type="text" class="register" id="password" name="password" placeholder="비밀번호">
							<p class="passwordcheck"></p>
						</div>

						<!-- 비밀번호 확인  -->
						<div class="regconfirm">
							<input type="text" class="register" id="confirmpassword" placeholder="비밀번호 확인">
							<p class="pwdconfirmcheck"></p>
						</div>
						
						<!-- 닉네임 입력  -->
						<div class="regconfirm">
							<input type="text" class="register" id="nickname" name="nickName" placeholder="닉네임">
							<p class="nicknamecheck"></p>
						</div>

						<!-- 핸드폰번호 입력 -->
						<div class="regconfirm">
							<input type="text" class="register" id="phonenumber" name="phone" placeholder="핸드폰번호 (-제외)">
							<p class="phonenumbercheck"></p>
						</div>

						<!-- 가입하기 버튼  -->
						<div id="registerbtn">
							<button type="submit" class="submitbtn" id="checkit" >가입하기</button>
						</div>
					</div>
				</div>

			</form>
		</div>

		<%-- 메일전송 --%>
		<form id = "mailSendForAuthorizationForm" action="#">
			<input hidden type="email" id="userId" name="userId">
		</form>

		<%-- 인증번호 확인 --%>
		<form id = "checkAuthorizationKeyForm" action="#">
			<input id="userIdForAuth" name="userId" hidden>
			<input name="auth" id="auth" hidden>
		</form>

		<script src="/resources/js/registerCheck.js"/>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
		
	</body>
	

	</html>