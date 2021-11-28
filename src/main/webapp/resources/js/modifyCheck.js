$(document).ready(function (){

    let idcheck = false;
    let nickcheck = false;
    let phonecheck = false;
	let pwcheck = false;
	let chpwcheck = false;
	
	

    //닉네임 체크
    $('#nickname').keyup(function () {
        if ($('#nickname').val() == "") {
            $('.nicknamecheck').text("닉네임을 입력해주세요.");
            $('.nicknamecheck').css('color', '#f82a2aa3');
            $('#nickname').focus();
            nickcheck = false;
        } else {
            $.ajax(
                {
                    async: true,
                    type: "post",
                    url: "/checkNickName",
                    data: JSON.stringify({ nickName: $('#nickname').val()}),
                    contentType: "application/json",
                    success: function (data) {
                        console.log('nickname in ajax');
                        console.log('data.nicknameCheck');
                        if (data.nicknameCheck == false) {
                            $('.nicknamecheck').text("OK");
                            $('.nicknamecheck').css('color', '#f82a2aa3');
                            nickcheck = true;
                        } else {
                            $('.nicknamecheck').text("사용중인 닉네임입니다.");
                            $('.nicknamecheck').css('color', '#f82a2aa3');
                            nickcheck = false;
                        }
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
                    $.ajax ({
                        async: true,
                        type: "post",
                        url: "/checkPhone",
                        data: JSON.stringify({ phone: $('#phonenumber').val()}),
                        contentType: "application/json",
                        success: function(data){
                            if(data.phonenumberCheck == false) {
                                $(".phonenumbercheck").text("OK");
                                $(".phonenumbercheck").css('color', '#f82a2aa3');
                                phonecheck = true;
                            } else {
                                $(".phonenumbercheck").text("이 번호로 가입한 이력이 존재합니다.");
                                $(".phonenumbercheck").css('color', '#f82a2aa3');
                                phonecheck = false;
                            }
                        }
                    });
                }
            });

	

    $('#password')
        .keyup(
        function() {
            const regxpwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/; //pwd
            if ($('#password').val() == "") {
                $('.passwordcheck').text(
                        "패스워드를 입력해주세요. ");
                $(".passwordcheck").css('color',
                    '#f82a2aa3');														
                pwcheck = false;
            } else if (!regxpwd.test($('#password')
                    .val())) {
                $('.passwordcheck')
                        .text(
                                "특수문자 최소 1개 포함한 영문과 숫자를 입력해주세요. ");
                $(".passwordcheck").css('color',
                    '#f82a2aa3');	
                pwcheck = false;
            } else {
                $(".passwordcheck").text("OK");
                $(".passwordcheck").css('color', '#f82a2aa3');
                pwcheck = true;
            }

            }); //패스워드 확인

    $('#passwordconfirm').keyup(function() {
        if ($('#passwordconfirm').val() != $('#password').val()) {
            $('.pwdconfirmcheck').text("입력한 패스워드가 일치하지 않습니다. ");
            $(".pwdconfirmcheck").css('color', '#f82a2aa3');		
            chpwcheck = false;
        } else {
            $(".pwdconfirmcheck").text("OK");
            $(".pwdconfirmcheck").css('color', '#f82a2aa3');
            chpwcheck = true;
        }

    }); //패스워드 재확인




    //수정하기 버튼클릭시에 alert 창 띄우기
    $('#modifyBtn').click(function() {

        buttonlive();
    });


    // 제출버튼 활성화 함수
    function buttonlive() {
        if (idcheck && pwcheck && chpwcheck
            && nickcheck && phonecheck ) {
            $("#modifyBtn").click(function(){
                alert("성공적으로 수정되었습니다.");
            });
        } else {
            alert("입력칸을 모두 채워주세요.");
            $("#modifyBtn").prop("disabled", true);
        }
    }

});