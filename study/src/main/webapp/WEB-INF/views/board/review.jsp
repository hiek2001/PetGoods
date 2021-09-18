<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
div .btn-list {
	float: right;
}
</style>
<div>
	<div>
		<div style="position:relative;">
			<img style="width: 100%;" src="${path}/resources/img/board/review_banner.png">
		</div>
	</div>
	<div class="container">
		<div class="row">
			<c:if test="${member!= null }">
			<div class="btn-list">
				<button style="margin-right: 5px;" type="button" class="btn btn-secondary">수정</button>
				<button type="button" class="btn btn-info" onclick="location.href='${path}/reviewWrite.do'">글쓰기</button>
			</div>
			</c:if>
			<table class="table table-hover">
				<thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">글 제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">작성일</th>
				      <th scope="col">조회수</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${review}" var="review">
				    <tr onclick="location.href='${path}/reviewDetail.do?reviewNo='+reviewNo">
				      <th scope="row">${review.reviewNo}</th>
				      <td>${review.title}</td>
				      <td>${review.writer}</td>
				      <td>${review.createDate}</td>
				      <td>${review.viewCnt}</td>
				    </tr>
				    </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>