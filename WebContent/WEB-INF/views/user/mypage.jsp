<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${root}css/mypage.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <script deffer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
body {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	background: rgb(243, 240, 255) !important;
	font-family: 'Courier New', Courier, monospace;
	
}

#logo2 {
    width:7%;
}

form>#myinfo_update {
	background: rgb(243, 240, 255);
	border: 2px solid rgb(43, 171, 180);
	border-radius: 20px;
	color: rgb(43, 171, 180);
	margin: 0% 0% 3% 60%;
	width: 12%;
	padding: 0.5% 0%;
	font-weight: 700;
	cursor: pointer;
}

#myinfo-update:focus {
	outline: none;
}
#my-page{
	margin-bottom: 2%;
	font-size: 4.2em;
}
#welcome{
	font-size: 1.4em;
}
#my-info2{
	font-size: 1.2em;
}
#link{
	width: 60%;
	margin:3% 0% 3% 0%;
}
#link a{
	text-decoration:none;
	color: black;
}
#more-comment{
	border: 1px solid black;
	text-indent: 30%;
	margin: 10% 0% 0% 30%;
	background: rgb(43, 171, 180);
	border: 2px solid rgb(43, 171, 180);
	color: whitesmoke;
	width: 20%;
	padding: 0.5% 1%;
}
li{
	margin-bottom:4%;
	
}

#hr{
	border-bottom: 2.5px solid orange;
	margin-bottom: 3%;
}
li img {
	width: 15%;
	height: 15%;
	border-radius: 50%;
}

</style>

</head>
<body>
	 <c:import url="/WEB-INF/views/user/login.jsp"/>
	 <c:import url="/WEB-INF/views/headlogo.jsp"/>

    <div id="my-page">My Page  </div>
    <div id="welcome">${userbean.t_user_name}님 환영합니다!</div>

    <span id="my-info">내 정보</span>
    <hr>
      
        <ul id="my-info2">
            <li>아이디 : ${userbean.t_user_id}</li>
            <li>이메일 : ${userbean.t_user_email}</li>
            <li>연락처 : ${userbean.t_user_tel}</li>
        </ul>
        
        <form action="${root}user/pw_check" method="get">
         <input type="submit" value="내 정보 수정" id="myinfo_update">
         <input type="hidden" name="pw_check_code" value="update">
         <input type="hidden" name="t_user_id" value="${userbean.t_user_id}">
      </form>
        
        <span id="check-boardwrite">내 작성글 확인</span>
        <hr>
        <ul id="my-boardwrite">
        <!------------ 내 작성 글 확인 ------------------>
        
        <!--코멘트 없을경우-->
        <c:if test="${empty li }"></c:if>
        
        
        <!--후기 미리보기 4개만 띄움-->
        <c:forEach var="my" items="${li }" begin="0" end="3">
        
            <li id="li"><img src="${root }images/${my.t_com_profileimg }.png" >${my.t_user_id}
              <!-- 하이퍼 링크로 클릭하면 해당 화장실 페이지로 이동하게 함 -->
              <span>|&nbsp; ${my.t_com_date } &nbsp; |&nbsp; 내가 준 별점 ${my.t_com_score } </span>
              
              <div id="link">
	              <a href="${root }toilet/detail?t_no=${my.t_no}&t_user_id=${my.t_user_id}">
	                ${my.t_com_com } 
	               </a>
             </div>

                </li>
                <hr id="hr">
         </c:forEach>   
      	
         
         </ul>
         <!--내 코멘트 리스트로 이동-->
      <a  id="more-comment" href="${root }user/my_commentlist?t_user_id=${userbean.t_user_id}">내 후기 더보기</a>         
         <hr>

         
         <!--------------------------------------->       
                
        
        <form action="${root}user/pw_check" method="get">
         <input type="submit" value="탈퇴" id="leave">
         <input type="hidden" name="pw_check_code" value="delete">
         <input type="hidden" name="t_user_id" value="${userbean.t_user_id}">
      </form>
        <footer>
            <div>
                
                <div class="footer">
                <p>서울특별시 종로구 종로12길 15 5층 (관철동 13-13)</p>
                <p>사업자번호: 012-34-67890 | 통신판매업: 서울-종로-1111<br>
                    대표 전화: 2020-1030 | 팩스: 050-1234-5678<br>
                    대표 메일: zipuragi@zip.com
                </p>
                    
                <p>Copyright©ZIPURAGI ALL RIGHTS RESERVED</p>
                <a id="use">
                <span>이용 약관 | 개인 정보 처리 방침 | 청소년 보호 정책 | 사업자 정보 확인</span>
                </a>
               <br>
               <br>
                </div>
            </div>
        </footer>
</body>
</html>