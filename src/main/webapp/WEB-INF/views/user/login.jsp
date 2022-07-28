<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="/resources/css/styles.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/css/main.css"/>
<style>
	.heading{
		color:#000000;
	}
	.loginForm{
		width:50%;
		margin:0 auto;
	}
	.loginForm h3{
		float:left;
		width:30%;
		color:#000000;
		line-height: 3.24rem;
	}
	.loginForm input[type=text], .loginForm input[type=password]{
		float:right;
		width:70%;
	}
	.loginForm>.col-12::after{
		display:block;
		content:"";
		height:50px;
		clear:both;
	}
</style>
</head>
<body style="background-color: rgb(245,246,247);">
<c:if test="${f != null}">
	<script>
		alert("로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요");
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
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
                    		<li class="nav-item"><a href="/user/join"class="nav-link">회원가입</a></li>
                    	</ul>
                    </form>
                </div>
            </div>
        </nav>
	<header>
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder" style="color:#000000;">로그인</h1>
                    <p class="lead fw-normal text-white-50 mb-0"></p>
                </div>
            </div>
	</header>
	<div id="main">
				<div class="wrapper style1 special">
					<div class="inner">
						<h2 class="heading alt"></h2>
						<br>
						<form class="loginForm" name="loginForm" id="loginForm" action="/user/login" method="post">
							<div class="col-12">
								<h3>아이디</h3>
								<input type="text" name = "useremail">							
							</div>
							<div class="col-12">
								<h3>비밀번호</h3>
								<input type="password" name = "userpw">							
							</div>
							<div class="col-12" style="text-align: center">
								<input type="submit" value="로그인" class="primary">
							</div>
						</form>
					</div>
				</div>
			</div>
	
	<!-- Footer-->
    <footer>
        <div class="container"><p class="m-0 text-center text-white" style="color:#000000 !important;">Copyright &copy; Your Website 2022</p></div>
    </footer>
</body>
<script src="/resources/js/scripts.js"></script>
<script>
</script>
</html>