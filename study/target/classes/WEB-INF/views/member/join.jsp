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
		var id = $('#user_id').val();
		$.ajax({
			//url : '${path}/member/idCheck.do?userId='+id,
			url : '${path}/member/idCheck.do',
			data : id,			// 서버에 요청시 보낼 파라미터 기입
			type : 'POST',
			contentType : "application/json; charset=UTF-8", // 내가 서버로 보내는 데이터 타입 / dataType : 서버로부터 내가 받는 데이터의 타입
			success : function(data, result) {
				console.log(data);
				console.log(result);
				if(data == 1) {
					// 1 : 아이디가 중복되는 문구
				//	$("#id_check").text("사용중인 아이디입니다 :D");
				//	$("#id_check").css("color", "red");
				//	$("#submit").attr("disabled", true);
				console.log('아이디 있음');
				alert('중복된 아이디가 존재합니다.');
				} else {
					console.log("아이디 없음");
					alert('사용할 수 있는 아이디입니다.');
				}
			}, error : function(error) {
				console.log(error);
			}
		});
	}); 	
});


// 회원가입 ajax
//$(document).ready(function(){
//	$('#join_submit').submit(function(){
//		var id = $('#user_id').val();
//		var pw = $('#user_pw').val();
//		var name = $('#user_name').val();
//		var birth = $('#user_birth').val();
//		var mail = $('#user_mail').val();
//		var addr = $('#user_addr').val();
//		
//		console.log(id);
//		console.log(pw);
//		console.log(name);
//		console.log(birth);
//		console.log(mail);
//		console.log(addr);
//		// 01 입력이 다 되었나 확인
//		// !변수이름 : 입력되지 않았을 때 실행할 행동
//		if(!id) {
//			alert('아이디를 입력하세요.')
//			document.getElementById('user_id').focus(); 
//			return;
//		}
//		if(!pw) {
//			alert('비밀번호를 입력하세요.')
//			document.getElementById('user_pw').focus(); 
//			return;
//		}
//		if(!name) {
//			alert('이름을 입력하세요.')
//			document.getElementById('user_name').focus(); 
//			return;
//		}
//		if(!birth) {
//			alert('생년월일을 입력하세요.')
//			document.getElementById('user_birth').focus(); 
//			return;
//		}
//		if(!mail) {
//			alert('이메일을 입력하세요.')
//			document.getElementById('user_mail').focus(); 
//			return;
//		}
//		if(!addr) {
//			alert('주소를 입력하세요.')
//			document.getElementById('user_addr').focus(); 
//			return;
//		}
//		return false;
//	}
//});
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
					<input id="user_id" name="userId" class="id_input">
				</div>
				<button id="duplicate_check" type="button">중복체크</button>
				<!-- <span class="id_input_re_1">사용 가능한 아이디입니다 :D</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다 :)</span>  -->
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
				<input id="join_submit" type="submit" class="join_button" value="가입하기"> 
			</div>
		</div>
	</form>
</div>
</body>
</html>