<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Myshop</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link href="/resources/css/styles.css" rel="stylesheet" />
 <link href="/resources/css/product/board.css" rel="stylesheet" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
<style>
		.zipModal{
			position: absolute;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.8);
			top:0;
			left:0;
			display:none;
		}
		.zipModal_body {
		  position: absolute;
		  top: 50%;
		  left: 50%;
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
		    padding: 2px;
		    text-align: center;
		    width:15%;
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
		.py-5 .bg-dark{
			margin-top:90px;
		}

</style>
</head>
<body>
<!-- nav 시작 -->
<%@include file="../user/nav.jsp" %>
<!-- nav 끝 -->
        <div class="main">
        	<div class="container">
        		<div class="row margin-bottom-40">
        			<div class="col-md-9 col-sm-7">
        				<div class="product-page">
        					<div class="row">
        						<div class="col-md-6 col-sm-6">
        							<div class="product-main-img" style="position: relative; overflow:hidden;">
        								<img src="/resources/img/${filename}" class="img-responsive">
        							</div>
        						</div>
        						<div class="col-md-6 col-sm-6">
        							<h1>${product.productname}</h1>
        							<div class="price-availability-block clearfix">
        								<div class="price">
        									<strong>
        										${product.productprice}원
        									</strong>
        								</div>
        							</div>
        							<form action="/user/buyproduct">
        							<div id="container" class="container">
										<div id="content" class="content">
											<div class="subindex_wrap" role="main">
			        							<div class="subindex_item">
													<div class="subindex_onebox">
														<div class="onebox_title desc">
															<h2 class="subindex_title">내 주소 보기</h2>
														</div>
														<button type="button" class="link_right">
															<span class="case">보러가기</span>
														</button>>
														<div class="subindex_desc">구매 하시기전에 배송지를 설정해주세요~~</div>
													</div>
												</div>
											</div>
										</div>
									</div>
        							<input type="hidden" value="${product.productnum}">
        							<div class="product-page-cart">
        								<div class="product-quantity">
        									<button class="btn btn-primary buy" type="submit">구매하기</button>
        								</div>
        							</div>
        							</form>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <div class="textarea-div">
        <textarea rows="10" cols="10" readonly style="word-break:break-all;width:100%;text-align:center;">${product.productcontents}</textarea>
        </div>
        
        <!-- 리뷰 작성 -->
		<button type="button" name="review" id="onReview">리뷰 작성하기</button>
		<div class="product-page-content" id="review" style="display:none;">
			<ul id="myTap" class="nav nav-tabs">
				<li class="active">
					<a href="#" data-togle="tab">리뷰</a>
				</li>
			</ul>
			 <div class="tab-content" style="width:100%;">
				<div class="tab-pane fade in active">
					<div class="review-item clearfix">
						<div class="review-item-submitted">
							<strong>작성자 이름</strong>
							<em>작성 시간</em>
						</div>
						<div class="reivew-item-content">
							<p>리뷰 내용</p>
						</div>
					</div>
					<form class="reviews-form" role="form">
						<h2>리뷰 작성</h2>
						<div class="form-group">
							<label for="username">
								이름
								<span class="require"></span>
							</label>
							<input type="text" class="form-control" id="username" value="${loginUsername}" readonly style="width:14%;">
						</div>
						<div class="form-group">
							<label for="useremail">Email</label>
							<input type="text" value="${loginUserid}" id="useremail" readonly>
						</div>
						<div class="form-group">
							<label for="review">리뷰</label>
							<textarea class="form-control" rows="8" id="review" style="word-break:break-all;width:100%;text-align:center;"></textarea>
						</div>
						<div class="padding-top-20">
							<button type="submit" class="btn btn-primary">작성하기</button>
						</div>
					</form>
				</div>
			</div> 
		</div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        
        <!-- 우편번호 Modal -->
        <form action="/" method="get" class="buyForm">
        </form>
        <div class="zipModal">
			<div class="zipModal_body">
				<div class="wrapper style1 special">
					<div class="inner">
					<form name="buy">
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
										<input type="submit" id="zipSubmit" value="이 배송지로 받기">
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
<script src="/resources/js/board.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script>
let postnum = $("#postnum").val();
let addr = $("#addr").val();
let seealsos = $("#seealso").val();
let detailaddress = $("detailaddress").val();
let useremail = "${loginUserid}";
let productnum = "${product.productnum}";
let productname = "${product.productname}";
let productprice = "${product.productprice}";
let username = "${loginUsername}";
let buyForm = $(".buyForm");
//구매하기 클릭시 이벤트
 $(".buy").on("click",function(e){
	 postnum = $("#postnum").val();
	 addr = $("#addr").val();
	 detailaddress = $("#detailaddress").val();
	 seealso = $("#seealso").val();
	if(useremail == ""){
		alert("로그인 후 진행해주세요");
		return false;
	}
	e.preventDefault();
	productService.add(
			{useremail:useremail,username:username,productnum:productnum,productname:productname,postnum:postnum
				,addr:addr,detailaddress:detailaddress,seealso:seealso
			},
			function(result){
				alert(productname+"상품 구매완료");				
			}
	);
	
});

// 주소 보러가기 클릭시 미 로그인 상태라면 alert창 띄움
$(".link_right").on("click",function(e){
	let useremail = "${loginUserid}";
	
	if(useremail == ""){
		alert("로그인 후 이용해주세요");
		return false;
	}
	
//로그인 되어있다면 모달창 띄우기
		e.preventDefault();
		$(".zipModal").show();
	});

//모달창 나가기 클릭시 모달창을 닫아주면서 입력 된 값들을 초기로 돌려준다.
$("#zipCancle").on("click",function(e){
	e.preventDefault();
	$(".zipModal").hide();
	$("[name = 'postnum']").val("${postnum}");
	$("[name = 'addr']").val("${addr}");
	$("[name = 'detailaddress']").val("${detailaddress}");
	$("[name = 'seealso']").val("${seealso}");
});

//이 주소로 받기 클릭시 유효성검사를하고 모두 통과한다면 모달창을 닫아준다.
$("#zipSubmit").on("click",function(e){
	e.preventDefault();
	const zipForm = $(".zipForm");
	
	let npostnum = $("#postnum").val();
	let ndetailaddress = $("#detailaddress").val();

	if(postnum ==""){
    	alert("우편번호를 입력해주세요");
    }
    else if(detailaddress == ""){
    	alert("상세주소를 입력해주세요");
    }
    else{
    	$(".zipModal").hide();
    }
});

$("#onReview").on("click",function(e){
	e.preventDefault();
	
})
</script>
</html>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        