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
    
    <script>
        // main_item prev/next Btn
        function prev(name){
            document.getElementById(name).scrollLeft -= 160;
        }

        function next(name){
            document.getElementById(name).scrollLeft += 160;
        }
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
                    <li class="main_item newItem">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명1</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명2</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명3</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명4</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명5</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명6</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명7</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명8</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명9</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명10</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
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
                    <li class="main_item endingItem">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명1</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명2</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명3</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명4</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명5</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명6</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명7</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명8</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명9</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
                    <li class="main_item">
                        <div class="main_item_img">
                            <img src="resources/images/testCat.png" alt="">
                        </div>
                        <div class="main_item_description">
                            <span>상품명10</span>
                            <span>시작가</span>
                            <span>현재가</span>
                            <span>남은시간</span>
                        </div>
                    </li>
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