<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>This is index.jsp 하하하하하하하하</h1>
	<div class="container">
		<h3>회원가입</h3>
		
		<button onclick='location.href="${path}/member/join.do"'>회원가입으로 이동하기</button>
	</div>
	
</body>
</html>