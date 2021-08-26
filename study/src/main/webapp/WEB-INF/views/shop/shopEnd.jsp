<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style type="text/css">
span {
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
		<span>결제가 </span>
		<span class="highlight">완료</span>
		<span>되었습니다</span>
	</div>
	<div class="col-md-4"></div>
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<table class="table table-bordered" style="margin-bottom: 80px;">
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
		      <td>${order. }</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">갯수</th>
		      <td>Larry the Bird</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">총가격</th>
		      <td>Mark</td>
		    </tr>
		    <tr>
		      <th scope="row" bgcolor="#F1F1F1">배송지</th>
		      <td>Jacob</td>
		    </tr>
		  </tbody>
		</table>
	</div>
	<div class="col-md-2"></div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>