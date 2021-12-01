<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>registerReview</title>

	<link rel="stylesheet" href="/resources/css/registerReview.css">

</head>

<body>

    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    </header>
	
	<div id="regReviewWrapper">
		<p id="topsubject">리뷰작성</p>

		<form action="/board/registerReview" method="post">

			<div id="registerReviewContainer">
				<!-- 리뷰작성칸 -->
				<div id="reviewBox">

					<div id="productContainer">
						<div id="imgsection">
							<img id="productimg" alt="" src="${product.imageUrl}" />
						</div>
						<div class="infoContainer">
							<div class="info">상품명 : <input type="text" value="${product.name}" readonly="readonly"></div>
							<div class="info">시작가 : <input type="text" value="${product.startedAt}" readonly="readonly"></div>
							<div class="info">낙찰가 : <input type="text" value="${product.currPrice}" readonly="readonly"></div>
							<div class="info">낙찰자 : <input type="text" name="nickName" value="${sessionScope.__AUTH_ANTIQUE__.nickName}" readonly="readonly"></div>
							<div><input type="text" name="pid" value="${product.pid}" hidden="hidden"></div>
							<div><input type="text" name="sellerId" value="${product.userId}" hidden="hidden"></div>
						</div>
					</div>

					<div id="reviewContainer">
						<div id="rating">
							<div id="ratingName">별점 : </div>
						    <select id="starRate" name="score">
						      <option value="1">★☆☆☆☆</option>
						      <option value="2">★★☆☆☆</option>
						      <option value="3">★★★☆☆</option>
						      <option value="4">★★★★☆</option>
						      <option value="5" selected="selected">★★★★★</option>
						    </select>
						</div>
						<div id="reviewArea">
							<textarea name="content" cols="30" rows="18" placeholder="리뷰를 작성해주세요."></textarea>
						</div>
					</div>

					<!-- 버튼 -->
					<div id="btns">
						<button type="submit" onclick="back()" class="reviewbtn">리뷰작성</button>
						<button type="button" onclick="back()" class="reviewbtn">작성취소</button>
					</div>
				</div>
			</div>

		</form>
	</div>
	
	<footer id="footerBox">
        <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </footer>
	
	<script>
		function back() {
			history.go(-1)
		}
	</script>

</body>

</html>
