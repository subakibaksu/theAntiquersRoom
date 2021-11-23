<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>/product/register.jsp</title>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <%--    datepicker 관련--%>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <%--    summernote 관련--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<%--            });--%>

    <script>
        //datepicker 관련
        $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $("#startDate").datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                dateFormat: "yy-MM-dd 00:00:00",
                minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function (selectedDate) {
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#endDate").datepicker("option", "minDate", selectedDate);
                }

            });
            $("#endDate").datepicker({
                changeMonth: true,
                changeYear: true,
                nextText: '다음 달',
                prevText: '이전 달',
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                monthNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
                dateFormat: "yy-MM-dd 00:00:00",
                minDate: 0,                       // 선택할수있는 최날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function (selectedDate) {
                    // 종료일(endDate) datepicker가 닫힐때
                    // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                    $("#startDate").datepicker("option", "maxDate", selectedDate);
                }

            });
        });
    </script>

    <script type="text/javascript">
                $(document)
                    .ready(
                        function () {
                            let namecheck = false;
                            let categoryIdcheck = false;
                            let startedPricechcheck = false;
                            let bidIncrementcheck = false;
                            let startedAtcheck = false;
                            let endedAtcheck = false;
                            let contentcheck = false;
                            // let imagescheck = false;

                            $('#register').click(function (){
                                Checkform();
                                buttonlive();
                            });

                            // 제출버튼 활성화 함수
                            function buttonlive() {
                                if (namecheck && categoryIdcheck && startedPricecheck
                                    && bidIncrementcheck && startedAtcheck && endedAtcheck
                                    && contentcheck) {
                                    console.log("buttonlive true");
                                    $("#register").click(function () {
                                        alert("성공적으로 경매가 요청되었습니다.");
                                    });
                                } else {
                                    alert("입력칸을 모두 채워주세요.");
                                    $("#register").prop("disabled", true);
                                }
                            }

                            // 입력 값 체크
                            function Checkform() {
                                if ($('#name').val() == "") {
                                    $('#name').focus();
                                } else namecheck = true;

                                if ($('#categoryId').val() == "") {
                                    $('#categoryId').focus();
                                } else categoryIdcheck = true;

                                if ($('#startedPrice').val() == "") {
                                    $('#startedPrice').focus();
                                } else startedPricecheck = true;

                                if ($('#bidIncrement').val() == "") {
                                    $('#bidIncrement').focus();
                                } else bidIncrementcheck = true;

                                if ($('#startDate').val() == "") {
                                    $('#startDate').focus();
                                } else startedAtcheck = true;

                                if ($('#endDate').val() == "") {
                                    $('#endDate').focus();
                                } else endedAtcheck = true;

                                if ($('#summernote').val() == "") {
                                    $('#summernote').focus();
                                } else contentcheck = true;

                                // if ($('#images').val() == "") {
                                //     $('#images').focus();
                                // } else imagescheck = true;
                            }
                        });

    </script>


    <style>
        #wrapper {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            padding-top: 5rem;
            padding-bottom: 5rem;
        }

        #pInfo {
            display: flex;

            margin-bottom: 3rem;
        }

        #infoDiv {
            padding-top: 5em;
            margin-left: 2em;
        }

        #infoTable {
            border-collapse: collapse;
            /*border-spacing: 0px 0px;*/
            margin-left: auto;
            margin-right: auto;
            width: 50rem;
        }

        #infoTable tr {
            border-block: 1px solid rgba(194, 177, 177, 0.9);
        }

        #infoTable th,
        #infoTable td {
            text-align: left;
            font-size: 1rem;
            padding: 1rem 1rem;
        }

        #register {
            color: rgba(194, 177, 177, 0.9);
            font-weight: 800;

            border: 2px solid rgba(194, 177, 177, 0.9);
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 8px;
            text-align: center;

            display: block;
            width: 6rem;
            height: 2.3rem;
            padding-bottom: 0.2rem;
            margin: auto;
        }

        #subject {
            text-align: center;
            line-height: 4rem;
            font-size: 1.5rem;
            font-weight: 700;
        }

        input, select {
            border: 1px solid rgba(194, 177, 177, 0.9);
            width: 13rem;
            height: 1.6rem;
        }

        #infoTable span {
            font-size: 0.8rem;
        }

        .image2 {
            padding-top: 1em;
        }

        .vali {
            color: red;
        }
    </style>

<body>


<%--    summernote 관련 script--%>
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '상품의 상세 설명을 적어주세요!(1000자 이내)'	//placeholder 설정
        });
    });

</script>

<div id="wrapper">

    <div id="subject">경매 상품 등록</div>
    <section id="pInfo">
        <div id="infoDiv">
            <%--    상품 등록--%>
            <form id="productSubmit" action="/product/register" method="post" enctype="multipart/form-data">
                <table id="infoTable">
                    <tr>
                        <th>상품명</th>
                        <td>
                            <input type="text" name="name" class="check" id="name" placeholder="상품명을 입력해주세요">
                        </td>
                    </tr>

                    <tr>
                        <th>카테고리</th>
                        <td>
                            <label>
                                <select name="categoryId" class="check" id="categoryId">
                                    <option value="none">상품의 종류를 선택해주세요</option>
                                    <option value="0">의자</option>
                                    <option value="1">책상</option>
                                    <option value="2">수납장</option>
                                    <option value="3">침대</option>
                                    <option value="4">옷장</option>
                                    <option value="5">화장대</option>
                                    <option value="6">기타</option>
                                </select>
                                <p></p>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>시작 가격</th>
                        <td>
                            <input type="text" id="startedPrice" class="check" name="startedPrice"
                                   placeholder="시작가격을 입력해주세요">
                        </td>
                    </tr>

                    <tr>
                        <th>입찰단위금액</th>
                        <td>
                            <select name="bidIncrement" class="check" id="bidIncrement">
                                <option value="none">입찰 단위금액을 선택해주세요</option>
                                <option value="1000">1,000원</option>
                                <option value="5000">5,000원</option>
                                <option value="10000">10,000원</option>
                                <option value="100000">100,000원</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <th>경매기간</th>
                        <td>
                            <input type="text" class="check" id="startDate" name="startedAt">
                                ~
                            <input type="text" class="check" id="endDate" name="endedAt">
                        </td>
                    </tr>

                    <tr>
                        <th>상품 설명</th>
                        <td>
                            <label>
                                <textarea id="summernote" class="check" name="content"></textarea>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <th>이미지</th>
                        <td>
                            <input id="image1" class="check" type="file" name="images">
                            <span>대표 사진(필수)</span>
                            <div class="image2"><input type="file" name="images"></div>
                            <div class="image2"><input type="file" name="images"></div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <button type="submit" id="register" >상품등록</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
</div>
</body>
</html>
