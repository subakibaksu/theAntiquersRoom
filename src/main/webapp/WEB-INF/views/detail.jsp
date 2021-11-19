<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>detail.jsp</title>
    
    <link rel="stylesheet" href="../../../resources/css/detail.css">

    <!-- fontAwdome for icons -->
    <script src="https://kit.fontawesome.com/91815d1378.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="../../../resources/js/detail.js"></script>

    <script type="text/javascript">

        $(document).ready(function (){

            $("#bidBtn").click(function (){

                $("#bidPriceForBid").val($("#bidPrice").val());

                console.log($("#bidPriceForBid").val());

                var data  = $("#bidForm").serializeObject();

                console.log(data);
                console.log('clicked');

                $.ajax({

                    async: true,
                    type : 'POST',
                    data : JSON.stringify(data),
                    url : "/product/bid",
                    contentType: 'application/json',

                    success : function (result) {
                        console.log(result.bidCheck);

                        if(result.bidCheck){
                            $("#bidResult").text("입찰에 성공하였습니다.");
                        }else{
                            $("#bidResult").text("입찰에 실패하였습니다.");
                        }
                    },
                    error : function (error) {

                        console.log("error", error);

                    },

                });

            });

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
                    alert(e.message);
                } finally {
                }

                return obj;
            };

        });

    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <div id="wrapper">
        <section id="pInfo">
            <div id="pImgDiv">
                <table id="pImgTable">
                 
                    <caption>카테고리 > ${product.categoryName}</caption>

                    <tr>
                        <td colspan="3">
                            <img id="focusedImg" src="../../../resources/images/testCat.png" alt="">
                        </td>
                    </tr>
                    <tr>
                        <td><img class="pImg" src="../../../resources/images/testCat.png" alt=""></td>
                        <td><img class="pImg" src="../../../resources/images/testCat.png" alt=""></td>
                        <td><img class="pImg" src="../../../resources/images/testCat.png" alt=""></td>
                    </tr>
                </table>
            </div>
            <div id="infoDiv">
                <table id="infoTable">
                    <tr>
                        <th>판매자 닉네임</th>
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
                        <td>2000원</td>
                    </tr>
                    <tr>
                        <th>입찰 금액</th>
                        <td id="bidTd">
                            <button id="upBtn" type="button" onclick='changeBid("up")'>
                                <i class="fas fa-chevron-circle-up" ></i>
                            </button>
                            <input type="text" id="bidPrice" name="bidPrice" value="${product.bidIncrement}">원
                            <button id="downBtn" type="button" onclick='changeBid("down")'>
                                <i class="fas fa-chevron-circle-down" ></i>
                            </button>

                            <form id="bidForm" action="#">
                                <input hidden id="bidPriceForBid" name="bidPrice" value=""/>
                                <input hidden id="productIdForBid" name="pId" value="${product.PId}"/>
                                <input hidden id="userIdForBid" name="userId" value="${sessionScope.__AUTH_ANTIQUE__.userId}"/>
                            </form>
                            <button type="button" id="bidBtn">입찰</button>
                            <p id="bidResult"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>남은 시간</th>
                        <td>
                            <div class="leftTimeTimer">${product.leftTime}</div>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" id="bidHistBtn">입찰 목록</button>
                        </td>
                    </tr>
                </table>
            </div>
        </section>

        <section id="additionalInfo">
            <table id="additionalInfoTable">
                <tr>
                    <th><a href="#">상품 설명</a></th>
                    <th><a href="#">판매자 이전 리뷰</a></th>
                    <th><a href="#">문의사항</a></th>
                </tr>
                <tr id="infoDetail">
                    <td id="contentBox" colspan="3">${product.content}</td> <!-- ajax로 정보 받아와서 띄워주기 -->
                </tr>
            </table>
        </section>

    </div>



    <script>
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
    </script>

</body>
</html>