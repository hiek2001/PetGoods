<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function execPostCode() {
		new daum.Postcode({
			oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분
			
			// 도로명 주소의 노출 규칙에 따라 주소를 조합
			// 내려오는 변수가 값이 없는 경우에 공백값을 가지기 때문에 분기함
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 조합 변수
			
			// 법정동명이 있을 경우 추가
			// 법정동의 경우 마지막 문자가 '동/로/가'로 끝남
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);            
            
            $("[name=addr1]").val(data.zonecode);
            $("[name=addr2]").val(fullRoadAddr);        
            
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr2').value = fullAddr;
        }
		}).open();
	}
</script>
<style type="text/css">
table, td {
	border-collapse: collapse;
	margin: 0px;
	padding: 0px;
}
img {
	display: block;
}
/* 레이아웃 틀 */
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
    font-family: 'Noto Sans KR';
}

h5 {
	font-family: 'Noto Sans KR';
}

.input-fm {
	width: 30%;
}

.font-weight {
	font-weight: 700;
}

.gap {
	margin-left: 20%;
}

.dev-gap {
	margin-left: 30%;
}
</style>
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
		<div class="col-md-9" style="background-color: #FBFBFB; height: 1200px; width: auto;  box-shadow: 5px 5px 5px 5px #E9E9EA;">
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
				
				</div>
			</div>
		</div>
		<div class="col-md-3" style="height: 1200px; width: auto; background-color: #F4F4F3;  box-shadow: 5px 5px 5px 5px #E9E9EA;">
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
		<!-- submit 버튼 -->
		<div style="padding: 30px 0px 0px 30px; margin-bottom: 50px; margin-left: 37%;">
			<button class="btn" style="width:200px; height:50px; background-color: green; color: white;">결제하기</button>
		</div>
	</div>
</div>


</body>
</html>