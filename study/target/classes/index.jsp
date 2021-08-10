<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"></div>
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" type="image/JPG" style="background-image: url(${path}/resources/img/index/main_1.JPG); width:100%; heigth:1000px;">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" type="image/JPG" style="background-image: url(${path}/resources/img/index/main_2.JPG); width:100%; heigth:1000px;">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" type="image/JPG" style="background-image: url(${path}/resources/img/index/main_3.JPG); width:100%; heigth:1000px;">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
<div style="height:100px;"></div>
 <div id="main_section_2">
    <ul><li class="left ">       
            <p class="title scroll-fade dj-viewport motion1">
            Pet, People, Pick
            </p>
            <p class="con scroll-fade dj-viewport ">
            '멍멍아냐용해봐'는 반려동물과 사람의 
            <br/>행복하고 건강한 삶을 위한 신념에서 시작된 반려동물 브랜드 입니다.<br/><br/>
            반려동물은 '가족'입니다.<br/>							
			그들을 위한 최고의 선택, 가장 좋은 것으로 주고 싶은 가족의 마음을 담았습니다.<br/></p>
        </li>
        <li class="right  scroll-fade dj-viewport motion2"><img src="${path}/resources/img/index/배너.JPG" alt="피피픽 오른쪽이미지"/></li>
     </ul>
</div> 

</div>
  <!-- Page Content -->
  <div class="container">
    <h1 style="font-family: 'Noto Sans KR';">당신께 추천합니다</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/배변판.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">제로슬립매트 강아지 배변판</a>
            </h4>
            <p class="card-text"><strong>35,000원</strong><br> 99.9% 항균 방수 코딩으로 간편하게 세척할 수 있고, 큰 사이즈로 배변 실수 ZERO! 세균성 질환과 슬개골 탈구도 예방할 수..</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/배변판.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">제로슬립매트 강아지 배변판</a>
            </h4>
            <p class="card-text"><strong>35,000원</strong><br> 99.9% 항균 방수 코딩으로 간편하게 세척할 수 있고, 큰 사이즈로 배변 실수 ZERO! 세균성 질환과 슬개골 탈구도 예방할 수..</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/배변판.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">제로슬립매트 강아지 배변판</a>
            </h4>
            <p class="card-text"><strong>35,000원</strong><br> 99.9% 항균 방수 코딩으로 간편하게 세척할 수 있고, 큰 사이즈로 배변 실수 ZERO! 세균성 질환과 슬개골 탈구도 예방할 수..</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/배변판.jpg" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">제로슬립매트 강아지 배변판</a>
            </h4>
            <p class="card-text"><strong>35,000원</strong><br> 99.9% 항균 방수 코딩으로 간편하게 세척할 수 있고, 큰 사이즈로 배변 실수 ZERO! 세균성 질환과 슬개골 탈구도 예방할 수..</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/토이.JPG" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">강아지 노즈워크 토이</a>
            </h4>
            <p style="font-family: 'NotoSansKR-Thin'; class="card-text"><strong>9,800원</strong><br> 멍멍이들의 덴탈케어를 책임졌던 장난감이 다시 돌아왔다! 스트레스 해소와 호기심 유발을 책임집니다! 바스락 소리와 터그놀이도...</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/살균탈취제.JPG" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a style="font-family: 'Noto Sans KR'; href="#">고양이 강아지 살균탈취제</a>
            </h4>
            <p class="card-text"><strong>14,000원</strong><br> 드디어 진짜가 나타났다 마실 수 있을 정도로 물과 미네랄이온수로만 이루어져있어 안전합니다. 물보다 미세한 입자로 변환해주는...</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



