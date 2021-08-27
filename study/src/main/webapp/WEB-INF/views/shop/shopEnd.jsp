<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
$(function(){
	$('#home-btn').click(function(){
		location.href="${path}/";
		
	});
});
</script>
<style type="text/css">
.word {
	font-size: 40px;
	font-weight: 700;
}

.highlight {
	color: #F13C9A;
}

.pay-font {
	width:auto; 
	height: 100px; 
	text-align: center; 
	padding: 12px; 
	margin-top: 30px;
}
</style>
<div class="row">
	<div class="col-md-4"></div>
	<div class="pay-font col-md-4" style="margin-bottom: 20px;">
		<span class="word">결제가 </span>
		<span class="word highlight">완료</span>
		<span class="word">되었습니다</span>
	</div>
	<div class="col-md-4"></div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<table class="table table-bordered" style="margin-bottom: 30px;">
		  <tbody>
		    <tr>
		      <th scope="row" width="30%;" bgcolor="#F1F1F1">결제번호</th>
		      <td>${order.orderUid}</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">배송자</th>
		      <td>${order.orderName}</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">제품명</th>
		      <td>${order.snackName}</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">총가격</th>
		      <td><fmt:formatNumber value="${order.allPrice}" pattern="#,###원"/></td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">배송지</th>
		      <td>
		      	<p>${order.orderAddr1}</p> 
		      	<span>${order.orderAddr2}</span> 
		      	<span>${order.orderAddr3}</span> 
		      </td>
		    </tr>
		  </tbody>
		</table>
	</div>
	<div class="col-md-2"></div> 
	<div style="padding: 30px 0px 0px 30px; margin-bottom: 50px; margin-left: 40%;">
		<button type="button" id="home-btn" class="btn" style="width:300px; height:50px; border:2px solid #F13C9A;">홈으로가기</button>
	</div>  
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>