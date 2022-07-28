//다음 주소찾기 api
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("seealso").value = extraAddr;
            
            } else {
                document.getElementById("seealso").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postnum').value = data.zonecode;
            document.getElementById("addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailaddress").focus();
        }
    }).open();
}

//아이디 중복체크 및 이메일 정규식
function checkId(){
	let useremail = $("#useremail").val();
	let idCheck = document.getElementsByClassName("idCheck");
	let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	$.ajax({
		url:'/user/checkId',   //데이터를 주고받을 파일 주소
		type:'post',   //post 방식으로 전송
		data:{useremail:useremail},   //위의 변수에 담긴 데이터를 전송해준다.
		dataType:'JSON',   //JSON 타입으로 값을 담아온다.
		success : function(cnt){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
			if(useremail.length < 1 && cnt != 1){
				idCheck[0].textContent = "아이디를 입력해주세요";
			}
			else if(!regEmail.test(useremail)){
				idCheck[0].textContent = "이메일 형식으로 입력해주세요.";
			}
			else if(cnt != 1 && regEmail.test(useremail)){
				 idCheck[0].textContent = "사용할 수 있는 아이디입니다.";
			}
			 else{
				 idCheck[0].textContent = "중복된 아이디입니다.";
			 }
		},
		error:function(){
			console.log("처리실패")
		}
	});
}

//비밀번호 유효성체크
function checkPw(){
	let userpw = $("#userpw").val();
	let checkNumber = userpw.search(/[0-9]/g);
	let checkEnglish = userpw.search(/[a-z]/ig);
	let pwCheck = $(".pwCheck");
	let userpwCheck = $("#userpw_re").val();
	
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
    else{
    	pwCheck[0].textContent = "";
    }
}

function checkPW(){
	let userpwCheck = $("#userpw_re").val();
	let userpw = $("#userpw").val();
	let pwre = $(".pwRe");
	
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
//전화번호 문자인증
$("#randomnum").on("click",function(e){
	let userphone = $("#userphone").val();
	let numselect = $(".numselect");
	let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(userphone == "" || !regPhone.test(userphone)){
		alert("전화번호를 제대로 입력해주세요");
		return false;
	}
	$.ajax({
		type:'post',
		url:'/user/message',
		data:{userphone:userphone},
		dataType:'JSON',
		success : function(num){   //파일 주고받기가 성공했을 경우. 변수 안에 값을 담아온다.
			$("#randomnumcheck").on("click",function(e){
				let phonecheck = $("#phonecheck").val();
				e.preventDefault();
				if($.trim(num) == phonecheck){
					alert("전화번호 인증 완료");
					numselect[0].textContent = "인증 완료";
				}
				else if($.trim(num) != phonecheck){
					alert("인증번호가 틀립니다.");
					numselect[0].textContent = "인증번호가 틀립니다.";
				}
			})
		},
		error:function(){
			console.log("처리실패")
		}
	});
})


//회원가입 유효성
$("#joinSubmit").on("click",function(e){
	const joinForm = $("#joinForm");
	let numselect = $(".numselect");
	let useremail = $("#useremail").val();
	let idCheck = document.getElementsByClassName("idCheck");
	let userphone = $("#userphone").val();
	let phonecheck = $("#phonecheck").val();
	let userpw = $("#userpw").val();
	let userpwCheck = $("#userpw_re").val();
	let username = $("#username").val();
	let postnum = $("#postnum").val();
	let detailaddress = $("#detailaddress").val();
	let checkNumber = userpw.search(/[0-9]/g);
	let checkEnglish = userpw.search(/[a-z]/ig);
	let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	e.preventDefault();
	if(useremail == ""){
		alert("아이디를 입력해주세요");
	}
	else if(idCheck[0].textContent == "중복된 아이디입니다."){
		alert("중복된 아이디입니다.");
	}
	else if(!regEmail.test(useremail)){
		alert("이메일 형식으로 작성해주세요");
	}
	else if(userpw == ""){
		alert("비밀번호를 입력해주세요");
	}
    else  if(!/^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userpw)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        return false;
    }
    else if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        return false;
    }
    else if(/(\w)\1\1\1/.test(userpw)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        return false;
    }
    else if(userpwCheck == ""){
    	alert("비밀번호 확인을 해주세요");
    }
    else if(userpwCheck != userpw){
    	alert("비밀번호가 틀립니다. 비밀번호 확인을 다시 해주세요");
    }
    else if(username == ""){
    	alert("이름을 입력해주세요");
    }
    else if(postnum ==""){
    	alert("우편번호를 입력해주세요");
    }
    else if(detailaddress == ""){
    	alert("상세주소를 입력해주세요");
    }
    else if(numselect[0].textContent = "인증번호가 틀립니다." || phonecheck == ""){
    		alert("전화번호 인증을 완료해주세요");
    }
    else{
    	joinForm.attr("action","/user/join");
    	joinForm.submit();
    }
})




