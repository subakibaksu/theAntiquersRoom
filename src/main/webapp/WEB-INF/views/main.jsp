<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main.jsp</title>

    <link rel="stylesheet" href="/resources/css/main.css">

    <!-- fontawsome -->
    <script src="https://kit.fontawesome.com/91815d1378.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        // main_item prev/next Btn
        function prev(name){
            document.getElementById(name).scrollLeft -= 160;
        }

        function next(name){
            document.getElementById(name).scrollLeft += 160;
        }

        $(document).ready(function (){
            var timearr = [];

            $(".leftTimeTimer").each(function (){
                var time = $(this).text();
                var timeSecond = Number(time);
                timearr.push(timeSecond);
            });

            setInterval(function (){

                $(".leftTimeTimer").fadeIn();
                var count = 0;

                $(".leftTimeTimer").each(function (){

                    console.log("hi");
                    timearr[count] = timearr[count]-1
                    $(this).text(convertSeconds(timearr[count]));
                    count++;
                });
                count = 0;
            },1000);


            function convertSeconds(s){
                if(s<0){
                    return '경매가 종료되었습니다';

                }else {
                    var day = Math.floor(s / (60*60*24));
                    var hour = Math.floor(s /(60*24))%24;
                    var min = Math.floor(s / 60 )%60;
                    var sec = s % 60;
                    return day + '일' + hour + '시간' +  min + '분' + sec + '초';
                }
            }
        });
    </script>

</head>
<body>

    <header>
        <jsp:include page="common/header.jsp"></jsp:include>
    </header>

    <div id="mainWrapper">
        <section id="mainBanner">
            <!-- banner imgs -->
            <div class="mainSlides fade">
                <img src="https://pixabay.com/get/ge0615514da69482f6c29c0118bf0bf178d1ee5758bf731755d7e5566af360ae0e6de4d03d91ab86711474b0a48609dc493d14176627351743da5f2d742c82394849358d2cddb40873f178a6ee614854f_1920.jpg" alt="">
            </div>
            <div class="mainSlides fade">
                <!-- <img src="https://pixabay.com/get/g42532307632e38d7a75d94fe718cf2647c4c3de915f31a4326739705fb0d742735b927ccd94d5bbcbadd98a74fb49a9b35f6715b9abe6aa476355a41931f36aea4dc97a08632b315eaec2047b5d39625_1920.jpg" alt=""> -->
                <img src="https://pixabay.com/get/g5b84470dc579370bad9dc4a3addfcdead211ee12c4a182316793fbf134bcc42f78ad5089276cffa94f2285c256d21d6e338a37c56d6d872ff56c65911dd28c7f088d85acfbab81bf23864eeb96837c85_1920.jpg" alt="">
            </div>
            <div class="mainSlides fade">
                <img src="https://pixabay.com/get/gf9c986166164a5bd20cf65076140767cc5b5ccfb831d4fa672b6e40ed09931e6e6e466a67ae333a1f1385dfa6e1b33f41ef8ba4fb508d53e0dd55b111dcc5a3cda64fc28edb10cbcd5338aa171f91c37_1920.jpg" alt="">
            </div>
            <!-- prev/next arrow -->
            <button class="prev">
                <i class="fas fa-chevron-left" onclick="plusSlides(-1)"></i>
            </button>
            <button class="next">
                <i class="fas fa-chevron-right" onclick="plusSlides(1)"></i>
            </button>
            <!-- bottom dots -->
            <div class="dotBox">
                <i class="dot fas fa-circle" onclick="currentSlide(1)"></i>
                <i class="dot fas fa-circle" onclick="currentSlide(2)"></i>
                <i class="dot fas fa-circle" onclick="currentSlide(3)"></i>
            </div>
        </section>

        <section id="newProduct">

            <div class="main_items_header">
                <h2>새로 들어온 경매</h2>
                <div>
                    <button class="prevBtn newPrev" onclick="prev('newItems')">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <button class="nextBtn newNext" onclick="next('newItems')">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>

            <div>
                <ul class="main_ul" id="newItems">
                    <c:forEach var="newProduct" items="${newProductList}">
                        <a href="/product/getDetail?pid=${newProduct.pid}">
                        <li class="main_item newItem">
                            <div class="main_item_img">
                                <img src="${newProduct.imageUrl}" alt="">
                            </div>
                            <div class="main_item_description">
                                <span>상품명 : ${newProduct.name}</span>
                                <span>시작가 : ${newProduct.startedPrice}</span>
                                <c:choose>
                                    <c:when test="${empty newProduct.currPrice}">
                                        <p>입찰내역이 없습니다.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>현재가 : ${newProduct.currPrice}</p>
                                    </c:otherwise>
                                </c:choose>
                                <span>남은시간 : <p hidden class="leftTimeTimer">${newProduct.leftTime}</p></span>
                            </div>
                        </li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
        </section>


        <section id="endingProduct">
            <div class="main_items_header">
                <h2>마감 임박 상품</h2>
                <div>
                    <button class="prevBtn endingPrev" onclick="prev('endingItems')">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <button class="nextBtn endingNext" onclick="next('endingItems')">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>

            <div>
                <ul class="main_ul" id="endingItems">
                    <c:forEach var="endingProduct" items="${endingProductList}">
                        <a href="/product/getDetail?pid=${endingProduct.pid}">
                        <li class="main_item endingItem">
                            <div class="main_item_img">
                                <img src="${endingProduct.imageUrl}" alt="">
                            </div>
                            <div class="main_item_description">
                                <span>상품명 : ${endingProduct.name}</span>
                                <span>시작가 : ${endingProduct.startedPrice}</span>
                                <span>
                                    <c:choose>
                                        <c:when test="${empty endingProduct.currPrice}">
                                            <p>입찰내역이 없습니다.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>현재가 : ${endingProduct.currPrice}</p>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span>남은시간 : <p hidden class="leftTimeTimer">${endingProduct.leftTime}</p></span>
                            </div>
                        </li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </div>

    <footer id="footerBox">
        <jsp:include page="common/footer.jsp"></jsp:include>
    </footer>


    <script src="resources/js/main.js"></script>

</body>
</html>
