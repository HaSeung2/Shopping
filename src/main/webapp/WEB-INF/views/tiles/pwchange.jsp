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
				<form method="post" class="pwForm" name="pwForm" id="pwForm">
				<input type="hidden" value="${loginUserid}" name="useremail" id="useremail">
					<div class="col-12">
						<h3>기존 비밀번호</h3>
						<input type="password" name = "userpws" autocomplete="off" id="userpw" oninput="checkPw()">	
						<span class ="userPw"></span>
					</div>
					<div class="col-12">
						<h3>비밀번호</h3>
						<input type="password" name = "userpw" autocomplete="off" id="usernewpw" oninput="checkPws()">
						<span class ="usernewpw"></span>							
					</div>
					<div class="col-12">
						<h3>비밀번호 확인</h3>
						<input type="password" name = "usernewCk" autocomplete="off" id="usernewCk" oninput="checkPW()">
						<span class ="usernewCk"></span>							
					</div>
					<div class="col-12" style="text-align: center">
						<input type="submit" value="비밀번호 변경" class="primary" id="pwChangeSubmit">
					</div>
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
function checkPws(){
	const hiddenpw = "${userpw}";
	let userpw = $("#usernewpw").val();
	let checkNumber = userpw.search(/[0-9]/g);
	let checkEnglish = userpw.search(/[a-z]/ig);
	let pwCheck = $(".usernewpw");
	
	if(userpw.length < 1){
		pwCheck[0].textContent = "비밀번호를 입력해주세요";
	}
    else  if(!/^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userpw)){            
    	pwCheck[0].textContent = "숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.";
    }
    else if(checkNumber <0 || checkEnglish <0){
    	pwCheck[0].textContent = "숫자와 영문자를 혼용하여야 합니다.";
    }
    else if(/(\w)\1\1\1/.test(userpw)){
    	pwCheck[0].textContent = "같은 문자를 4번 이상 사용하실 수 없습니다.";
    }
    else if(hiddenpw == userpw){
    	pwCheck[0].textContent = "기존 비밀번호와 같은 비밀번호입니다.";
	}
    else{
    	pwCheck[0].textContent = "";
    }
}
function checkPW(){
	let userpwCheck = $("#usernewCk").val();
	let userpw = $("#usernewpw").val();
	let pwre = $(".usernewCk");
	
	if(userpwCheck < 1){
		pwre[0].textContent = "비밀번호 확인해주세요";
	}
	else if(userpwCheck != userpw){
		pwre[0].textContent = "비밀번호가 틀립니다";
	}
	else{
		pwre[0].textContent = "";
	}
}
$("#pwChangeSubmit").on("click",function(e){
	const pwForm = $("#pwForm");
	let userpw = $("#userpw").val();
	let userpws = $("#usernewpw").val();
	let userpwCheck = $("#usernewCk").val();
	let checkNumber = userpw.search(/[0-9]/g);
	let checkEnglish = userpw.search(/[a-z]/ig);
	const hiddenpw = "${userpw}";
	
	e.preventDefault();
	if(userpw < 1){
		alert("기존 비밀번호를 입력해주세요");
		return false;
	}
	else if(hiddenpw != userpw){
		alert("기존 비밀번호와 일치하지 않습니다.");
		return false;
	}
	else if(userpws == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
    else  if(!/^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userpws)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        return false;
    }
    else if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        return false;
    }
    else if(/(\w)\1\1\1/.test(userpws)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        return false;
    }
    else if(userpwCheck == ""){
    	alert("비밀번호 확인을 해주세요");
    	return false;
    }
    else if(userpwCheck != userpws){
    	alert("비밀번호가 틀립니다. 비밀번호 확인을 다시 해주세요");
    	return false;
    }
    else if(userpw == userpws){
    	alert("기존 비밀번호와 같은 비밀번호입니다.");
    	return false;
    }
    else{
    	pwForm.attr("action","/user/pwChanges");
    	pwForm.submit();
    }
})
</script>
</html>











