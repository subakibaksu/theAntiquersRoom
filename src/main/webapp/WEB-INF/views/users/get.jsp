<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get.jsp</title>


<style>
	#listBtn {
		cursor: pointer;
	}
</style>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

<script>

	$(function () {
		console.clear();
		console.log('jquery started....')


		// MODIFY 버튼에 대한 통작
		$('#modifyBtn').click(function name(params) {
			console.log('click event triggered..')
			self.location='/users/modify?userId=${user.userId}';

		}); //onclick 

		
		// LIST 버튼에 대한 통작
		// $('#listBtn').on('click, function () {
		$('#listBtn').click(function name(params) {
				console.log('click event triggered..')
				self.location='/users/getUserList';

		}); //onclick
			

	}); // .jq


</script>


</head>
<body>

		<h1>/WEB-INF/views/board/get.jsp</h1>
		
		<hr>
		
		
		<div id="wrapper">

			<!-- 게시판에 신규 게시물을 등록하는 양식 -->
			<form action="#"> <!--  #: 어디에든 보내지않겠다 -->

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
					<td colspan="2">
						<button type="button" id="modifyBtn">MODIFY</button>
						<button type="button" id="listBtn">LIST</button>
					</td>
				</tr>

			</table>


			</form>
		</div>		

</body>
</html>
		