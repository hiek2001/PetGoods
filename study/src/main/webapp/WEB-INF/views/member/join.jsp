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
<link rel="stylesheet" href="${path}/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
// 회원가입 창 예외처리
$(function(){
	if($("#user_id").val() == ""){
		alert("아이디를 입력해주세요");
		$("#user_id").focus();
		return false;
	}
	if($("#user_pw").val() == ""){
		alert("비밀번호를 입력해주세요");
		$("#user_pw").focus();
		return false;
	}
	if($("#user_name").val() == ""){
		alert("이름을 입력해주세요");
		$("#user_name").focus();
		return false;
	}
	if($("#user_birth").val() == ""){
		alert("생년월일을 입력해주세요");
		$("#user_birth").focus();
		return false;
	}
	if($("#user_mail").val() == ""){
		alert("메일을 입력해주세요");
		$("#user_mail").focus();
		return false;
	}
	if($("#user_addr").val() == ""){
		alert("주소를 입력해주세요");
		$("#user_addr").focus();
		return false;
	}
});
</script>

</head>
<body>
<div class="wrapper">
	<form action="${path}/member/insertMember.do" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input id="user_id" name="userId" class="id_input">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input id="user_pw" name="userPw" class="pw_input">
				</div>
			</div>
			<!-- <div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			</div>  -->
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input id="user_name" name="userName" class="user_input">
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_birth">생년월일</div>
				<div class="user_input_box">
					<input id="user_birth" class="user_input" name="userBirth" placeholder="ex) 2000-12-25">
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input id="user_mail" class="mail_input" name="userMail" placeholder="ex) xxx123@gmail">
				</div>
				<!-- <div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
				<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div> 
					<div class="clearfix"></div>
				</div> -->
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<!-- <div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1">
					</div>
					<div class="address_button">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>  -->
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input id="user_addr" class="address_input_2" name="userAddr" placeholder="ex) xx시  xx구">
					</div>
				</div>
				<!-- <div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3">
					</div>
				</div>  -->
			</div>
			<div class="join_button_wrap">
				<input id="submit" type="submit" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>
	</body>
</html>