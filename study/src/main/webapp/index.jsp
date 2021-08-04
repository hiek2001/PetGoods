<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" type="image/jpeg" style="background-image: url(${path}/resources/img/index/main1.jpeg); height:870px;">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" type="image/JPG" style="background-image: url(${path}/resources/img/index/main2.JPG); height:870px;">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" type="image/JPG" style="background-image: url(${path}/resources/img/index/main3.JPG); height:870px;">
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
<div id="main_section_2" onclick="window.location.href='/product/list.html?cate_no=124';">
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
    <h1>당신께 추천합니다</h2>

    <div class="row">
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">고양이 강아지 피부 보습제</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">고양이 강아지 턱드름 치유제</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">고양이 반려묘 캔닢 공</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">고양이 강아지 바디워시</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/토이.JPG" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">강아지 노즈워크 토이</a>
            </h4>
            <p class="card-text"><strong>9,800원</strong><br> 멍멍이들의 덴탈케어를 책임졌던 장난감이 다시 돌아왔다! 스트레스 해소와 호기심 유발을 책임집니다! 바스락 소리와 터그놀이도...</p>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="${path}/resources/img/index/살균탈취제.JPG" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">고양이 강아지 살균탈취제</a>
            </h4>
            <p class="card-text"><strong>14,000원</strong><br> 드디어 진짜가 나타났다 마실 수 있을 정도로 물과 미네랄이온수로만 이루어져있어 안전합니다. 물보다 미세한 입자로 변환해주는...</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



