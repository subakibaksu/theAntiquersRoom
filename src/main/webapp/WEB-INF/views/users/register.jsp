<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>앤티커스 : 회원가입</title>

		<style>
			.basecontainer {

				max-width: 390px;
				margin: 0 auto;
			}

			.top-header {
				position: relative;
				padding: 60px 0 54px;
				box-sizing: border-box;

				margin: 0 auto;
				max-width: 768px;
				min-width: 460px;
				text-align: center;
			}

			h1 {
				font-family: Mercury Display A, Mercury Display B, MercuryDisplay-wb, Mercury Display, serif;
				text-decoration: none;
			}

			.regbase {
				text-align: center;
				align-items: center;
			}

			.join_title {
				text-align: left;
				margin-bottom: 0;
			}

			.regconfirm {
				width: 390px;
				border: 1px solid grey;
				padding-left: 22px;
				margin-bottom: ;
			}

			input {
				padding: 24px 16 8 16;
				width: 356px;
				height: 22px;
				border: 0;
			}

			.regbtn {
				width: 60px;
			}

			.inputbtn {
				width: 300px;
			}
		</style>

	</head>

	<body>


		<div class="basecontainer">
			<div class="top-header">
				<a href="#" class="logo">
					<span class="blind">
						<h1>The Antiquer's room</h1>
					</span>
				</a>
			</div>


			<form method="POST" action="">
				<!-- container -->
				<div class="form-container">
					<div class="regbase">
						<!-- 이메일 입력, 인증 -->
						<div class="regcontainer">
							<div class="regconfirm">
								<h4 class="join_title"><label for="email">아이디</label></h4>
								<input class="inputbtn" type="text">
								<input class="regbtn" type="button" value="중복확인">
							</div>
							<p class="Input-module_errorMessage" id="email-error">이메일을 다시 입력해주세요</p>
							<div class="regconfirm">
								<h4 class="join_title"><label for="confirmcode">인증번호</label></h4>
								<input class="inputbtn" type="text">
								<input class="regbtn" type="button" value="인증하기">
							</div>
						</div>

						<!-- pwd, pwdconfirm, nickname, phonenumber -->
						<div class="regconfirm">
							<h4 class="join_title"><label for="password">비밀번호</label></h4>
							<input type="text" class="register">
						</div>
						<p class="Input-module_errorMessage" id="password-error">비밀번호를 다시 입력해주세요</p>
						<div class="regconfirm">
							<h4 class="join_title"><label for="confirmpassword">비밀번호 확인</label></h4>
							<input type="text" class="register">
						</div>
						<p class="Input-module_errorMessage" id="wrongpassword">비밀번호가 맞지 않습니다</p>
						<div class="regconfirm">
							<h4 class="join_title"><label for="nickname">닉네임</label></h4>
							<input type="text" class="register">
						</div>
						<p class="Input-module_errorMessage" id="nickname-error">이미 있는 닉네임입니다.</p>
						<div class="regconfirm">
							<h4 class="join_title"><label for="phonenumber">핸드폰번호</label></h4>
							<input type="text" class="register">
						</div>
						<p class="Input-module_errorMessage" id="phonenumber-error">핸드폰번호를 올바르게 입력해주세요</p>
						<div class="regbtn">
							<input type="button" value="가입하기">
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>

	</html>