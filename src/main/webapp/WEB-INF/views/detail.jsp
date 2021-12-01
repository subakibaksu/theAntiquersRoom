<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>detail.jsp</title>

    <link rel="stylesheet" href="/resources/css/detail.css">

    <!-- fontAwdome for icons -->
    <script src="https://kit.fontawesome.com/91815d1378.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="/resources/js/detail.js"></script>

    <script>
        $(function(){
            // 첫 로드 시, 첫번째 사진 포커스
            var firstFocusImg = $('#pImg_1').attr('src');
            $('#focusedImg').attr('src', firstFocusImg);

            // 이후, 작은 사진들 클릭하는 대로 포커스 변경
            $('.pImg').on("click", function(){
                var FocusImg = $(this).attr('src');

                $('#focusedImg').attr('src', FocusImg);
            });
        });
    </script>

</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    </header>

    <div id="detail_wrapper">
        <section id="pInfo">
            <div id="pImgDiv">
                <table id="pImgTable">

                    <caption>카테고리 > ${product.categoryName}</caption>

                    <tr>
                        <td colspan="3">
                            <img id="focusedImg" src="" alt="">
                        </td>
                    </tr>
                    <tr>
                        <c:forEach var="imgUrl" items="${product.imageUrls}" varStatus="status">
                            <td><img class="pImg" id="pImg_${status.count}" src="${imgUrl}" alt=""></td>
                        </c:forEach>
                    </tr>
                </table>
            </div>
            <div id="infoDiv">
                <div id="leftTime" hidden>${product.leftTime}</div>
                <table id="infoTable">
                    <tr>
                        <th>판매자</th>
                        <td>${product.nickname}</td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>${product.name}</td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>${product.categoryId}</td>
                    </tr>
                    <tr>
                        <th>경매 시작 가격</th>
                        <td>${product.startedPrice}원</td>
                    </tr>
                    <tr>
                        <th>현재 금액</th>
                        <td>
                            <c:choose>
                                <c:when test="${empty product.currPrice}">
                                    <p>${product.startedPrice} 원</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${product.currPrice} 원</p>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <th>입찰 증액 단위</th>
                        <td>${product.bidIncrement} 원</td>
                    </tr>
                    <tr>
                        <th>입찰금액<br>(현재가+증액단위)</th>
                        <td id="bidTd">
                            <form id="bidForm" action="#">
                                <input hidden name="pid" value="${product.pid}">
                                <button id="upBtn" type="button" onclick='changeBid("up")'>
                                    <i class="fas fa-chevron-circle-up" ></i>
                                </button>
                                <c:choose>
                                    <c:when test="${empty product.currPrice}">
                                        <input type="text" id="bidPrice" name="bidPrice" value="${product.startedPrice}">원
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" id="bidPrice" name="bidPrice" value="${product.currPrice}">원
                                    </c:otherwise>
                                </c:choose>
                                <button id="downBtn" type="button" onclick='changeBid("down")'>
                                    <i class="fas fa-chevron-circle-down" ></i>
                                </button>
                            </form>

                            <button type="button" id="bidBtn">입찰</button>
                            <!-- <p id="bidResult"></p> -->
                        </td>
                    </tr>
                    <tr>
                        <th>남은 시간</th>
                        <td>
                            <div class="leftTimeTimer"></div>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" id="bidHistBtn">입찰 목록</button>

                            <div id="bidHistory" hidden>
                            <table id="bidHistoryTable">
                                <th>이름</th>
                                <th>입찰가</th>
                                <th>입찰시간</th>
                                    <c:forEach var="bidHistory" items="${bidHistoryList}">
                                    <tr>
                                        <td>${bidHistory.nickName}</td>
                                        <td>${bidHistory.bidPrice}</td>
                                        <td>${bidHistory.bidAt}</td>
                                    </tr>
                                    </c:forEach>
                            </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section id="additionalInfo">
            <table id="additionalInfoTable">
                <tr>
                    <th><a id="productInfo" >상품 설명</a></th>
                    <th><a id="sellerReview" >판매자 이전 리뷰</a></th>
                    <th><a id="thisQnA" >문의사항 </a></th>
                </tr>
                <tr id="infoDetail">
                    <td colspan="3">
                        <div id="contentBox">${product.content}</div>
                    </td> <!-- ajax로 정보 받아와서 띄워주기 -->
                </tr>
            </table>
        </section>
    </div>

    <footer id="footerBox">
        <jsp:include page="common/footer.jsp"></jsp:include>
    </footer>


    <!-- jQuery/script -->
    <script>
        $(function(){

            $('#productInfo').on("click", function(){
               $('#contentBox').text('${product.content}');
            }); //상품설명

            $('#sellerReview').on("click", function(){
                $.ajax({
                    url: "/board/review?pid=${product.pid}",
                    dataType: "html",
                    success: function(data){
                        console.log(data);
                        $('#contentBox').html(data);
                    },
                    error: function(){alert('로드에 실패하였습니다.');}
                });
            }); //판매자 이전리뷰

            $('#thisQnA').on("click", function(){
                $.ajax({
                    url: "/board/QnA?pid=${product.pid}",
                    dataType: "html",
                    success: function(data){
                        console.log(data);
                        $('#contentBox').html(data);
                    },
                    error: function(){alert('로드에 실패하였습니다.');}
                });
            }); //문의사항
        });

        function changeBid(type){
            const bidPrice = document.getElementById('bidPrice');
            let amount = bidPrice.value;

            let product = "${product}";
            let increment = "${product.bidIncrement}";

            if(type == 'up'){
                amount = parseInt(amount)+parseInt(increment);
            }else if(type == 'down' && amount != increment){
                amount = parseInt(amount)-parseInt(increment);
            }

            bidPrice.value = amount;
        }

        $(document).ready(function (){

            $("#bidHistBtn").click(function (){
                $("#bidHistory").slideToggle("slow");
            });

            $("#bidBtn").click(function (){

                var data  = $("#bidForm").serializeObject();

                console.log(data);

                $.ajax({
                    async: true,
                    type : 'POST',
                    data : JSON.stringify(data),
                    url : "/product/bid",
                    contentType: "application/json",
                    success : function (result) {
                        if(result.bidCheck){
                            Swal.fire("입찰에 성공하였습니다.","","success");
                        }else{
                            Swal.fire({
                                title: '입찰에 실패하였습니다.',
                                icon: 'error',
                                closeOnClickOutside: false
                            }).then(function () {
                                if('${sessionScope.__AUTH_ANTIQUE__.userId}' == ''){
                                    self.location.href = '/login';
                                }                                
                            });
                        }
                    },
                    error : function (error) {
                        console.log("error", error);
                    },
                    complete : function (){
                        $("#bidHistoryTable").load(location.href+' #bidHistoryTable');
                    }
                });
            });
        });
    </script>
    <script src="/resources/js/common/serializeObject.js"></script>

</body>
</html>
