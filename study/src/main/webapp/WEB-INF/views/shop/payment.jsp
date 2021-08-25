<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/css/snackshop.payment.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/payment_addr.js" ></script> <!-- 다음 주소API js 링크 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- 다음 주소API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 결제API -->
<script type="text/javascript">
// 아임포트 API 호출
function requestPay(){
		//가맹점 식별코드
		IMP.init('imp87224101');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${snack.snackName}' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : '${member.userEmail}',
		    buyer_name : '${member.userName}'
		  //  buyer_tel : ${member.userPhone},
		  //  buyer_addr : '서울 강남구 도곡동',
		  //  buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			// 01 서버단에서 결제정보 조회를 위해 ajax로 imp_uid 전달
			$.ajax({
				type: "POST",
				url: "/verifyIamport"	
			}).done(function(data){
				console.log(data);
				
				//위의 rsp.paid_amount와 data.response.amout를 비교한 후 로직 실행 (import 서버 검증)
				//if(rsp.paid_amount == data.response.amount) 
				//	alert("결제 및 결제검증완료");
				//else
				//	alert("결제 실패");
			});
			// 02 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		   } else {
			    // 03 결제 되지 않음
		   	    var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		   }
		   // alert(msg);
		});
	}
</script>
<div class="container">
	<div class="row">
		<div class="col-md-12" style="height: 50px; width: auto; margin-top: 10px; font-family: 'Noto Sans KR';">
			<h4><strong>주문/결제</strong></h4>
		</div>
		<table class="table table-bordered" style="background-color: #FBFBFB; box-shadow: 3px 3px 3px 3px #E9E9EA;">
		  <thead>
		    <tr>
		      <th scope="col"></th>
		      <th scope="col">상품정보</th>
		      <th scope="col">배송비</th>
		      <th scope="col">수량</th>
		      <th scope="col">상품금액</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">
		      	<img style="height: 100px;" src="${path}/resources/img/snackshop/${snack.snackImg}">
		      </th>
		      <td>${snack.snackName}</td>
		      <td>3,000원</td>
		      <td>${skcount}</td>
		      <td><fmt:formatNumber value="${snack.price}" pattern="#,###원"/></td>
		    </tr>
		  </tbody>
		</table>
		<div class="col-md-9" style="background-color: #FBFBFB; height: 700px; width: auto;  box-shadow: 5px 5px 5px 5px #E9E9EA;">
			<div style="margin-top: 20px;">
				<h5><strong>배송지정보</strong></h5>
				<div class="form-group">
					<h3>
						<label for="orderName">이름</label>
					</h3>
					<span class="box">
						<input type="text" name="orderName" class="input-fm form-control" required>
					</span>
				</div>
				<div class="form-group">
					<h3>
						<label for="orderPhone">휴대전화</label>
					</h3>
					<span class="box">
						<input type="text" name="orderPhone" placeholder="전화번호 입력"  class="input-fm form-control" required>
					</span>
				</div>
				<div class="form-group">
					<h3>
						<label for="orderAddr">배송지</label>
					</h3>
					<div class="form-group">                   
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="Addr1" id="addr1" type="text" readonly="readonly" >
						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
					</div>
					<div class="form-group">
						<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="Addr2" id="addr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="상세주소" name="Addr3" id="addr3" type="text"  />
					</div>
				</div>
				<div>
					<h3>
						<label for="orderNote">요청사항</label>
					</h3>
					<div class="input-fm input-group">
						<select class="custom-select">
							<option>요청사항을 선택하세요</option>
							<option value="문 앞에 두고 가세요">문 앞에 두고 가세요</option>
							<option value="경비실에 맡겨 주세요">경비실에 맡겨 주세요</option>
							<option value="도착시 문자 남겨주세요">도착시 문자 남겨주세요</option>
						</select>
					</div>
				</div>
			</div>
			<div style="margin-top: 50px;">
				<h5><strong>결제수단</strong></h5>
				<div>
					<div>
						<button type="button" class="btn kgcard" onclick="requestPay();">KG이니시스</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3" style="height: 700px; width: auto; background-color: #F4F4F3;  box-shadow: 5px 5px 5px 5px #E9E9EA;">
			<div style="height:500px;"></div>
			<div>
				<h5><strong>결제상세</strong></h5>
				<div>
					<span class="font-weight">주문금액</span>
					<span class="font-weight gap"><!--<fmt:formatNumber value="${snack.price*skcount+3000}" pattern="#,###원"/>--> 100</span>
				</div>
				<div style="margin-top: 5px;">
					<span class="fa fa-angle-right">상품금액</span>
					<span class="gap fa fa-plus"><fmt:formatNumber value="${snack.price*skcount}" pattern="#,###원"/></span>
				</div>
				<div>
					<span class="fa fa-angle-right">배송비</span>
					<span class="dev-gap fa fa-plus">3,000원</span>
				</div>
			</div>
		</div>
		<!-- submit 버튼 -->
		<div style="padding: 30px 0px 0px 30px; margin-bottom: 50px; margin-left: 37%;">
			<button type="button" class="btn" style="width:200px; height:50px; background-color: green; color: white;">결제하기</button>
		</div>
	</div>
</div>


</body>
</html>