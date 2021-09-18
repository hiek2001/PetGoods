<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-6 col-md-1"></div>
		<div class="col-6 col-md-10">
			<form method="post" style="margin-top: 70px; margin-bottom: 130px;" action="${path}/insertEnd.do" >
				<div class="form-group">
				    <label for="exampleFormControlInput1">제목</label>
				    <input type="text" class="form-control" name="title" id="title">
			   </div>
			   <div class="form-group">
			    <label>내용</label>
			    <textarea class="form-control" id="content" name="content" rows="3"></textarea>
			     <input type="hidden" name="userEmail" id="userEmail" value="${member.userEmail}">
			  </div>
			  <div>	
			  	<button type="submit" class="btn btn-info">저장</button>
				<button style="margin-right: 5px;" type="button" class="btn btn-secondary">취소</button>  
			 </div>
	  		</form>
		</div>
		<div class="col-6 col-md-1"></div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>