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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js" charset="utf-8"></script>
</head>
<script type="text/javascript">

// 아이디 유효성 검사 : ajax
$(function() {
	$("#duplicate_check").click(function() {
		// jQuery 접근시 $("#id") / $(".class") 
		// name으로 접근시 $(tag_name[name=name]) : $("input[name=search_value]")	
		var userId = $("#user_id").val();
		
		if(userId == ''){
			$("#id_msg").text("아이디를 입력하세요 :P");
			$("#id_msg").css("color", "red");
			$("#user_id").focus();
		} else {
			$.ajax({
				//url : '${path}/member/idCheck.do?userId='+id,
				url : "${path}/member/idCheck.do",
				data : userId,			// 서버에 요청시 보낼 파라미터 기입
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8", // 내가 서버로 보내는 데이터 타입 / dataType : 서버로부터 내가 받는 데이터의 타입
				success : function(data) {
					console.log(data);
					if(data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_msg").text("사용중인 아이디입니다 :D");
						$("#id_msg").css("color", "red");
					console.log('아이디 있음');
					//alert('중복된 아이디가 존재합니다.');
					} else {
						// 2 : 사용중인 아이디가 없는 문구
						console.log("아이디 없음");
						$("#id_msg").text("사용할 수 있는 아이디입니다 :)");
						$("#id_msg").css("color", "green");
					//	alert('사용할 수 있는 아이디입니다.');
					}
				}, error : function(error) {
					console.log(error);
				}
			});
		}
	}); 
});
//회원가입 ajax
$(function() {
	$('#join_submit').click(function() {
		var id = $("#user_id").val();
		var pw = $('#user_pw').val();
		var name = $('#user_name').val();
		var birth = $('#user_birth').val();
		var mail = $('#user_mail').val();
		var addr = $('#user_addr').val();
		
		console.log(pw);
		console.log(name);
		console.log(birth);
		console.log(mail);
		console.log(addr);
		// 01 입력이 다 되었나 확인
		// !변수이름 : 입력되지 않았을 때 실행할 행동
		if(id == '') {
			$("#id_msg").text("아이디를 입력하세요 :P");
			$("#id_msg").css("color", "red");
			$("#user_id").focus();
			return;
		}
		if(pw == '') {
			$("#pw_msg").text("비밀번호를 입력하세요 :P");
			$("#pw_msg").css("color", "red");
			$("#user_pw").focus;
			return;
		}
		if(name == '') {
			$("#name_msg").text("이름을 입력하세요 :P");
			$("#name_msg").css("color", "red");
			$("#user_name").focus;
			return;
		}
		if(birth == '') {
			$("#birth_msg").css("color", "red");
			$("#user_birth").focus;
			return;
		}
		if(mail == '') {
			$("#mail_msg").css("color", "red");
			$("#user_mail").focus;
			return;
		}
		if(addr == '') {
			$("#addr_msg").css("color", "red");
			$("#user_addr").focus;
			return;
		}
		else {
			$.ajax({
				url : "${path}/member/insertMember.do",
				data : id, pw, name, birth, mail, addr,
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if(data == 1) {
						alert("회원가입이 완료되었습니다 :D");
						return "redirect:";
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
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input id="user_id" name="userId" class="id_input">
				</div>
				<button id="duplicate_check" type="button">중복체크</button>
				<span id="id_msg"></span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input id="user_pw" name="userPw" class="pw_input">
				</div>
				<span id="pw_msg"></span>
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
				<span id="name_msg"></span>
			</div>
			<div class="user_wrap">
				<div class="user_birth">생년월일</div>
				<div class="user_input_box">
					<input id="user_birth" class="user_input" name="userBirth">
				</div>
				<span id="birth_msg">ex) 2000-12-25 형식에 맞춰서 입력하세요</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input id="user_mail" class="mail_input" name="userMail">
				</div>
				<span id="mail_msg">ex) xxx123@gmail 형식에 맞춰서 입력하세요</span>
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
						<input id="user_addr" class="address_input_2" name="userAddr">
					</div>
					<span id="addr_msg">ex) xx시  xx구 형식에 맞춰서 입력하세요</span>
				</div>
				<!-- <div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3">
					</div>
				</div>  -->
			</div>
			<div class="join_button_wrap">
				<button id="join_submit" class="join_button">가입하기</button>
			</div>
		</div>
</div>
</body>
</html>