<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>/product/register.jsp</title>

    <%--        header--%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <%--        css--%>
    <link rel="stylesheet" href="/resources/css/product/register.css">

    <%--    datetimepicker 관련 --%>
    <link rel="stylesheet" href="/resources/css/datetimepicker/jquery.datetimepicker.min.css">
    <script type="text/javascript"
            src="/resources/js/datetimepicker/jquery.datetimepicker.full.min.js"></script>

    <%--    summernote 관련 --%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

    <script type="text/javascript">
        <%--    datetimepicker --%>
        $(document).ready(function () {
            productSubmitDate()
        });

        function productSubmitDate() {
            $.datetimepicker.setLocale('ko'); // 언어 설정
            let $startDate = $('#startDate');
            let $endDate = $('#endDate');

            $startDate.datetimepicker({
                timepicker: true,
                minDate: 0, // 최소 날짜
                lang: 'ko',
                format: 'Y-m-d H:00:00',
                scrollMonth: false,
                scrollInput: false,
                onShow: function (ct) {
                    this.setOptions({
                        maxDate: $endDate.val() ? $endDate.val() : false
                    })
                },
            });

            $endDate.datetimepicker({
                timepicker: true,
                lang: 'ko',
                format: 'Y-m-d H:00:00',
                scrollMonth: false,
                scrollInput: false,

                onShow: function (ct) {
                    this.setOptions({
                        minDate: $startDate.val() ? $startDate.val() : false
                    })
                },
            });
        }

        <%-- 빈값 찾기 --%>
        $(document)
            .ready(
                function () {
                    let namecheck = false;
                    let categoryIdcheck = false;
                    let startedPricecheck = false;
                    let bidIncrementcheck = false;
                    let startedAtcheck = false;
                    let endedAtcheck = false;
                    let contentcheck = false;
                    let imagescheck = false;

                    $('#productSubmit').submit(function (e) {
                        e.preventDefault();
                        Checkform();
                        buttonlive();
                    });

                    // 제출버튼 활성화 함수
                    function buttonlive() {
                        if (namecheck && categoryIdcheck && startedPricecheck
                            && bidIncrementcheck && startedAtcheck && endedAtcheck
                            && contentcheck && imagescheck) {
                            $('#productSubmit')[0].submit()
                            Swal.fire("경매 요청이 완료되었습니다.","","success");

                        } else {
                            Swal.fire('입력 칸을 모두 채워주세요.','','warning');
                        }
                    }

                    // 입력 값 체크
                    function Checkform() {
                        if ($('#name').val() != "") namecheck = true;

                        if ($('#categoryId').val() != "") categoryIdcheck = true;

                        if ($('#startedPrice').val() != "") startedPricecheck = true;

                        if ($('#bidIncrement').val() != "") bidIncrementcheck = true;

                        if ($('#startDate').val() != "") startedAtcheck = true;

                        if ($('#endDate').val() != "") endedAtcheck = true;

                        if ($('#summernote').val() != "") contentcheck = true;

                        if ($('#image1').val() != "") imagescheck = true;
                    }
                });
    </script>
</head>

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
                <%--    상품 등록 form --%>
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
                                        <option value="1">테이블</option>
                                        <option value="2">수납장</option>
                                        <option value="3">침대</option>
                                        <option value="4">옷장</option>
                                        <option value="5">소파</option>
                                        <option value="6">기타</option>
                                    </select>
                                </label>
                            </td>
                        </tr>

                        <tr>
                            <th>시작 가격</th>
                            <td>
                                <input type="text" id="startedPrice" class="check" name="startedPrice"
                                       placeholder="시작가격을 입력해주세요"> 원
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
                                </select> 원
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
                                <div id="register_page_button">
                                    <button type="submit" class="register_page_button">상품등록</button>
                                    <a href="/users/myAuctionList">
                                        <button type="button" class="register_page_button">취소</button>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
