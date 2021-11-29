$(document).ready(function (){

    let idcheck = false;
    let niccheck = false;
    let phonecheck = false;
    let emailconfirmcheck = false;

    //timer에 사용될 변수와, timer div hide()
    $(".emailconfirm").hide();
    $("#timer").hide();
    var counter = 0;
    var lefttime = 180;

    //Ajax로 인한 중복요청문제를 방지하기 위한 변수설정
    var isAjaxing = false;

    //mailSendForAuthorizationForm의 submit을 Ajax로 실행
    $("#sendMailBtn").click(function (){

        //sendMailBtn 클릭시 userId값을 userIdForAuth input에 할당
        $("#userId").val($("#email").val());
        var userId = $("#userId").val();
        $("#userIdForAuth").val(userId);

        //form 내부 input값을 serialize
        var data  = $("#mailSendForAuthorizationForm").serializeObject();

        //Ajax로 인한 중복요청문제를 방지
        if( isAjaxing ){
            return;
        }

        isAjaxing = true;

        console.log(data);

        //비동기 요청
        $.ajax({
            async: true,
            cache : false,
            type : 'POST',
            data : JSON.stringify(data),
            url : "/sendEmail",
            contentType: 'application/json',
            success : function (result) {

                //emailsend 성공시 타이머생성
                if(result.check){

                    console.log('emaiisent');
                    counter = 0;
                    lefttime = 180;
                    $(".emailbtn").hide();
                    $(".emailconfirm").show();
                    $("#timer").show();
                }

                //Ajax로 인한 중복요청문제를 방지
                setTimeout(function (){ isAjaxing = false}, 1000);
            },
            error : function (error) {

                console.log("error", error);

                //Ajax로 인한 중복요청문제를 방지
                setTimeout(function (){ isAjaxing = false}, 1000);
            },
        });
    });

    $("#checkAuthBtn").on("click",function (){

        //Ajax로 인한 중복요청문제를 방지
        if( isAjaxing ){
            return;
        }

        isAjaxing = true;

        $("#auth").val($("#authInput").val());

        //비동기 요청
        var data  = $("#checkAuthorizationKeyForm").serializeObject();

        console.log(data);
        $.ajax({
            async: true,
            cache : false,
            type : 'POST',
            data : JSON.stringify(data),
            url : "/confirmEmail",
            contentType: 'application/json',
            success : function (result) {

                console.log(result);
                console.log(result.confirmResult);
                //emailconfirm 성공시 #mymsg의 emailCheckStatus태그 내용을 변경
                if(result.confirmResult){
                    Swal.fire("성공적으로 인증 되었습니다.","","success");
                    emailconfirmcheck = true;


                }else {
                    Swal.fire("정상적으로 인증되지 않았습니다.","","error");
                    emailconfirmcheck = false;
                }

                //Ajax로 인한 중복요청문제를 방지
                setTimeout(function (){ isAjaxing = false}, 1000);

            },
            error : function (error) {

                console.log("error", error);

                //Ajax로 인한 중복요청문제를 방지
                setTimeout(function (){ isAjaxing = false}, 1000);

            },

        });

    });

    //데이터를 JSON형태로 변환
    jQuery.fn.serializeObject = function() {
        var obj = null;
        try {
            if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                var arr = this.serializeArray();
                if (arr) {
                    obj = {};
                    jQuery.each(arr, function() {
                        obj[this.name] = this.value;
                    });
                }//if ( arr ) {
            }
        } catch (e) {
            Swal.fire(e.message);
        } finally {
        }

        return obj;
    };

    //값을 지정된 시간형태로 바꿔주는 function
    function convertSeconds(s){

        var min = Math.floor(s / 60);
        var sec = s % 60;
        return min + ':' + sec;

    }

    //타이머

    setInterval(function (){
        counter++;
        if(lefttime >= counter){
            $("#timer").html(convertSeconds(lefttime - counter));
        } else {
            $("#timer").html('시간이 만료되었습니다.');
        }
    }, 1000);

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
                    url: "/checkId",
                    data: JSON.stringify({ userId: $('#email').val() }),
                    contentType: "application/json",
                    success: function (data) {
                        console.log('success');
                        if (data.emailCheck == false) {
                            $('#idchecker').text("OK");
                            $('#idchecker').css('color', '#f82a2aa3');
                            $('#email').focus();
                            idcheck = true;
                        } else {
                            $('#idchecker').text("사용중인 아이디입니다.");
                            $('#idchecker').css('color', '#f82a2aa3');
                            $('#email').focus();
                            idcheck = false;
                        }

                    },
                    error: function (e) {
                        console.log('error');
                    },
                    complete: function () {
                        console.log('complete');
                    }
                }
            );
        }
    });

    //닉네임 체크
    $('#nickname').keyup(function () {
        if ($('#nickname').val() == "") {
            $('.nicknamecheck').text("닉네임을 입력해주세요.");
            $('.nicknamecheck').css('color', '#f82a2aa3');
            $('#nickname').focus();
            niccheck = false;
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
                            niccheck = true;
                        } else {
                            $('.nicknamecheck').text("사용중인 닉네임입니다.");
                            $('.nicknamecheck').css('color', '#f82a2aa3');
                            niccheck = false;
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

    //가입하기 버튼클릭시에 alert 창 띄우기
    $('#infoRegister').submit(function(e) {
        e.preventDefault();
        buttonlive();
    });

    // 제출버튼 활성화 함수
    function buttonlive() {
        if (idcheck && niccheck && phonecheck && emailconfirmcheck) {
            Swal.fire({
                title: '성공적으로 가입 되었습니다.',
                icon: 'success',
                closeOnClickOutside: false
            }).then(function(){
                self.location.href='/';
            });
        } else{
            Swal.fire('입력 내용을 다시 확인 해주세요.','','warning');
        }
    }

});