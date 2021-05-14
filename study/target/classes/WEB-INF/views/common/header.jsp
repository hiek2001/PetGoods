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
li {float: left; margin-right:5px;}
nav {float: right; display: inline-block;}
.logo {text-align: center;}
.header {width:70%; height:100%; text-align:center;}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/member/join.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js" charset="utf-8"></script>
<title>MINI SHOP</title>
<div class="header">
	<div>
	  <nav>
	    <ul>
	      <li>Hi, '로그인'회원님</li>
	      <li> | </li>
	      <li><a href="#">로그아웃</a></li>
	      <li> | </li>
	      <li><a href="#">마이페이지</a></li>
	      <li> | </li>
	      <li><a href="#">장바구니</a></li>
	      <li> | </li>
	      <li><a href="#">고객센터</a></li>
	      </ul>
	  </nav>
	</div>
	<div class="logo">
		<p>
			<img src="${path }/resources/img/logo.jpg" alt="로고이미지">
		</p>
	</div>
</div>
</head>


