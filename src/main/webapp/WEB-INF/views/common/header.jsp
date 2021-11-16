<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Header</title>

		<link rel="stylesheet" href="../../../resources/css/header.css">
	</head>

	<body>
		<!-- header -->
		<header>
			<div id="header_container">

				<!-- 회원가입버튼-->
				<div class="menu_btn" id="signin_btn">
					<a href="/WEB-INF/views/users/register.jsp">Sign in</a>
				</div>

				<!-- 로그인버튼 -->
				<div class="menu_btn">
					<a href="/WEB-INF/views/users/login.jsp" id="login_btn">Log in</a>
				</div>

				<!-- 사이트 로고-->
				<div id="header_logo" role="banner">
					<h2 class="logo_default">
						<a href="#">
							<img id="logoimg" src="" alt="" width="40" height="60">
							<div class="logo">The</div>
							<div class="logo">Antiquer's Room</div>
						</a>
					</h2>
				</div>
				<!-- search-bar -->
				<div id="header_right">
					<input id="search_bar" type="text" maxlength="100" placeholder="검색어를 입력해주세요.">
					<button class="findIconLink" type="submit">
						<span class="findIcon">
							<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search"
								class="svg-inline--fa fa-search fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 512 512" style="width: 15px;">
								<path fill="currentColor"
									d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
								</path>
							</svg>
						</span>
					</button>
				</div>
			</div>
		</header>

		<!-- navbar -->
		<nav>
			<div id="navbar">
				<ul class="base">
					<li class="menu"><a href="#chair">의자</a> </li>
					<li class="menu"><a href="#desk">책상</a> </li>
					<li class="menu"><a href="cupboard">수납장</a> </li>
					<li class="menu"><a href="bed">침대</a> </li>
					<li class="menu"><a href="wardrobe">옷장</a> </li>
					<li class="menu"><a href="table">화장대</a> </li>
					<li class="menu"><a href="etc">기타</a> </li>
				</ul>
			</div>


		</nav>

	</body>

	</html>