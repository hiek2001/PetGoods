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
		// 웹 소켓으로 메시지를 보냄
		websocket.send($("#message").val());
	}
	
	// 소켓에서 정보를 수신했을 때 실행됨
	function onMessage(evt) {
		var data = evt.data;
		console.log(data);
	}
	
	function onClose(evt) {
		websocket.close
		console.log("연결 끊김");
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
			 <div id="modal_close" class="modal_close"><a href="#">close</a></div>
			  <div>
			     <div class="row">
			     	<div class="col">
			     		<div class="portlet-title">
			     			<h4>상담원에게 질문하기</h4>
			     		</div>
			     		<div class="clearfix"></div>
			     	</div>
			     </div>
			     <!-- 채팅 메세지 나오는 부분 -->
			     <div class="chatMiddle">
			     	<ul>
			     		<!-- 동적 생성 -->
			     		<div class="hr-sect">08월 10일</div>
			     		<li class="mar-btm">
    							<div class="media-body pad-hor">
    								<div class="speech">
    									<p class="media-heading"> ${member.userName}님</p>
    									<p>구매내역은 어디서 확인해야 하나요?</p>
    									<p class="speech-time">
    										<i class="fa fa-clock-o fa-fw"></i> 09:32
    									</p>
    								</div>
    							</div>
    						</li>
    						<li class="mar-btm">
    							<div class="media-body pad-hor speech-right">
    								<div class="speech">
    									<p class="media-heading">관리자</p>
    									<p>마이페이지에서 확인하시면 됩니다.</p>
    									<p class="speech-time">
    										<i class="fa fa-clock-o fa-fw"></i> 09:35
    									</p>
    								</div>
    							</div>
    						</li>
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

</body>
</html>