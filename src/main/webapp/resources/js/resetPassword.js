$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
})

$(document).ready(function (){

        //Ajax로 인한 중복요청문제를 방지하기 위한 변수설정
        var isAjaxing = false;

        //resetPasswordForm의 submit을 Ajax로 실행
        $( "#resetPasswordFormSubmit").click(function (){

            $( "#resetPasswordForm").submit(function (event){

                //태그의 Default로인한 인한 문제를 방지
                event.preventDefault();

                //form 내부 input값을 serialize
                var requestdata = $(this).serialize();

                //Ajax로 인한 중복요청문제를 방지
                if( isAjaxing ){
                    return;
                }

                isAjaxing = true;

                //비동기 요청
                $.ajax({
                    async: true,
                    type : 'POST',
                    url : "/resetPwd?" + requestdata,
                    dataType : "json",
                    contentType: "application/json; charset=UTF-8",
                    success : function (result) {

                        //emailsend 성공시 #mymsg의 p태그 내용을 변경
                        if(result.check){

                            console.log('okay');
                            $('#mymsg').text('비밀번호가 정상적으로 발급되었습니다.');
                            $('#mymsg').css('color','green');
                            $('#inputuserId').val(null);
                            $('#inputNickname').val(null);

                        }else {

                            console.log('nope');
                            $('#mymsg').text('비밀번호가 정상적으로 발급되지 않았습니다.');
                            $('#mymsg').css('color','red');
                            $('#inputuserId').val(null);
                            $('#inputNickname').val(null);

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

        });

    }
);