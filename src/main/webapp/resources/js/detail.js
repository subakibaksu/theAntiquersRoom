$(function(){

    var timearr = [];

    $(".leftTimeTimer").each(function(){

        var time = $('#leftTime').text();
        var timeSecond = Number(time);
        timearr.push(timeSecond);
    });


    setInterval(function(){
        
        var count = 0;

        $(".leftTimeTimer").each(function(){

            console.log('setInterval() invoked.');
            timearr[count] = timearr[count]-1;
            $(this).text(convertSeconds(timearr[count]));
            count++;
        });

        count = 0;
    }, 1000);


    function convertSeconds(s){

        if(s < 0){
            return '경매가 종료되었습니다.';

        }else{
            var day = Math.floor(s/(60*60*24));
            var hour = Math.floor(s/(60*24))%24;
            var min = Math.floor(s/60)%60;
            var sec = s % 60;

            return day+'일'+hour+'시간'+min+'분'+sec+'초';
        }
    } //convertSeconds
});