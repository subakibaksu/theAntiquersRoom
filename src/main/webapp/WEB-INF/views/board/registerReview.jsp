<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>registerReview</title>

	<link rel="stylesheet" href="/resources/css/registerReview.css">
	
	<script>
		$()
	</script>
	
</head>

<body>
	<div>
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	</div>

	<div>
		<p id="topsubject">리뷰작성</p>

		<form action="/board/registerReview">

			<div id="registerReviewContainer">
				<!-- 리뷰작성칸 -->
				<div id="reviewBox">
					<div id="productContainer">
						<div id="imgsection">
							<img id="productimg" alt="default thumbnail img from productList"
								src="/resources/images/charlie.jpeg">
						</div>
						<div class="infoContainer">
							<p class="info">상품 : 아크릴의자</p>
							<p class="info">시작가격 : 500,000</p>
							<p class="info">낙찰가 : 575,000</p>
							<p class="info">낙찰자 : GamdongHeeJo</p>
						</div>
					</div>

					<div id="reviewContainer">
						<div id="rating">
							<div id="ratingName">별점 : </div>
						    <select id="starRate" name="rating">
						      <option>★☆☆☆☆</option>
						      <option>★★☆☆☆</option>
						      <option>★★★☆☆</option>
						      <option>★★★★☆</option>
						      <option selected="selected">★★★★★</option>
						    </select>
						</div>
						<div id="reviewArea">
							<textarea name="content" cols="30" rows="18" placeholder="리뷰를 작성해주세요."></textarea>
						</div>
					</div>

					<!-- 버튼 -->
					<div id="btns">
						<button class="reviewbtn">리뷰작성</button>
						<button class="reviewbtn">작성취소</button>
					</div>
				</div>
			</div>

		</form>

	</div>

	<%-- <div>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</div> --%>
</body>

</html>