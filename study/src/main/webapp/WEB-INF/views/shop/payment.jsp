<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript">

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

</style>
<div class="container">
	<div class="row">
		<div class="col-md-12" style="height: 50px; width: auto; margin-top: 10px; font-family: 'Noto Sans KR';">
			<h3><strong>주문/결제</strong></h3>
		</div>
		<table class="table table-bordered">
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
	</div>
</div>


</body>
</html>