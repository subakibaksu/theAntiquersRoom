$(document).ready(function (){

    let idcheck = false;
    let niccheck = false;
    let phonecheck = false;

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


    $('#modifyBtn').click(function() {

        buttonlive();
    });


    function buttonlive() {
        if (idcheck && niccheck && phonecheck) {
            $("#modifyBtn").click(function(){
                alert("성공적으로 수정되었습니다.");
            });
        } else {
            alert("입력칸을 모두 채워주세요.");
            $("#modifyBtn").prop("disabled", true);
        }
    }

});