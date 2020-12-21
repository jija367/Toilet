<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${root}css/sub.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <style>
		/* header */
		header {
			padding-top: 5%;
			padding-bottom: 1%;
			background-image: url('${root}/images/화장실1.png');
			background-position-y: 35%;
		}
		body{
		    margin: 0 auto;
		    width:100%; height:100%;
		    font-family:'Courier New', Courier, monospace !important;
		    background-color: mintcream !important;
		}
		#magnifier {
    		background: url("${root}images/search2.png") no-repeat;
    		background-size: 60%;
    		background-position: 20% 20%;
    		border:none;
    		width:7%;
    		height:100px;
    		cursor: pointer;
    		margin-bottom: -2.5%;
    	}
    	#logo1{
    	cursor: pointer;
    	}
    	#btnc {
    	border:1px solid rgb(128, 128, 128);
    	}
    	#good{
    		background: lemonchiffon;
    		color: black;
    		font-size: 1.2em;
    		padding: 1%;
    		border-radius: 5px;
    	}
    	.addr{
    		background-color: rgb(74, 211, 188);
    	}
    	
		#addr1{
			font-size: 1.8em;
		}
		#addr2{
			font-size: 1.3em;
		}
		
		#btnc{
			background: rgb(206, 243, 242);
		    border: 1px solid rgb(170, 173, 173) ;
		}
		
	
	</style>
</head>
<body bgcolor="mintcream">
	
	<c:import url="/WEB-INF/views/user/login.jsp"/>
	<c:import url="/WEB-INF/views/user/scrollup.jsp"/>

    <header>
        <!-- 로고 -->
       <div class="logos" >
		<img src="${root}images/지푸라기.png" id="logo1" width="16%" height="10%" onclick="on()">
		<img src="${root}images/logo.png" id="logo2" width="8%" height="10%">
	</div>
        <!-- 검색창 -->
        <form name="form" action="${root }toilet/list" method="get">
			<input type="hidden" name="t_user_id" value="${t_user_id }">
			<div class="searchbar">
				<input type="search" name="searchKey" id="search" placeholder="ex) 종로구"> 
				<input type="submit" value="" id="magnifier">
			</div>
		</form>
    </header>
    
    <!-- 지역 -->
    <p id="locallist">${searchKey } <img src="${root}images/toilet.png" id="man-woman">&nbsp;검색결과</p>
    
    <!-- 체크박스 -->
	<form action="${root }toilet/list" method="get">
		<div class="checkbox-container">
			<input type="checkbox" id="check01" onclick="t_sebu3(this)" name="handicap" value="1"> 
			<label for="check01">장애인칸 포함</label> 
			<input id="check02" type="checkbox" onclick="t_sebu1(this)" name="mwm" value="N"> 
			<label for="check02">남여분리형</label> 
			<input id="check03" type="checkbox" onclick="t_sebu2(this)" name="child" value="1"> 
			<label for="check03">어린이 칸 포함</label> 
			<input type="hidden" name="searchKey" value="${searchKey }"> 
			<input type="hidden" name="t_user_id" value="${t_user_id }"> 
			<input type="hidden" name="current_page_num" value="1">
			    <!-- 위도, 경도 추가 -->
	         <input type="hidden" name="t_la" value="${t_la }">
	         <input type="hidden" name="t_lo" value="${t_lo }"> 
		</div>
		<div class="dashline">
			<input type="submit" id="btnc" value="상세검색">
		</div>
	</form>
	
	<!-- list -->
	<!-- 모두 체크 안되어있을경우 -->
	<c:if test="${child ==0 && handicap ==0 && mwm eq 'Y'}">
		<c:forEach var="t" items="${li }">
			<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
				<div class="addr">
					<p id="addr1">${t.t_name}</p>
					<p id="addr2">${t.t_nm_name }</p>
					<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
				</div>
			</a>
			<br>
		</c:forEach>
	</c:if>
    
    <!-- 남녀분리만 체크시 -->
	<c:if test="${mwm eq 'N' && handicap==0 && child ==0}">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${t.t_mwm eq 'N' }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
							<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>
	
	<!-- 장애인만 체크시 -->
	<c:if test="${mwm eq 'Y' && handicap>0 && child ==0}">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
							<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>

	<!-- 어린이만 체크시 -->
	<c:if test="${mwm eq 'Y' && handicap==0 && child >0 }">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${(t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
						<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>
	
	<!-- 남녀분리, 장애인 체크시 -->
	<c:if test="${mwm eq 'N' && handicap >0  && child ==0 }">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${t.t_mwm eq 'N' && (t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
						<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>

	<!-- 남녀분리, 어린이용 체크시 -->
	<c:if test="${mwm eq 'N' && handicap ==0  && child >0 }">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${t.t_mwm eq 'N' && (t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
						<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div> 
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>

	<!-- 장애인, 어린이용 체크시 -->
	<c:if test="${mwm eq 'Y' && handicap >0  && child >0 }">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap && (t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
							<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>

	<!-- 모두 체크시 -->
	<c:if test="${mwm eq 'N' && handicap >0  && child >0 }">
		<c:forEach var="t" items="${li }">
			<c:choose>
				<c:when test="${t.t_mwm eq 'N' && (t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap && (t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
					<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}" id="underline">
						<div class="addr">
							<p id="addr1">${t.t_name}</p>
							<p id="addr2">${t.t_nm_name }</p>
						<span id="good">댓글 ${t.t_user_count } | 총 별점 ★ ${t.t_com_score }</span>
						</div>
					</a>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>

	<!-- footer -->
    <footer>
        <div>
            <div class="footer">
                <p>서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
                <p>사업자번호: 012-34-67890 | 통신판매업: 서울-종로-1111<br>
                    대표 전화: 2020-1030 | 팩스: 050-1234-5678 | 대표 메일: zipuragi@zip.com
                </p>

                <p>Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>
                <a id="use">
                    <span>이용 약관 | 개인 정보 처리 방침 | 청소년 보호 정책 | 사업자 정보 확인</span>
                </a>
                <br>
                <br>
            </div>
        </div>
    </footer>
    
    <script type="text/javascript">
    function on() {
		location.href="${root}main?t_user_id=${t_user_id}";
	}
    
    </script>
</body>
</html>