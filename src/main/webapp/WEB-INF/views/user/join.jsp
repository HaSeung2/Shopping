<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
	<link href="/resources/css/user/join.css" rel="stylesheet" />
</head>
<body>
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
                    <h1 class="display-4 fw-bolder" style="color:#000000;">회원가입</h1>
                    <p class="lead fw-normal text-white-50 mb-0"></p>
                </div>
            </div>
</header>
	<form name="joinForm" id="joinForm" method="post">
		<table id="container">
			<tr>
				<td id="result" colspan="2"></td>
			</tr>			
			<tr>
				<th><label for="useremail">아이디</label></th>
				<td><input type="text" name="useremail" id="useremail" placeholder="example@000.com" oninput="checkId()">
				<br><span class="idCheck" id="idCheck"></span></td>
			</tr>
			<tr>
				<th><label for="userpw">비밀번호</label></th>
				<td><input type="password" name="userpw" id="userpw" placeholder="8자리 이상 써주세요" oninput="checkPw()">
				<br><span class ="pwCheck"></span></td>
			</tr>
			<tr>
				<th><label for="userpw_re">비밀번호 확인</label></th>
				<td><input type="password" name="userpw_re" id="userpw_re" oninput="checkPW()">
				<br><span class="pwRe"></span></td>
			</tr>
			<tr>
				<th><label for="username">이름</label></th>
				<td><input type="text" name="username" id="username"></td>
			</tr>
			<tr class="zipcode_area">
				<th>우편번호</th>
				<td>
					<input readonly name="postnum" type="text" id="postnum" placeholder="우편번호"><input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
				</td>
			</tr>
			<tr class="addr_area">
				<th>주소</th>
				<td><input readonly name="addr" type="text" id="addr" placeholder="주소"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input name="detailaddress" type="text" id="detailaddress" placeholder="상세주소"></td>
			</tr>
			<tr>
				<th>참고항목</th>
				<td><input readonly name="seealso" type="text" id="seealso" placeholder="참고항목"></td>
			</tr>
			<tr>
				<th><label for="userphone">전화번호</label></th>
				<td><input type="text" name="userphone" id="userphone" placeholder="전화번호입력"><input type="button" value="인증번호 받기" id="randomnum" style="width:110px;"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="text" name="phonecheck" id="phonecheck" placeholder="인증번호 입력" style="display: block; margin:0 auto;"><input type="button" value="인증번호 확인" id="randomnumcheck" style="width:110px;"></th>
				<td><span class ="numselect"></span></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" id="joinSubmit" value="가입 완료">
				</th>
			</tr>
		</table>
	</form>
	<form id="phoneNumber" action="/user/message">
	</form>
	 <!-- Footer-->
        <footer>
            <div class="container"><p class="m-0 text-center text-white" style="color:#000000 !important;">Copyright &copy; Your Website 2022</p></div>
        </footer>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/join.js"></script>
</body>
</html>







