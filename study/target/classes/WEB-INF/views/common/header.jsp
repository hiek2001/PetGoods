<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul {list-style-type:none;}
li {float: left; margin-right:5px; cursor:pointer;}
nav {float: right; display: inline-block;}
.logo {
	position: relative; 
	text-align: center; 
	top:70px;}
.header {width:100%; height:20%; text-align:center; background-color:white;}
#serve-navbar {
	position: absolute;
	top:150px;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/resources/css/member/join.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<title>Dog&Cat Shop</title>
<div class="header">
	<nav class="navbar navbar-default navbar-fixed-top">
  		<div class="container-fluid">
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="#">Home</a></li>
		      <li><a href="#">BEST</a></li>
		      <li><a href="#">강아지 용품</a></li>
		      <li><a href="#">고양이 용품</a></li>
		      <li><a href="#">고객센터</a></li>
		    </ul>
 		 </div>
	</nav>
	<div id="serve-navbar">
	  <nav>
	    <ul>
	      <li>Hi, '로그인'회원님</li>
	      <li> | </li>
	      <li>
	      	<a href="${path}/member/login.do">로그인</a>
	      </li>
	      <li> | </li>
	      <li>
	      	<a href="${path}/member/join.do">회원가입</a>
	      </li>
	      <li> | </li>
	      <li>
	      	<a href="#">로그아웃</a>
	      </li>
	      <li> | </li>
	      <li>
	      	<a href="#">마이페이지</a>
	      </li>
	      <li> | </li>
	      <li>
	      	<a href="#">장바구니</a>
	      </li>
	      </ul>
	  </nav>
	</div>
	<div class="logo">
		<p>
			<img width="500px" src="${path }/resources/img/logo.jpg" alt="로고이미지">
		</p>
	</div>	
</div>
</head>


