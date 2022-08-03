<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.pwForm{
		width:90%;
		margin:0 auto;
	}
	.pwForm h3{
		float:left;
		width:30%;
		color:#000000;
		line-height: 3.24rem;
	}
	 .pwForm input[type=password]{
		float:right;
		width:70%;
	}
	.pwForm>.col-12::after{
		display:block;
		content:"";
		height:50px;
		clear:both;
	}
</style>
<meta charset="UTF-8">
<link href="/resources/css/user/pwChange.css" rel="stylesheet"/>
</head>
<body>
	<div id="main">
		<div class="wrapper style1 special">
			<div class="inner">
				<h2 class="heading alt"></h2>
				<br>
				<form action="/user/bye" method="post" class="pwForm" name="pwForm" id="pwForm">
				<input type="hidden" value="${loginUserid}" name="useremail" id="useremail">
					<div class="col-12">
						<h3>비밀번호</h3>
						<input type="password" name = "userpws" autocomplete="off" id="userpw" oninput="checkPw()" placeholder="비밀번호를 입력해주세요">	
						<span class ="userPw"></span>
					</div>
					<button type="button" class="btn btn-secondary" id = "bye">회원 탈퇴하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
function checkPw(){
const hiddenpw = "${userpw}";
let userpw = $("#userpw").val();
let userPw = $(".userPw");
			if(userpw < 1){
				userPw[0].textContent = "기존 비밀번호를 입력해주세요.";
			}
			else if(hiddenpw != userpw){
				userPw[0].textContent = "기존 비밀번호와 일치하지 않습니다.";
			}
			else{
				userPw[0].textContent = "";
			}
}
$("#bye").on("click",function(e){
const pwForm = $("#pwForm");
const hiddenpw = "${userpw}";
let userpw = $("#userpw").val();
	e.preventDefault();
	if(userpw < 1){
		alert("비밀번호를 입력해주세요");
	}	
	else if(hiddenpw != userpw){
		alert("비밀번호가 일치하지 않습니다");
	}
	else{
		pwForm.submit();
	}
	
})
</script>
</html>











