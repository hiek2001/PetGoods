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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


function payEnd(uid) {
	var result = "N";
    // 결제 정보 저장
	var all = '${snack.price*skcount}';
	var note = $("select[name=orderNote]").val();
	var name = $("#orderName").val();
	var email = '${member.userEmail}';
	var addr1 = $("#orderAddr1").val();
	var addr2 = $("#orderAddr2").val();
	var addr3 = $("#orderAddr3").val();
	var phone = $("#orderPhone").val();
	var param = {
			"orderNo" : 1,
			"orderName" : name,
          	"orderEmail" : email,
          	"orderPhone" : phone,
          	"orderAddr1" : addr1,
          	"orderAddr2" : addr2,
          	"orderAddr3" : addr3,
          	"allPrice" : all,
          	"orderNote" : note,
          	"orderUid" : uid

    }
	console.log(param);
	$.ajax({
        url: "/payEnd.do",
        type: 'POST', 
        dataType: 'json',
        contentType: "application/json",
        data: JSON.stringify(param),
        async: false, // ajax는 기본 동기식이기에 return을 보내려면 비동기식으로 설정해야함
        success:function(data) {
			console.log("성공적으로 보냄");
			// 성공시 이동할 페이지
			//location.href="${path}/shopEnd.do?orderUid="+uid;
			result = "Y";
		}
		//error:function(request, status, error) {
			//console.log(request.status);
			//console.log(request.reponseText);
			//console.log(error);
		//}
	});
	return result;
}

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
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
	        
	           var uid = rsp.imp_uid;
			   var result2 = payEnd(uid);
			   console.log(result2);
			   if(result2 == "Y"){
				   var msg = '결제가 완료되었습니다.';
		           msg += '고유ID : ' + rsp.imp_uid;
		           msg += '상점 거래ID : ' + rsp.merchant_uid;
		           msg += '결제 금액 : ' + rsp.paid_amount;
		           msg += '카드 승인번호 : ' + rsp.apply_num;
		           
		           alert(msg);
					// 성공시 이동할 페이지
					location.href="${path}/shopEnd.do?orderUid="+uid;
			   }
		} else {
			msg = '결제에 실패하였습니다.';
			msg += '에러내용 : '+rsp.error_msg;
			// 실패시 이동할 페이지
			alert(msg);
		}
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
						<label for="name">이름</label>
					</h3>
					<span class="box">
						<input type="text" name="orderName" id="orderName" class="input-fm form-control">
					</span>
				</div>
				<div class="form-group">
					<h3>
						<label for="orderPhone">휴대전화</label>
					</h3>
					<span class="box">
						<input type="text" name="orderPhone" id="orderPhone" placeholder="전화번호 입력"  class="input-fm form-control">
					</span>
				</div>
				<div class="form-group">
					<h3>
						<label for="orderAddr">배송지</label>
					</h3>
					<div class="form-group">                   
						<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="orderAddr1" id="orderAddr1" type="text" readonly="readonly" >
						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
					</div>
					<div class="form-group">
						<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="orderAddr2" id="orderAddr2" type="text" readonly="readonly" />
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="상세주소" name="orderAddr3" id="orderAddr3" type="text"  />
					</div>
				</div>
				<div>
					<h3>
						<label for="orderNote">요청사항</label>
					</h3>
					<div class="input-fm input-group">
						<select name="orderNote" class="custom-select">
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
		<div class="col-md-3" style="height: 700px; width: auto; margin-bottom: 50px; background-color: #F4F4F3;  box-shadow: 5px 5px 5px 5px #E9E9EA;">
			<div style="height:500px;"></div>
			<div>
				<h5><strong>결제상세</strong></h5>
				<div>
					<span class="font-weight">주문금액</span>
					<span class="font-weight gap"><fmt:formatNumber value="${snack.price*skcount+3000}" pattern="#,###원"/></span>
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
		<!-- submit 버튼
		<div style="padding: 30px 0px 0px 30px; margin-bottom: 50px; margin-left: 37%;">
			<button type="button" id="pay-btn" class="btn" style="width:200px; height:50px; background-color: green; color: white;">결제하기</button>
		</div>  -->
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>