<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/> 
<link href="${path}/resources/css/snackshop.detail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

</script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container bootdey margin">
<div class="row">
<section class="panel">
      <div class="panel-body">
          <div class="col-md-6">
              <div class="pro-img-details">
                  <img src="${path}/resources/img/snackshop/배변판_big.png" alt="">
              </div>
          </div>
          <div class="col-md-6">
              <h4 class="pro-d-title" style="font-size: 25px;">                  
                  <strong>제로슬립매트 강아지 배변판</strong>                 
              </h4>
              <p>
                  Praesent ac condimentum felis. Nulla at nisl orci, at dignissim dolor, The best product descriptions address your ideal buyer directly and personally. The best product descriptions address your ideal buyer directly and personally.
              </p>
              <div class="product_meta">
                  <span class="posted_in">국내배송</span>
                  <span class="tagged_as">배송비 3,000원</span>
              </div>
              <div class="m-bot15"> <strong>Price : </strong> <span class="amount-old">$544</span>  <span class="pro-price"> $300.00</span></div>
              <div class="form-group">
                  <label>Quantity</label>
                  <input type="quantiy" placeholder="1" class="form-control quantity">
              </div>
              <p>
                  <button class="btn btn-round btn-danger" type="button"><i class="fa"></i> Add to Cart</button>
                  <button class="btn btn-round btn-success" type="button"><i class="fa"></i> Buy Now</button>
              </p>
          </div>
      </div>
  </section>
  </div>
  </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>