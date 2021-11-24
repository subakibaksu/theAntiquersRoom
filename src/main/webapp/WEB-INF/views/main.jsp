<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main.jsp</title>

    <link rel="stylesheet" href="resources/css/main.css">

    <!-- fontawsome -->
    <script src="https://kit.fontawesome.com/91815d1378.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <link rel="stylesheet" href="/resources/css/main.css">

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
                <img src="https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg" alt="">
            </div>
            <div class="mainSlides fade">
                <img src="https://static.independent.co.uk/2021/06/16/08/newFile-4.jpg?width=982&height=726&auto=webp&quality=75" alt="">
            </div>
            <div class="mainSlides fade">
                <img src="https://www.sciencealert.com/images/2020-10/processed/happycat_1024.jpg" alt="">
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
                        <a href="/product/getDetail?pId=${newProduct.PId}">
                        <li class="main_item newItem">
                            <div class="main_item_img">
                                <img src="${newProduct.imageUrl}" alt="">
                            </div>
                            <div class="main_item_description">
                                <span>상품명 : ${newProduct.name}</span>
                                <span>시작가 : ${newProduct.startedPrice}</span>
                                <c:choose>
                                    <c:when test="${empty newProduct.maxBid}">
                                        <p>입찰내역이 없습니다.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>현재가 : ${newProduct.maxBid}</p>
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
                        <a href="/product/getDetail?pId=${newProduct.PId}">
                        <li class="main_item endingItem">
                            <div class="main_item_img">
                                <img src="${endingProduct.imageUrl}" alt="">
                            </div>
                            <div class="main_item_description">
                                <span>상품명 : ${endingProduct.name}</span>
                                <span>시작가 : ${endingProduct.startedPrice}</span>
                                <span>
                                    <c:choose>
                                        <c:when test="${empty endingProduct.maxBid}">
                                            <p>입찰내역이 없습니다.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>현재가 : ${endingProduct.maxBid}</p>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span>남은시간 : <p hidden class="leftTimeTimer">${newProduct.leftTime}</p></span>
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