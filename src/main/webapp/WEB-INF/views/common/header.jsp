<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>The Antiquer's Room</title>

	<link rel="stylesheet" href="../../../resources/css/header.css">

	<!-- google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Merriweather&family=Nanum+Gothic&display=swap" rel="stylesheet">

	<!-- jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script>
		$(function(){
			$('#login_btn').click(function(){
				console.log('loginBtn click event triggered..');

				self.location='/login';
			}); //login_onclick

			$('#logout_btn').click(function(){
				console.log('click event triggered..');

				self.location='/users/logout';
			}); //logout_onclick
		}); //.jq

	</script>
</head>

<body>
	<!-- header -->
	<header id="header_container">
		<div id="logoNsearch">
			<!-- 사이트 로고-->
			<div id="header_logo" role="banner">
				<a href="/">
					<img id="logoimg" src="/resources/images/logo6.png" alt="" width="40" height="55">
					<div class="logo">The</div>
					<div class="logo">Antiquer's Room</div>
				</a>
			</div>
			<!-- rightside of header -->
			<div>
				<div id="loginNout">
					<c:choose>
						<c:when test="${sessionScope.__AUTH_ANTIQUE__.userId eq null}">
							<!-- 로그인 버튼 -->
							<div class="menu_btn">
								<div id="login_btn" >Log in</div>
							</div>

							<!-- 회원가입버튼-->
							<div class="menu_btn" id="signin_btn">
								<a href="/register" >Sign up</a>
							</div>
						</c:when>

						<c:otherwise>
							<!-- 로그아웃 버튼 -->
							<div class="menu_btn">
								<div id="logout_btn" >Log out</div>
							</div>

							<!-- 마이페이지버튼-->
							<div class="menu_btn" id="mypage_btn">
								<a href="/users/mypage" >MyPage</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div id="header_right">
					<form action="/product/productList" method="get">
						<input id="search_bar" type="text" maxlength="100" name="searchQuery" placeholder="검색어를 입력해주세요." required>
						<button class="findIcon" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>

		<!-- navbar -->
		<nav>
			<div id="navbar">
				<ul class="base">
					<li class="menu"><a href="/product/productList?category_id=0">의자</a> </li>
					<li class="menu"><a href="/product/productList?category_id=1">테이블</a> </li>
					<li class="menu"><a href="/product/productList?category_id=2">수납장</a> </li>
					<li class="menu"><a href="/product/productList?category_id=3">침대</a> </li>
					<li class="menu"><a href="/product/productList?category_id=4">옷장</a> </li>
					<li class="menu"><a href="/product/productList?category_id=5">소파</a> </li>
					<li class="menu"><a href="/product/productList?category_id=6">기타</a> </li>
				</ul>
			</div>


		</nav>

</body>

</html>
