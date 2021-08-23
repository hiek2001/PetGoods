<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="${path}/resources/css/snackshop.main.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script type="text/javascript">

</script>
<div id="rs-team" class="rs-team fullwidth-team pt-100 pb-70">
<div>
	<div style="position:relative;">
		<img style="width: 100%;" src="${path}/resources/img/snackshop/banner.png">
	</div>
</div>
    <div class="container">
        <div class="row">
        	<c:forEach items="${snack}" var="snack">
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="${path}/resources/img/snackshop/${snack.snackImg}" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name"><c:out value="${snack.snackName}" /></h4>
                            <span class="subtitle"><c:out value="${snack.price}" />원</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>                                   
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="${path}/snackShopDetail.do" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
       <!-- <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name">Mariono Rose</h4>
                            <span class="subtitle">CEO &amp; Founder</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="team-details">
                                    <h4 class="team-name">
                                        <a href="speakers-single.html">Mariono Rose</a>
                                    </h4>
                                    <span class="postion">CEO &amp; Founder</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name">Stiven Smith</h4>
                            <span class="subtitle">CEO &amp; Founder</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="team-details">
                                    <h4 class="team-name">
                                        <a href="speakers-single.html">Stiven Smith</a>
                                    </h4>
                                    <span class="postion">CEO &amp; Founder</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name">Hose Morinho</h4>
                            <span class="subtitle">CEO &amp; Founder</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="team-details">
                                    <h4 class="team-name">
                                        <a href="speakers-single.html">Hose Morinho</a>
                                    </h4>
                                    <span class="postion">CEO &amp; Founder</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name">Rihana kery</h4>
                            <span class="subtitle">CEO &amp; Founder</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="team-details">
                                    <h4 class="team-name">
                                        <a href="speakers-single.html">Rihana kery</a>
                                    </h4>
                                    <span class="postion">CEO &amp; Founder</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="team-item">
                    <div class="team-img">
                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="team Image">
                        <div class="normal-text">
                            <h4 class="team-name">Siymon catich</h4>
                            <span class="subtitle">CEO &amp; Founder</span>
                        </div>
                    </div>
                    <div class="team-content">
                        <div class="display-table">
                            <div class="display-table-cell">
                                <div class="share-icons">
                                    <div class="border"></div>
                                    <ul class="team-social icons-1">
                                        <li><a href="#" class="social-icon"><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-plus-square"></i></a>
                                        </li>
                                    </ul>

                                    <ul class="team-social icons-2">
                                        <li><a href="#" class="social-icon"><i class="fa fa-share-alt"></i></a>
                                        </li>
                                        <li><a href="#" class="social-icon"><i class="fa fa-linkedin"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="team-details">
                                    <h4 class="team-name">
                                        <a href="speakers-single.html">Siymon catich</a>
                                    </h4>
                                    <span class="postion">CEO &amp; Founder</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <!-- Paging -->
    <div style="margin-left: 47%; padding: 5px 0px 20px 0px;">
    	<nav aria-label="...">
		  <ul class="pagination pagination-sm">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1">1</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		  </ul>
		</nav>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>