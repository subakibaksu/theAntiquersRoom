<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>detail.jsp</title>
    
    <link rel="stylesheet" href="../../../resources/css/detail.css">

    <!-- fontAwdome for icons -->
    <script src="https://kit.fontawesome.com/91815d1378.js" crossorigin="anonymous"></script>
</head>
<body>

    <div id="wrapper">
        <section id="pInfo">
            <div id="pImgDiv">
                <table id="pImgTable">
                    <caption>카테고리 > 이게뭐냥</caption>
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
                        <td>냥냥냥</td>
                    </tr>
                    <tr>
                        <th>상품명</th>
                        <td>냥구냥구</td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>이게뭐냥</td>
                    </tr>
                    <tr>
                        <th>경매 시작 가격</th>
                        <td>1000원</td>
                    </tr>
                    <tr>
                        <th>현재 금액</th>
                        <td>2000원</td>
                    </tr>
                    <tr>
                        <th>입찰 금액</th>
                        <td id="bidTd">
                            <i id="upBtn" class="fas fa-chevron-circle-up"/>
                            <input type="text" id="bidPrice" name="bidPrice" value="50000원">
                            <i id="downBtn" class="fas fa-chevron-circle-down"/>
                            <button type="button" id="bidBtn">입찰</button>
                        </td>
                    </tr>
                    <tr>
                        <th>남은 시간</th>
                        <td>00시 00분 00초</td>
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
                    <td id="contentBox" colspan="3"></td> <!-- ajax로 정보 받아와서 띄워주기 -->
                </tr>
            </table>
        </section>

    </div>

</body>
</html>