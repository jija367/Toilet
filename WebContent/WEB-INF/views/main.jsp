<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script deffer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>index</title>
<link rel="stylesheet" href="${root}css/index.css" />
<link rel="stylesheet" href="${root}fullpage/fullpage.min.css" />
<script src="./fullpage//fullpage.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
	<style>
#magnifier {
	background: url("${root}images/search1.png") no-repeat;
	background-size: 60%;
	background-position: 20% 20%;
	border: none;
	width: 7%;
	height: 100px;
	cursor: pointer;
	margin-bottom: -2.5%;
}

#current-location-btn {
	font-size: 1.4em;
	background: url("${root}images/location.png") no-repeat;
	background-size: 60%;
	background-position: 20% 20%;
	border: none;
	width: 7%;
	height: 100px;
	cursor: pointer;
	margin-bottom: -2.5%;
}

.logos {
	margin-top: -2% !important;
}

#logo1 {
	cursor: pointer;
}

#current-location-btn:focus {
	outline: none;
}
.sidebar>form>#btn2 {
	margin-top: 5%;
	margin-left: 5%;
	color: rgb(56,56,56);
	background-color: rgb(74, 211, 188);
	border: 1px solid rgb(63, 180, 176);
	/* background-color:rgb(49, 191, 238);
    border: 1px solid rgb(63, 180, 176); */
	width: 30%;
	height: 55px;
}


.sidebar>form>#btn3 {
	margin-top: 5%;
	margin-left: 15%;
	width: 30%;
	height: 55px;
	color: rgb(56,56,56);
	background-color: rgb(74, 211, 188);
	border: 1px solid rgb(63, 180, 176);
}

.sidebar>form>#btn4 {
	margin-top: 5%;
	margin-left: 5%;
	width: 30%;
	height: 55px;
}
.footer-content{
    height:60%;
    float: left;
    margin-right: 15%;
    border-right: 5px solid white;
    padding-top:5%;
    padding-right:8%;
}
</style>
</head>
<body>
	<div id="full-page">
		<div class="section s0">
			
			<c:import url="/WEB-INF/views/headlogo.jsp"/>
			
			<div class="message1">
				<p id="message1">
					그대여<br>울지마요<br>다 왔어요...
				</p>
			</div>
			<!-- 검색창 -->
			<form name="form" action="${root }toilet/list" method="get">
				<input type="hidden" name="t_user_id" value="${t_user_id }">
				<div class="searchbar">
					<input type="search" name="searchKey" id="search" placeholder="ex) 종로구"> 
					<input type="submit" value="" id="magnifier">
					<input type="button" value="" id="current-location-btn"  onclick="gps()">
					<%-- <img id="location-img" src="${root }images/location.png" width="5%" height="12%"></button> --%>
				</div>
			</form>
			<div class="pagedown">
				<div class="updown">
					<img src="${root}images/click.png" id="down">
				</div>
				<br>
				<br>
				<br> 
				<img id="scrollplz" src="${root}images/스크롤.png" width="12%" height="12%">
			</div>

			<input type="checkbox" id="menuicon">
			<label for="menuicon"> 
				<span></span> 
				<span></span> 
				<span></span>
			</label>
			<div class="sidebar">
				<img src="${root}images/화장실로고.png" id="image">

				<c:if test="${empty t_user_id}">
					<h1>로그인</h1>
					<form name="form" action="${root }user/loginpass" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td><input id="id" type="text" name="t_user_id"></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input id="pw" type="password" name="t_user_pw"></td>
							</tr>
						</table>
						<input type="submit" value="로그인" id="btn1"> 
						<input type="button" value="회원가입" id="btn2" onclick="location.href='${root}user/join'">
						<!-- id, pw 찾기 -->
						<input type="button" value="아이디 찾기" id="btn3" onclick="location.href='${root }user/id_search?searchKey=id_search'">
						<input type="button" value="비밀번호 찾기" id="btn4" onclick="location.href='${root}user/id_search?searchKey=pw_search'">
					</form>
				</c:if>
				<c:if test="${not empty t_user_id}">
					<h1 id="h1_2">로그인 완료</h1>
					<form name="form" action="${root }user/logout" method="get">
						<input type="submit" value="로그아웃" id="btn1"> 
						<input type="button" value="마이페이지" id="btn2" onclick="location.href='${root}user/mypage?t_user_id=${t_user_id}'">
						
					</form>
				</c:if>
			</div>
		</div>
		
		<div class="section s1">
            <c:import url="/WEB-INF/views/headlogo.jsp"/>
            <table>
                <tr>
                    <td onclick="local(this)">강동구</td>
                    <td onclick="local(this)">강서구</td>
                    <td onclick="local(this)">강남구</td>
                    <td onclick="local(this)">강북구</td>
                    <td onclick="local(this)">관악구</td>
                </tr>
                <tr>
                    <td onclick="local(this)">광진구</td>
                    <td onclick="local(this)">구로구</td>
                    <td onclick="local(this)">금천구</td>
                    <td onclick="local(this)">노원구</td>
                    <td onclick="local(this)">도봉구</td>
                </tr>
                <tr>
                    <td onclick="local(this)">동대문구</td>
                    <td onclick="local(this)">동작구</td>
                    <td onclick="local(this)">마포구</td>
                    <td onclick="local(this)">서대문구</td>
                    <td onclick="local(this)">서초구</td>
                </tr>
                <tr>
                    <td onclick="local(this)">성동구</td>
                    <td onclick="local(this)">성북구</td>
                    <td onclick="local(this)">송파구</td>
                    <td onclick="local(this)">양천구</td>
                    <td onclick="local(this)">영등포구</td>
                </tr>
                <tr>
                    <td onclick="local(this)">용산구</td>
                    <td onclick="local(this)">은평구</td>
                    <td onclick="local(this)">종로구</td>
                    <td onclick="local(this)">중구</td>
                    <td onclick="local(this)">중랑구</td>
                </tr>
            </table>

            <div class="pagedown">
                <div class="updown">
                    <img src="${root}images/click.png" id="down">
                </div>
            </div>
        </div>
        
        <div class="section s2">
            <div class="footer-content">
                <h2>(주)지푸라기</h2>
	                <p>서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
	                <p>사업자번호: 012-34-67890<br>
	                    	통신판매업: 서울-종로-1111
	                </p>
	                <p>대표 전화: 2020-1030 | 팩스: 050-1234-5678<br>
	                   	대표 메일: zipuragi@zip.com
	                </p>
	                <p>Copyright©ZIPURAGI ALL RIGHTS RESERVED</p>
       
            </div>

            <div class="toilet-pic">
                <img src="${root}images/toilet1.png" width="25%" height="25%">
            </div>
        </div>
	</div>

	<script type="text/javascript">
	
		// 로그인 되면 로그아웃으로 바꿔줌
		window.onload = function() {
			var id = document.form.t_user_id;
			var login = document.getElementById("login");
			if (id.value.length >= 2) {
				login.innerHTML = "로그아웃";
				login.href = "${root}user/logout";
			}
		}
		// full-page section
		new fullpage('#full-page',
				{
					licenseKey : '', //디폴트 값
					sectionsColor : [' rgb(74, 211, 188)','rgb(74, 211, 188)', //배경색
							'rgb(74, 211, 188)' ],
					navigation : true, //네비게이션 사용
					navigationTooltips : [ 'Home', 'To Where', 'About Us' ], //사이드 툴팁 
					scrollingSpeed : 1000, //스크롤 속도
					
				
				});
		
		// 구 리스트 클릭시 리스트페이지 이동하는 함수
        function local(a){
           location.href="${root }toilet/list?t_user_id=${t_user_id }&searchKey="+a.innerHTML;
        }
		
