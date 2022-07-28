<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link href="/resources/css/home.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    </head>
    <body>
    <c:if test="${suc != null}">
    	<script>
    		alert("상품 등록 완료!");
    	</script>
    </c:if>
    <c:if test="${t != null}">
	<script>
		alert("비밀번호 변경에 성공하였습니다.");
	</script>
	</c:if>
	<c:if test="${f != null}">
		<script>
			alert("비밀번호 변경에 실패하셨습니다. 다시 시도해주세요");
		</script>
	</c:if>
	<c:if test="${T != null}">
		<script>
			alert("이름 변경에 성공하였습니다.");
		</script>
	</c:if>
	<c:if test="${F != null}">
		<script>
			alert("이름 변경에 실패하였습니다.");
		</script>
	</c:if>
	<c:if test="${tT != null}">
		<script>
			alert("주소 변경에 성공하였습니다.");
		</script>
	</c:if>
	<c:if test="${fF != null}">
		<script>
			alert("주소 변경에 실패하였습니다.");
		</script>
	</c:if>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">My shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">인기 상품</a></li>
                                <li><a class="dropdown-item" href="#!">새 상품</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:if test="${loginUserid != null}">
                    	<form class="d-flex">
                    	<input class= "useremail" type="hidden" value="${loginUserid}">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/myInfo" class="nav-link" id="myinfo">내정보</a></li>
                    		<li class="nav-item"><a href="/product/addproduct" class="nav-link">상품 등록</a></li>
                    		<li class="nav-item"><a href="/user/logout"class="nav-link">로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid == null }">
                    	<form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
                    		<li class="nav-item"><a href="/user/join"class="nav-link">회원가입</a></li>
                    	</ul>
                    </form>
                    </c:if>
                </div>
            </div>
        </nav>
        <div class="banner_container">
        	<div class="banner_containers">
        		<div class="swiper swiperC">
        			<div class="swiper-wrapper">
                		<a class="swiper-slide mainBannerItem">
	                		<div class="image_container">
	                			<img class="bannerImage" src="https://app-storage-edge-005.cafe24.com/photoslide2/boom2004/2021/05/24/a62b94c23df8dc6b7631449b7f0d46db.jpg">
	                		</div>	               
	              	 	</a>  
        			</div>
        			 <div class="mainbanner-pagination"></div>
		              <!-- 버튼을 만들려면 아래와 같이 클래스 명을 입력 -->
		              <button class="mainbanner-button-prev">
		                <img src="/resources/img/white_arrow_prev.svg" alt="arrow">
		              </button>
		              <button class="mainbanner-button-next">
		                <img src="/resources/img/white_arrow_next.svg" alt="arrow">
		              </button>
        		</div>
        	</div>
        </div>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${file}" var="file" varStatus="status">
                        <div class="card h-100">
                    <div class="col mb-5">
                	            <!-- Product image-->
                            <img class="card-img-top" src="/resources/img/${file.filename}"alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${product[status.index].productname}</h5>
                                    <!-- Product price-->
                                    ${product[status.index].productprice}원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/board?productnum=${product[status.index].productnum}">구매하러 가기</a></div>
                            </div>
                        </div>
                    </div>&nbsp;&nbsp;&nbsp;
                  </c:forEach>
                  </div>
                  </div>
                  </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script src="/resources/js/swiper.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>
