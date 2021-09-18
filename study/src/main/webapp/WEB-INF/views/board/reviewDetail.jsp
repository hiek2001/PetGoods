<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
p {
	float:right;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-6 col-md-1"></div>
		<div class="col-6 col-md-10">
			<form method="post" style="margin-top: 70px; margin-bottom: 130px;" action="${path}/update.do" >
				<div class="form-group">
				    <p>작성자  ${review.writer}</p>
				    <p>조회수  ${review.viewCnt}  / </p>
				    <p>작성일  ${review.createDate}  /  </p>
				    <input type="hidden" name="userEmail" id="userEmail" value="${member.userEmail}">
			   </div>
				<div class="form-group">
				    제목 <input type="text" class="form-control" name="title" id="title" value="${review.title}">
			   </div>
			   <div class="form-group">
			    <label>내용</label>
			    <textarea class="form-control" id="content" name="content" rows="3">${review.content}</textarea>
			  </div>
			  <c:if test="${member.userName == review.writer}">
				  <div>	
				  	<button type="submit" class="btn btn-info">변경</button>
					<button style="margin-right: 5px;" type="button" class="btn btn-secondary" onclick="${path}/board.do">취소</button>  
				 </div>
			 </c:if>
	  		</form>
		</div>
		<div class="col-6 col-md-1"></div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>