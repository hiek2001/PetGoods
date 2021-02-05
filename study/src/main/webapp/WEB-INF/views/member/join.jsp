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
</head>
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복) : ajax
// .blur : 이벤트가 포커스를 잃었을 때 요소를 전달
//	$('.id_input').on("propertychange change keyup paste input", function() {
//		// jQuery 접근시 $("#id") / $(".class") 
//		// name으로 접근시 $(tag_name[name=name]) : $("input[name=search_value]")
//		var userid = $('.id_input').val();
//		$.ajax({
//			url : '${path}/member/idCheck.do?userId='+userid,
//			type : 'GET',
//			contentType : "application/json; charset=UTF-8",
//			success : function(data) {
//				console.log("1 = 중복o / 0 = 중복x : "+ data);
//				if(data == 1) {
//					// 1 : 아이디가 중복되는 문구
//					$("#id_check").text("사용중인 아이디입니다 :D");
//					$("#id_check").css("color", "red");
//					$("#submit").attr("disabled", true);
//				} 
//			}, error : function(error) {
//				console.log("error ::::" + error);
//			}
//		});
//	});
</script>
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
					<input id="user_id" name="userId" class="id_input" required>
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다 :D</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다 :)</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input id="user_pw" name="userPw" class="pw_input" required>
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
					<input id="user_name" name="userName" class="user_input" required>
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_birth">생년월일</div>
				<div class="user_input_box">
					<input id="user_birth" class="user_input" name="userBirth" placeholder="ex) 2000-12-25" required>
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input id="user_mail" class="mail_input" name="userMail" placeholder="ex) xxx123@gmail" requried>
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
						<input id="user_addr" class="address_input_2" name="userAddr" placeholder="ex) xx시  xx구" required>
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