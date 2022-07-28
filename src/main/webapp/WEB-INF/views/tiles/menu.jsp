<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<header class="header" role="banner">
			<div class="header_subindex">
				<div class="profile_area">
					<div class="profile_inner">
						<a href="#" class="photo">
							<img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84">
						</a>
						<div class="profile">
							<p class="username">${loginUsername}</p>
							<p class="useremail">${loginUserid}</p>
						</div>
					</div>
				</div>
			</div>
			<div id="headerLeft" class="header_left" aria-hidden="false">
				<ul class="left_menu" role="menu">
					<li>
						<a href="/user/myInfo" class="left_item" role="menuitem" aria-current="ture" onclick="changePage('myInfo');" >
							<div class="menu_text on">내 프로필</div>
						</a>
					</li>
					<li>
						<a href="/user/pwchange" class="left_item" role="menuitem" aria-current onclick="changePage('pwchange');">
							<div class="menu_text">비밀번호 변경</div>
						</a>
					</li>
					<li>
						<a href="#" class="left_item" role="menuitem" aria-current onclick="changePage('main2');">
							<div class="menu_text">내 상품보기</div>
						</a>
					</li>
					<li>
						<a href="#" class="left_item" role="menuitem" aria-current onclick="changePage('main3');">
							<div class="menu_text">회원 탈퇴</div>
						</a>
					</li>
				</ul>
			</div>
		</header>	
</body>
<script>
function changePage(name){
	$(".left_item").find("div").removeClass("on");
	$(this).children.addClass("on");
}
</script>
</html>







