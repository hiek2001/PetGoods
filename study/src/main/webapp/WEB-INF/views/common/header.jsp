<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Bootstrap core CSS -->
  <link href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${path}/resources/css/modern-business.css" rel="stylesheet">

  <link href="${path}/resources/css/index.banner.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a style="font-family: 'Noto Sans KR';" class="navbar-brand" href="index.html">멍멍아냐옹해봐</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="${path}/snackShop.do">간식</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">용품</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">리뷰/Q&A</a> 
          </li>
          <c:if test="${member == null}">
	          <li class="nav-item">
	            <a class="nav-link" href="${path}/member.do">로그인/회원가입</a>
	          </li>
          </c:if>
          <c:if test="${member != null}">
			  <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	              ${member.userName}님 안녕하세요! 
	            </a>
	            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
	              <a class="dropdown-item" href="${path}/mypage.do">마이페이지</a>
	              <a class="dropdown-item" href="${path}/logout.do">로그아웃</a>
	            </div>
	          </li>
          </c:if>    
        </ul>
      </div>
    </div>
  </nav>


