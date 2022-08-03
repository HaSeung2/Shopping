<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
</head>
<style>
	.nameModal, .zipModal{
		position: absolute;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,0.8);
		top:0;
		left:0;
		display:none;
	}
	.nameModal_body, .zipModal_body {
	  position: absolute;
	  top: 60%;
	  left: 70%;
	  width: 650px;
	  height: 230px;
	  padding: 190px;
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	  transform: translateX(-50%) translateY(-50%);
	  z-index: 1;
	}
	input[type="text"]{
	border-color: rgba(144, 144, 144, 0.25);
	height: 3.25rem;
	appearance: none;
    border-radius: 4px;
    border: solid 1px;
    color: inherit;
    outline: 0;
    padding: 0 6rem;
    text-decoration: none;
	}
	input{
		font-family: 'SLEIGothicTTF';
	    font-weight: 300;
	    font-size: 1rem;
	    line-height: 2.15;
	}
	form > :last-child {
	    margin-bottom: 0;
	}
	.wrapper.special {
	    text-align: center;
	}
	.wrapper {
	    padding: 6rem 0 4rem 0;
	}
</style>
<body>
			<div id="container" class="container">
			<div id="content" class="content">
				<div class="subindex_wrap" role="main">
					<div class="subindex_item">
						<div class="subindex_greenbox">
							<div class="myprofile">
								<div class="info_title">
									<h3 class="title_text">기본 정보</h3>
								</div>
								<ul class="myinfo_area">
									<li>
										<div class="myphoto">
											<img src="https://static.nid.naver.com/images/web/user/default.png" width="56" height="56">
										</div>
									</li>
									<li>
										<div class="myaccount">
											<div class="myname">
												<div class="name_text">${loginUsername}</div>
												<button type="button" class="btn_edit" id="nameCn">
													<span class="text">이름 변경</span>
												</button>
											</div>
											<div class="myaddress">${loginUserid}</div>
										</div>
									</li>
								</ul>
							</div>
							<ul class="subindex_row">
								<li>
									<div id="phoneNoReDiv" class="row_item phone">
										<span id="phoneNoReSpan" class="item_text">전화번호 : ${userphone}</span>
									</div>
								</li>
								<li>
									<div class="row_item mail">
										<span class="item_text">이메일 : ${loginUserid}</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="subindex_item">
						<div class="subindex_onebox">
							<div class="onebox_title desc">
								<h2 class="subindex_title">내 주소 보기</h2>
							</div>
							<button type="button" class="link_right">
								<span class="case">보러가기</span>
							</button>>
							<div class="subindex_desc">회원가입시 입력한 주소를 관리할 수 있어요.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="nameModal">
			<div class="nameModal_body">
				<div class="wrapper style1 special">
					<div class="inner">
						<form method="post" class="nameForm" id="nameForm">
						<input type="hidden" value="${loginUserid}" name="useremail">
							<div class="col-12">
								<input type="text" class="username" name = "username" id="username" placeholder="변경하실 이름 입력">
								<button type="submit" id="nameBtn" class="btn_edit">
										<span id="nameBtnTXT" class="text">수정완료</span>
								</button>
								<button type="submit" class="btn_edit" id="nameCancle">
										<span id="nameBtnTXT" class="text">취소</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="zipModal">
			<div class="zipModal_body">
				<div class="wrapper style1 special">
					<div class="inner">
						<form method="post" class="zipForm" id="zipForm">
						<input type="hidden" value="${loginUserid}" name="useremail">
							<table>
								<tr class="zipcode_area">
									<th>우편번호</th>
									<td>
										<input readonly name="postnum" type="text" id="postnum" value="${postnum}"><input type="button" onclick="DaumPostcode()" value="우편번호 변경하기">
									</td>
								</tr>
								<tr class="addr_area">
									<th>주소</th>
									<td><input readonly name="addr" type="text" id="addr" value="${addr}"></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input name="detailaddress" type="text" id="detailaddress" value="${detailaddress}"></td>
								</tr>
								<tr>
									<th>참고항목</th>
									<td><input readonly name="seealso" type="text" id="seealso" value="${seealso}"></td>
								</tr>
								<tr>
									<th colspan="2">
										<input type="submit" id="zipSubmit" value="수정하기">
										<input type="submit" id="zipCancle" value="나가기">
									</th>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="/resources/js/daum.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script>
//-----------------------주소 변경------------------------------
	$(".link_right").on("click",function(e){
		e.preventDefault();
		$(".zipModal").show();
	});
	$("#zipCancle").on("click",function(e){
		e.preventDefault();
		$(".zipModal").hide();
	})
	
	$("#zipSubmit").on("click",function(e){
		e.preventDefault();
		const zipForm = $(".zipForm");
		const postnum = "${postnum}";
		const detailaddress = "${detailaddress}";
		
		let npostnum = $("#postnum").val();
		let ndetailaddress = $("#detailaddress").val();
	
		if(npostnum ==""){
	    	alert("우편번호를 입력해주세요");
	    }
	    else if(ndetailaddress == ""){
	    	alert("상세주소를 입력해주세요");
	    }
	    else if(detailaddress == ndetailaddress && postnum == npostnum){
	    	alert("변경된 내용이 없습니다.")
	    }
	    else{
	    	zipForm.attr("action","/user/zipCn");
	    	zipForm.submit();
	    }
	})
//---------------------------------------------------------

//--------------------- 이름 변경 ----------------------------- 
	$("#nameCn").on("click",function(e){
		e.preventDefault();
		$(".nameModal").show();
	});
	
	$("#nameBtn").on("click",function(e){
		e.preventDefault();
		const nameForm = $(".nameForm");
		let username = $("#username").val();
		let usernames = "${loginUsername}";
		
		if(username < 1){
			alert("이름을 입력해주세요.");			
		}
		else if(username == usernames){
			alert("기존 이름과 같습니다. 변경해주세요");
		}
		else{
			nameForm.attr("action","/user/nameCn");
			nameForm.submit();
		}
	})
	
	$("#nameCancle").on("click",function(e){
		e.preventDefault();
		$(".nameModal").hide();
	})
//-----------------------------------------------------------	
</script>
</html>






