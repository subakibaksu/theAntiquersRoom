<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify.jsp</title>

	<style>
		#listBtn,
		#modifyBtn{
			cursor: pointer;
		}
	</style>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

	<script>

	$(function(){
		console.clear();
		console.log('jquery started..');
		
		// REMOVE 버튼에 대한 통작
		$('#removeBtn').click(function name(params) {
			console.log('click event triggered..');

			// 현재 이 문서에 있는, form 태그를 얻어내서 , 
			// 우리 마음대로 조작하자!!!

			var formObj=$('form');

			formObj.attr('method', 'POST'); // 태그의 속성을 고치고 싶을땐 attr 을 쓴다.
			formObj.attr('action', '/users/remove');

			formObj.submit();

			// BOM(Browser Object Model) : winodw == self
			// self.location='/board/remove?bno=${board.bno}';  // 브라우저 주소창에 넣는 거기때문에 post (x), 무조건 get (o)

		}); //onclick

		// LIST 버튼에 대한 이벤트 등록 처리
		$('#listBtn').click(function(){
			console.log('click event triggered..');

			self.location='/users/getUserList';
		}); //onclick

}); // .jq
 
	</script>

</head>
<body>

	<h1>/WEB-INF/views/board/modify.jsp</h1>
	
	<hr>

	<div id="wrapper">
		<!-- 게시판에 기존 게시물을 변경할 수 있는 양식 -->
		<form action="/users/modify" method="post">


			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" value="${user.userId}" readonly></td>
				</tr>
					<tr>
					<td>비밀번호</td>
					<td><input type="text" name="password" value="${user.password}" ></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickName" value="${user.nickName}" ></td>
				</tr>
				<tr>
					<td>폰번호</td>
					<td><input type="text" name="phone" value="${user.phone}" ></td>
				</tr>
				<tr>
					<td>회원타입</td>
					<td><input type="text" name="userType" value="${user.userType}" ></td>
				</tr>


				<tr>
					<td colspan="2">
						<button type="submit" id="modifyBtn">SUBMIT</button>
						<button type="button" id="removeBtn">REMOVE</button>
						<button type="button" id="listBtn">LIST</button>
					</td>
				</tr>

			</table>

		</form>
	 </div>
	
</body>
</html>