/////////// 현위치 찾아주는 함수 //////////////////////////////
        function gps(){
              if (navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(function(pos) {
                     var t_la = pos.coords.latitude;
                     var t_lo = pos.coords.longitude;
                     //alert("현재 위치는 : " + t_la + ", "+ t_lo);
                    location.href="${root}toilet/list?t_user_id=${t_user_id }&t_la="+t_la+"&t_lo="+t_lo;
                 });
        
              } else {
                  alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
              }
        }

	</script>
</body>
</html>



	<%-- <c:if test="${t_user_id eq null }">

<a href="${root }user/join">가입</a><br>
<a href="${root }user/select">회원조회</a><br>
<a id="login" href="${root }user/login">로그인</a><br>



<form name="form" action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="화장실검색">
</form>

</c:if>

<!----------- 로그인 하면 뜨는 링크------------->
<c:if test="${not empty t_user_id}">

<a id="login" href="${root }user/login">로그인</a><br>
<a href="${root }user/user_update?t_user_id=${t_user_id}">정보수정</a><br>
<a href="${root }user/user_delete?t_user_id=${t_user_id}">탈퇴</a><br>

<form name="form" action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="화장실검색">
</form>

</c:if> --%>


 <!-- // 스크롤 시작시 실행
					onLeave : function(origin, destination, direction) {
						// console.log("onLeave",origin.index,destination.index);
						if (origin.index == 1) {
							$('.s1 h3').hide();
						}

					},
					//스크롤 끝낼 때 실행
					afterLoad : function(origin, destination, direction) {//(원 섹션(첫 번째),이동한 섹션,스크롤 방향)
						// console.log("afterLoad")
						if (destination.index == 1) {
							$('.s1 h3').show();
						}
					}
  -->
