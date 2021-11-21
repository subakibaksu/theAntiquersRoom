<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>/product/register.jsp</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%--    <script>--%>
<%--        $(function () {--%>
<%--            $( "#startDatepicker").datepicker({--%>

<%--            $(".uploadResult ul li").each(function(i, obj){--%>

<%--                let jobj = $(obj);--%>

<%--                console.dir(jobj);--%>
<%--                console.log("-------------------------");--%>
<%--                console.log(jobj.data("filename"));--%>

<%--                str += "<input type='hidden' name='imageList["+i+"].imageId' value='"+jobj.data("imageId")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].imageName' value='"+jobj.data("imageName")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].imageUrl' value='"+jobj.data("imageUrl")+"'>";--%>
<%--                str += "<input type='hidden' name='imageList["+i+"].pId' value='"+ jobj.data("pId")+"'>";--%>

<%--            });--%>

<%--            console.log(str);--%>

<%--            formObj.append(str).submit();--%>
<%--        });--%>

    <script type="text/javascript">
        $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $( "#startDate" ).datepicker({
                showOn: "both",
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dateFormat: "yyyy-MM-dd",
                maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                onClose: function( selectedDate ) {
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#endDate").datepicker( "option", "minDate", selectedDate );
                }

            });
            $( "#endDate" ).datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dateFormat: "yyyy-MM-dd",
                maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                onClose: function( selectedDate ) {
                    // 종료일(endDate) datepicker가 닫힐때
                    // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                    $("#startDate").datepicker( "option", "maxDate", selectedDate );
                }

            });
        });
    </script>

<%--                }--%>
<%--            }); //$.ajax--%>
<%--       });--%>

<%--        // 업로드된 결과를 화면에서 섬네일을 만들어서 처리--%>
<%--        function showUploadResult(uploadResultArr){--%>

<%--            if(!uploadResultArr || uploadResultArr.length == 0){ return; }--%>

<%--            let uploadUL = $(".uploadResult ul");--%>

<%--            let str ="";--%>

<%--            $(uploadResultArr).each(function(i, obj) {--%>

<%--                if(obj.image){--%>
<%--                    let fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);--%>
<%--                    str += "<li data-path='"+obj.uploadPath+"'";--%>
<%--                    str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"--%>
<%--                    str +" ><div>";--%>
<%--                    str += "<span> "+ obj.fileName+"</span>";--%>
<%--                    str += "<button type='button' data-file=\'"+fileCallPath+"\' "--%>
<%--                    str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";--%>
<%--                    str += "<img src='/display?fileName="+fileCallPath+"'>";--%>
<%--                    str += "</div>";--%>
<%--                    str +"</li>";--%>
<%--                }else{--%>
<%--                    let fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);--%>
<%--                    let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");--%>

<%--                    str += "<li "--%>
<%--                    str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";--%>
<%--                    str += "<span> "+ obj.fileName+"</span>";--%>
<%--                    str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "--%>
<%--                    str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";--%>
<%--                    str += "<img src='/resources/img/attach.png'></a>";--%>
<%--                    str += "</div>";--%>
<%--                    str +"</li>";--%>
<%--                }--%>

<%--            });--%>

<%--            uploadUL.append(str);--%>
<%--        }--%>
<%--// 'X'아이콘을 클릭하면 서버에서 삭제하도록--%>
<%--        $(".uploadResult").on("click", "button", function(e){--%>

<%--            console.log("delete file");--%>

<%--            let targetFile = $(this).data("file");--%>
<%--            let type = $(this).data("type");--%>

<%--            let targetLi = $(this).closest("li");--%>

<%--            $.ajax({--%>
<%--                url: '/deleteFile',--%>
<%--                data: {fileName: targetFile, type:type},--%>
<%--                beforeSend: function(xhr) {--%>
<%--                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);--%>
<%--                },--%>

<%--                dataType:'text',--%>
<%--                type: 'POST',--%>
<%--                success: function(result){--%>
<%--                    alert(result);--%>

<%--                    targetLi.remove();--%>
<%--                }--%>
<%--            }); //$.ajax--%>
<%--        });--%>
<%--    });--%>

<%--</script>--%>


<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div>
        <h1>상품 등록</h1>

     <%--    상품 등록--%>
        <form action="/product/register" method="post" enctype="multipart/form-data">

                    <table id="infoTable">
                        <tr>
                            <th>상품명</th>
                            <td><input type="text" name="name" placeholder="상품명을 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>상세정보</th>
                            <td><input type="text" name="content" placeholder="상세정보를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>상품종류</th>
                            <td><input type="text" name="categoryId" placeholder="상품의 종류를 선택해주세요"></td>
                        </tr>
                        <tr>
                            <th>경매기간</th>
                            <input type="text" id="startDate" name="startedAt">
                            <input type="text" id="endDate" name="endedAt">
                        </tr>
                        <tr>
                            <th>시작 가격</th>
                            <td><input type="text" name="startedPrice" placeholder="시작가격을 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>입찰단위금액</th>
                            <td>
                                <select name="bidIncrement">
                                    <option value="none">입찰 단위금액을 선택해주세요</option>
                                    <option value="1000">1,000원</option>
                                    <option value="5000">5,000원</option>
                                    <option value="10000">10,000원</option>
                                    <option value="100000">100,000원</option>
                                </select>
                            </td>

                        </tr>

                <tr>
                    <th>상품 이미지</th>
                    <td><input type="file" name="images"></td>
                    <td><input type="file" name="images"></td>
                    <td><input type="file" name="images"></td>
                </tr>

                <tr>
                    <td>
                        <button type="submit" id="register">상품등록</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
