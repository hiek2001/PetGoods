<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/css/mypage.chat.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
// 1:1 상담 -> 모달창 띄우기
window.onload = function() {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};

	// 웹 소켓
	let websocket;
	// 1:1 상담 버튼을 눌렀을 때 호출되는 함수
	function openSocket() {
		// 채팅방의 메시지 목록 불러오기
		$.ajax({
			url: "/messageList.do",
			data: {
				userEmail: "${member.userEmail}"
			},
			async: false,
			dataType: "json",
			success:function(data) {
				console.log("성공적으로 목록 불러옴!!");
				$('div.chatMiddle ul').append("");
				$.each(data, function(index, item){
					console.log(index+":"+item.userEmail);
					console.log(item);
					CheckLR(index,item);
					$("div.chatMiddle").scrollTop($("div.chatMiddle")[0].scrollHeight);
				});
			},
			error:function(request, status, error) {
				console.log(request.status);
				console.log(request.reponseText);
				console.log(error);
			}
		});
		// 아래 function에서 websocket 변수를 쓰기 위함.
		var wsUri ="ws://localhost:8083/websocket/websocket";
		websocket = new WebSocket(wsUri);
		
		// 웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
		// websocket 서버에서 메시지를 보내면 자동으로 실행된다.
		websocket.onmessage = onMessage;
	}
	
	$(function(){
		$("#sendBtn").click(function(){
			console.log('send message...');
			sendMessage();
		});	
		
		$("#modal_close").click(function(){
			console.log('close click...');
			onClose();
		});
	});
	
	// 메시지 전송
	function sendMessage() {
		var message = $("#message").val();
		const data = {
			"userEmail" : "${member.userEmail}",
			"userName" : "${member.userName}",
			"message" : message
		};
		
		//CheckLR(data);
		let jsonData = JSON.stringify(data);
		// 웹 소켓으로 메시지를 보냄
		websocket.send(jsonData);
		// message 입력 창 지우기
		$("#message").val('');
		
	}
	
	let idx = 999;
	// 메시지 받으면 발동
	function onMessage(evt) {
		var data = JSON.parse(evt.data);
		idx = idx-1; 
		console.log("function onMessage::"+"idx::"+idx+"::"+data.userEmail);
		CheckLR(idx, data);
	}
	
	function onClose(evt) {
		websocket.close
		console.log("연결 끊김");
	}
	
	// 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
	function CheckLR(index,item) {
		// email이 loginSession의 email과 다르면 왼쪽, 같으면 오른쪽
		console.log("CheckLR::"+index+":::"+item.userEmail);
		const LR = (item.userEmail != "${member.userEmail}") ? "speech-right" : "speech-left";
	
		console.log(index+":::"+LR);
		// 메세지 추가
		appendMessageTag(LR, index, item);
		
	}
	
	// 메세지 태그 append
	function appendMessageTag(LR, index, item) {
		var userName = " ";
		console.log(item);
		if("${member.userEmail}" != item.userEmail)
			userName = item.userName;
		else
			userName = "${member.userName}";
		
		console.log(userName);
		var now = new Date();
		var nowTime = now.getFullYear();
		nowTime += '-' + (now.getMonth() + 1);
		nowTime += '-' + now.getDate();
		nowTime += ' ' + now.getHours();
		nowTime += ':' + now.getMinutes();
		nowTime += ':' + now.getSeconds();

		var html ='';
		html += '<li class="mar-btm"><div class="media-body pad-hor" id=div_'+index+'><div class="speech">';
		html += '<p class="media-heading">' + userName + '</p>';
		html += '<p>' + item.message + '</p>';
		if(typeof item.chatDate == "undefined") {
			html += '<p class="speech-time"><i class="fa fa-clock-o fa-fw"></i>' + nowTime + '</p>';
		}
		else {
			html += '<p class="speech-time"><i class="fa fa-clock-o fa-fw"></i>' + item.chatDate + '</p>';
		}
		html += '</div></div></li>';
		$('div.chatMiddle ul').append(html);
		$('#div_'+index).addClass(LR);
	}
</script>
<div>
	<div style="position:relative;">
		<img style="width: 100%;" src="${path}/resources/img/mypage/mypage_2.jpg">
	</div>
</div>
<div class="container">
	<!-- Menu -->
	<div class="row">
		<div id="chatIcon" class="big-btn col-6 col-md-3">
			<p id="modal_btn" onclick="openSocket();">1:1 상담</p>
		</div>
		<div class="big-btn col-6 col-md-3">
			<p>구매내역</p>
		</div>
		<div class="big-btn col-6 col-md-3">
			<p>장바구니</p>
		</div>
	</div>
 	<!-- 채팅창 -->
 	<div class="black_bg"></div>
		<div class="modal_wrap">
			 <div id="modal_close" class="modal_close"><a href="">close</a></div>
			  <div>
			     <div class="row">
			     	<div class="col">
			     	<c:choose>
			     	  <c:when test="${member.userEmail != 'admin@naver.com'}">
			     		<div class="portlet-title">
			     			<h4>상담원에게 질문하기</h4>
			     		</div>
			     	  </c:when>
			     	  <c:otherwise>
			     		<div class="portlet-title">
			     			<h4>회원 상담창</h4>
			     		</div>
			     	  </c:otherwise>
			     	</c:choose>
			     		<div class="clearfix"></div>
			     	</div>
			     </div>
			     <!-- 채팅 메세지 나오는 부분 -->
			     <div class="chatMiddle" style="overflow: auto; display:flex; flex-direction:column-reverse;">
			     	<ul>
			     		<!-- 동적 생성 -->
			     	  </ul>
			     </div>
			     <div class="portlet-footer">
                        <div class="row" style="height:90px;">
                            <div class="col-xs-10">
                                <textarea style="margin-left: 20px; height: 80px; width: 600px; resize:none;" id="message" name="message" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>
                            </div>
                            <div class="col-xs-2">
                                <button style="font-weight: 400;" type="button" class="btn btn-default" id="sendBtn">Send</button>
                            </div>
                        </div>
                       </div>
                  </div>
			  </div>
		<div>
	</div>
</div>

</body>
</html>