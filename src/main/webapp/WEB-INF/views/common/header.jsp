<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Header</title>
		
		<style type="text/css">
		
		* {
    text-decoration: none;
}

.logo {
    color: tomato;
    /* font-size:36px; */
}

#header_container {
    margin: 0 15%;
    margin-top: 5%;
}

#logoimg {
    float: left;
}

#header_right {
    float: right;
}

#header_logo {
    width: 50%;
}

.menu_btn {
    float: right;
}

#login_btn {
    font-size: 16px;

}

#signin_btn {
    border: 1px;
    border-color: #c2b1b1;
    border-radius: 5px;
    background-color: #fff;
    font-size: 16px;
}

.menu {
    display: inline;
    font-size: 18px;
    width: 66px;
    height: 31px;
    margin-left: 5%;
}

.base {
    margin: 60px 18% 0 18%;
}
		
		</style>

		<link rel="stylesheet"
			href="/WEB-INF/style/header/header.css">
	</head>

	<body>
		<!-- header -->
		<header>
			<div id="header_container">

				<!-- 로그인버튼 -->
				<div class="menu_btn">
					<input type="button" id="login_btn" value="Log in" />
				</div>

				<!-- 회원가입버튼-->
				<div class="menu_btn">
					<input type="button" id="signin_btn" value="Sign in" />
				</div>

				<!-- 사이트 로고-->
				<div id="header_logo" role="banner">
					<h2 class="logo_default">
						<a href="#">
							<img id="logoimg"
								src="https://raw.githubusercontent.com/subakibaksu/RequestMapping_HappyPath_Admin/master/logoImg.png"
								alt="image not found" width="40" height="60">
							<div class="logo">The</div>
							<div class="logo">Antiquer's Room</div>
						</a>
					</h2>
				</div>
				<!--우측 로그인,회원가입버튼-->
				<div id="header_right">
					<input id="search_bar" type="text" maxlength="100" placeholder="검색어를 입력해주세요.">
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