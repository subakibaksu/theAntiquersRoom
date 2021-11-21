<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Header</title>

	<link rel="stylesheet" href="../../../resources/css/header.css">
	
	<!-- google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
	
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
				<a href="#">
					<img id="logoimg" src="" alt="" width="40" height="60">
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
								<a href="/WEB-INF/views/users/register.jsp" >Sign in</a>
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
					<input id="search_bar" type="text" maxlength="100" placeholder="검색어를 입력해주세요.">
					<button class="findIcon" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- navbar -->
		<nav id="navbar">
			<ul>
				<li class="menu"><a href="#chair">의자</a> </li>
				<li class="menu"><a href="#desk">책상</a> </li>
				<li class="menu"><a href="cupboard">수납장</a> </li>
				<li class="menu"><a href="bed">침대</a> </li>
				<li class="menu"><a href="wardrobe">옷장</a> </li>
				<li class="menu"><a href="table">화장대</a> </li>
				<li class="menu"><a href="etc">기타</a> </li>
			</ul>
		</nav>
	</header>

</body>

</html>
