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
                <div id="leftTime" hidden>${product.leftTime}</div>
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
                            <button type="button" id="bidBtn">입찰</button>
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
                    <th><a id="thisQnA" >문의사항</a></th>
                </tr>
                <tr id="infoDetail">
                    <td colspan="3">
                        <div id="contentBox">${product.content}</div>
                    </td> <!-- ajax로 정보 받아와서 띄워주기 -->
                </tr>
            </table>
        </section>

    </div>


    <!-- jQuery/script -->
    <script>
        $(function(){
            $('#productInfo').on("click", function(){
                $.ajax($('#contentBox').text('${product.content}'));
            }); //상품설명

            $('#sellerReview').on("click", function(){
                $.ajax({
                    url: "/board/review", //"/board/review?nickname=${product.nickname}"
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
                    url: "/board/QnA", //"/board/QnA?pId=${product.pId}"
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
    </script>

</body>
</html>