<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

     <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
     
	<link rel="stylesheet" href="../../../resources/css/modify.css">


		<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>


<!-- <script type="text/javascript">
$(document)
.ready(
	function () {
		let idcheck = false;
		let pwcheck = false;
		let pwchcheck = false;
		let niccheck = false;
		let phonecheck = false;

		// 제출버튼 활성화 함수
		function buttonlive() {
			if (idcheck && pwcheck && pwchcheck
				&& phonecheck && niccheck) {
				$("#modifyBtn").prop("disabled", false);
			} else {
				$("#modifyBtn").prop("disabled", true);
			}
		}

		//이메일 정규표현식 체크 
		$('#emailbtn').click(function () {
			const regxEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //문자 + @ + 문자.문자
			if ($('#email').val() == "") {
				$('#idchecker').text("아이디를 입력해주세요.");
				$('#idchecker').css('color', '#f82a2aa3');
				$('#email').focus();
				idcheck = false;
				buttonlive();
			} else if (regxEmail.test($('#email').val()) != true) {
				$('#idchecker').text("올바른 양식으로 입력해주세요.");
				$('#idchecker').css('color', '#f82a2aa3');
				idcheck = false;

				// 이메일 중복체크 
			} else {
				console.log($('#email').val());
				$.ajax(
					{
						async: true,
						type: "post",
						url: "/users/checkId",
						data: JSON.stringify({ userId: $('#email').val() }),
						contentType: "application/json",
						success: function (data) {
							console.log('success');
							console.log(data.emailCheck);
							if (data.emailCheck) {
								$('#idchecker').text("사용가능한 아이디입니다.");
								$('#email').focus();
								idcheck = true;
							} else {
								$('#idchecker').text("사용중인 아이디입니다.");
								$('#idchecker').css('color', '#f82a2aa3');
								$('#email').val("");
								$('#email').focus();
								idcheck = false;
							}
							buttonlive();
						},
						error: function (e) {
							console.log('error');
						},
						complete: function () {

							console.log('coplete');

						}

					}
				);
			}
		});

		// 비밀번호
		$("#password")
			.keyup(
				function () {
					const password = $("#password")
						.val();
					const regxpwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
					const pwdTest = regxpwd
						.test(password); //true / false 반환
					//빈칸일 경우 
					if ($("#password").val() == "") {
						$('.passwordcheck')
							.text("패스워드를 입력해주세요.");
						$('.passwordcheck').css('color',
							'#f82a2aa3');
						pwcheck = false;
					} else if (!pwdTest) { //false면
						$('.passwordcheck')
							.text(
								"8~16자리의 영문+숫자+특수문자로 입력하세요.");
						$('.passwordcheck').css('color',
							'#f82a2aa3');
						pwcheck = false;
					} else {
						$('.passwordcheck').text('');
						pwcheck = true;
					}
					buttonlive();
				});

		// 비밀번호체크
		$('#confirmpassword').keyup(
			function () {
				if ($('#password').val() != $(
					'#confirmpassword').val()) {
					$('.pwdconfirmcheck').text('비밀번호가 일치하지 않습니다.');
					$('.pwdconfirmcheck').css('color', '#f82a2aa3');
					pwchcheck = false;
				} else {
					$('.pwdconfirmcheck').text('');
					pwchcheck = true;
				}
				buttonlive();
			});

		//닉네임 체크
		$('#nickname').keyup(function () {
			if ($('#nickname').val() == "") {
				$('.nicknamecheck').text("닉네임을 입력해주세요.");
				$('.nicknamecheck').css('color', '#f82a2aa3');
				$('#email').focus();
				niccheck = false;
				buttonlive();
			} else {
				$.ajax(
					{
						url: "checkNickName",
						data: { email: $('#nickname').val() },
						dataType: "html",
						success: function (responsedata) {
							$('.nicknamecheck').html(responsedata);
							let data = responsedata.trim();
							if (data == "true") {
								$('.nicknamecheck').text("");
								niccheck = true;
							} else {
								$('.nicknamecheck').text("사용중인 아이디입니다.");
								$('.nicknamecheck').css('color', '#f82a2aa3');
								$('#nickname').val("");
								$('#nickname').focus();
								niccheck = false;
							}
							buttonlive();
						}
					}
				);
			}
		});

		// 핸드폰
		$("#phonenumber")
			.on(
				"keyup",
				function () {
					const regxPhone = /^(010[1-9][0-9]{7})$/
					// 010으로 시작, 중간번호의 첫 숫자는 0 제외, 총 11자리 숫자
					if ($('#phonenumber').val() == "") {
						$(".phonenumbercheck").text(
							"휴대폰 번호를 입력해주세요.");
						$(".phonenumbercheck").css('color',
							'#f82a2aa3');
						phonecheck = false;
					} else if (regxPhone.test($(
						'#phonenumber').val()) != true) {
						$(".phonenumbercheck").text(
							"올바른 양식으로 입력해주세요.");
						$(".phonenumbercheck").css('color',
							'#f82a2aa3');
						phonecheck = false;
					} else {
						$(".phonenumbercheck").text("");
						phonecheck = true;
					}
					buttonlive();
				});


	});
function checkz() {
if (idcheck && pwcheck && pwchcheck
	&& phonecheck && niccheck) {
	return true;
} else {
	return false;
}
} 

</script>-->


     
</head>
     
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<jsp:include page="/WEB-INF/views/common/mypageHeader.jsp"/>


    <div id="outline">
        
        <div id="inline">

                 <form action="/users/modify" method="post">
 
            <div class="text" >NickName: <input class="modifyInput" id="nickName" type="text"  name="nickName" value="${user.nickName}"><div class="check"><button id="" ><i class="fas fa-check""></i></button></div></div>
            <div>&nbsp;</div>
			<p class="nicknamecheck"></p>
            <div>&nbsp;</div>

            <div class="text">Email: <input class="modifyInput"  id="email" type="text" name="userId"  value="${user.userId}" ><div class="check2"><button id="" ><i class="fas fa-check""></i></button></div></div>
            <div>&nbsp;</div>
         	<p id="idchecker"></p>
            
            <div>&nbsp;</div>

            <div class="text">Paswword: <input class="modifyInput" id="password"  type="text"   name="password" value="${user.password}"></div>
            <div>&nbsp;</div>
			<p class="passwordcheck"></p>
            <div>&nbsp;</div>

            <div class="text">Check Paswword: <input class="modifyInput"  id="confirmpassword" type="text"  name="passwordcheck"  ></div>
            <div>&nbsp;</div>
           	<p class="pwdconfirmcheck"></p>
            <div>&nbsp;</div>

            <div>Phone: <input class="modifyInput" id="phonenumber"  type="text"  name="phone" value="${user.phone}"></div>

            <div>&nbsp;</div>
            <p class="phonenumbercheck"></p>
            
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>

            <div class="btnset"> 
                <button type="submit" id="modifyBtn">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button id="cancleBtn"><a href="/users/mypage">취소</a></button>
            </div>

				</form>        
            
        </div>
           
    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>


</html>