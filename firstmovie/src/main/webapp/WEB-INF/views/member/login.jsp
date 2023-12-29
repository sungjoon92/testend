<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="/css/login.css" />
<!-- 네이버 로그인에 필요한 라이브러리 시작 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 네이버 로그인에 필요한 라이브러리 끝 -->
<!-- 카카오 로그인에 필요한 라이브러리 시작 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 카카오 로그인에 필요한 라이브러리 끝 -->

	<form method="post" id="myForm" action="login.do" onsubmit="return logincheck();"> 
	 <!-- <form> 시작 -->
	 <div class="logwrap">
	 	<div class="login">
	 		<a href="/main"><img alt="" src="/images/header/logo.png"></a>
	 	</div>
	 	<div class="loginput">
	 	<div class="userid">
		     <input id="member_id" type="text" name="member_id" value="">
		</div>
		<div class="userpw">
		     <input id="member_pw" type="password" name="member_pw">
		 </div>
 	</div>
 	<div>
 		<span>
	    <input type="checkbox" id="idcheckbox" name="idcheckbox">
	    <label class="check_label" for="idcheckbox" th:onclick="toggleCheckbox()" onselectstart="return false;">아이디저장</label>
	    </span>
	    <span>
		    <a href="/member/member.do">회원가입 | </a>
		    <a href="#">아이디찾기 | </a>
		    <a href="#">비밀번호찾기</a>
	    </span>
	</div>
	<div class="logbox">
		<button class="fmos" type="submit">5분1초</button>
		<a href="#" id="naver_id_login"></a>
		<a><img alt="" src="/images/naver_login.png"></a>
		<a href="javascript:kakaoLogin();" class="kakaobutt"><img alt="" src="/images/kakao_login.png"></a>
	</div>
 </div>
 </form> <!-- form 끝 -->
 
<!-- 버튼별 submit url 생성 기능 시작 -->
  <script>
  function submitForm(url) {
      // 버튼 클릭시 해당 URL로 폼을 제출
      document.getElementById('myForm').action = url;
      document.getElementById('myForm').submit();
  }
  </script>
<!-- 버튼별 submit url 생성 기능 시작 -->

<!-- 네이버 로그인 시작 -->
	  <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("McJvK_Tuse_oW1YOJ1Oi", "http://localhost:9095/member/login.do");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("http://localhost:9095/login.do");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	  	
	  	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  	  function naverSignInCallback() {
	  	    var member_email = naver_id_login.getProfileData('email');
	  	    var member_name = naver_id_login.getProfileData('name');
	  	    var member_gender = naver_id_login.getProfileData('gender');
	  	    
		  	  const redirectUrl = 'http://localhost:9095/member/social_log' +
	          '?member_name=' + encodeURIComponent(member_name) +
	          '&member_email=' + encodeURIComponent(member_email);
	          '&member_gender=' + encodeURIComponent(member_gender);
			   window.location.href = redirectUrl;
	  	  }
	  	  
	 // 네이버 로그아웃 : http://nid.naver.com/nidlogin.logout
	  </script>
	  
<!-- 네이버 로그인 끝 -->

<!-- 카카오 로그인 시작 -->
	<script>
    	window.Kakao.init("f95805f8f77d9deff00c93e10ba90efb");

	    document.getElementById("kakaoLoginButton").addEventListener("click", function() {
	        kakaoLogin();
	    });

    function kakaoLogin(){
        Kakao.Auth.login({
            scope:'profile_nickname, account_email, gender',
            success: function(authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url:'/v2/user/me',
                    success: res => {
                        const kakao_account = res.kakao_account;
                        const member_name = res.kakao_account.profile.nickname;
                        const member_email = res.kakao_account.email;
 						const member_gender = res.kakao_account.gender;                        
                        console.log(kakao_account);
                        console.log(Kakao.Auth.getAccessToken())
                        if(res.kakao_account.gender == 'male') { 
                        	const kakao_gender = 0;
                        } else{
                        	const kakao_gender = 1;
                        }
                        const redirectUrl = 'http://localhost:9095/member/social_log' +
                        '?member_name=' + encodeURIComponent(member_name) +
                        '&member_email=' + encodeURIComponent(member_email);
                        '&member_gender=' + encodeURIComponent(member_gender);
        				 window.location.href = redirectUrl;
        				 
       	            }
                });
            }
        });
    }
    function Logout(){
        sessionStorage.clear();
    }
    // 카카오 로그아웃: https://developers.kakao.com/logout
</script>
<!-- 카카오 로그인 끝 -->

<!-- 아이디,비밀번호 5~15글자 제약 시작 -->
  <script>
        function logincheck() {
        	var member_id = document.getElementById("member_id").value;
        	var member_pw = document.getElementById("member_pw").value;
        	
            if(member_id.length < 4 || member_id.length >= 15) {
            	alert("아이디는 5~15 글자로 작성해주세요");
            	return false;
            } 
            if(member_pw.length < 4 || member_pw.length >= 15) {
            	alert("비밀번호는 5~15 글자로 작성해주세요")
            	return false;
            }
            return true;
        }
  </script>
<!-- 아이디,비밀번호 5~15글자 제약 시작 끝 -->
 
<!-- 쿠키 가져오기 + 아이디저장 기능 관련 시작 -->
<script>
	function getCookie(cookieName) {
	    const name = cookieName + "=";
	    const decodedCookie = decodeURIComponent(document.cookie);
	    const cookieArray = decodedCookie.split(';');
	
	    for (let i = 0; i < cookieArray.length; i++) {
	        let cookie = cookieArray[i].trim();
	        if (cookie.indexOf(name) === 0) {
	            return cookie.substring(name.length, cookie.length);
	        }
	    }
	
	    return "";
	}
	
	// 사용 예시
	const cIDCookie = getCookie("c_id");
	const idCheckcookie = getCookie("idcheck");
	const idcheckbox = document.getElementById("idcheckbox");
	document.getElementById("member_id").value = cIDCookie;

	if (idCheckcookie === "1") {
		idcheckbox.checked = true;
	}
<!-- 쿠키 가져오기 + 아이디저장 기능 관련 끝 -->	
</script>

<!-- ID저장 checkbox 체크시1 체크안할시2가 출력되도록 해주는 기능 시작 -->
 	 <script>
		 var checkbox = document.getElementById("idcheckbox"); 
		
		 function CheckboxChange(checkbox) {
			    if (checkbox.checked) {
			      checkbox.value = "1";
			      console.log(checkbox.value);
			    } else {
			      checkbox.value = "2";
			      console.log(checkbox.value);
			    }
			  }

			  // 각 체크박스에 이벤트 리스너를 등록합니다.
			  checkbox.addEventListener("change", function() {
			  CheckboxChange(checkbox);
			  });
	</script>
 <!-- ID저장 checkbox 체크시 2 체크 안할시 1이 출력되도록 해주는 기능 시작 -->
 
<%@ include file="../footer.jsp" %>