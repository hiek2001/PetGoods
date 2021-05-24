<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/member/login.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js" charset="utf-8"></script>
</head>
<script type="text/javascript">
$(function() {
	$("#login_submit").click(function() {
	
	var userId = $("#user_id").val();
	var userPw = $("#user_pw").val();
	console.log(userId);
	if(userId == ''){
		alert("아이디를 입력하세요 :D");
		$("#user_id").focus();
	} else if (userPw == '') {
		alert("비밀번호를 입력하세요 :D");
		$("#user_pw").focus();
	} else {
		$.ajax({
				url : "${path}/member/loginCheck.do",
				data : "userId"+userId+"userPw"+userPw,
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if(data == 1) {
						alert("로그인되었습니다 :D");
						//window.location.href='/index.jsp';
					}
				}, error : function(error) {
					console.log(error);
				}
			});
		}
	});
});
</script>
<body>
	<div class="wrapper">
		<div class="wrap">
				<div class="subjecet">
					<span>로그인</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input id="user_id" name="userId" class="id_input">
					</div>
					<span id="id_msg"></span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input id="user_pw" name="userPw" class="pw_input" type="password">
					</div>
					<span id="pw_msg"></span>
				</div>
				<div class="login_button_wrap">
					<button id="login_submit" class="login_button">로그인하기</button>
				</div>
			</div>
	</div>

</body>
</html>