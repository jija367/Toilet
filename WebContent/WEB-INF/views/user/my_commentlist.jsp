<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>my-comment</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<%-- <link rel="stylesheet" href="${root}css/review.css"> --%>
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

<style type="text/css">
body {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background: rgb(243, 240, 255) !important;
	font-family: 'Courier New', Courier, monospace !important;
}

h1 {
	text-align: center;
	margin: 3% 0% 3% 0%;
	padding-bottom: 2%;
	font-size: 2em;
}

#logo1 {
	cursor: pointer;
}

#empty-review-page {
	font-size: 1.5em;
	margin: 5% 0% 5% 32%;
	color: navy;
}

#profile-pic {
	width: 15%;
	border-radius: 50%;
}

ul {
	list-style-type: none;
	margin: 25%;
	font-size: 1.4em;
	width: 80%;
}
li{
	width: 75%;
}

#link {
	width: 90%;
	margin: 6% 0% 6% 0%;
}

#link a {
	text-decoration: none;
	color: navy;
}

#check-boardwrite {
	margin-bottom: 2%;
	font-size: 2.8em;
	text-align: center;
}

#profile-pic {
	margin-right: 5%;
}

#page-no {
	margin: 5% 0% 3% 38%;
	font-size: 1.4em;
}

#current-no {
	margin: 0% 2%;
}

#back {
	border: 1px solid black;
	text-indent: 30%;
	margin: 10% 0% 0% 30%;
	background: rgb(43, 171, 180);
	border: 2px solid rgb(43, 171, 180);
	color: whitesmoke;
	width: 20%;
	padding: 0.5% 1%;
}

#copyright {
	margin: 4% 0% 2% 40%;
}
#like-pic {
	width: 3%;
	margin-right: 2%;
}
#hr{
	border: 2.5px solid orange;
	margin-right: 35%;
}

</style>

<script type="text/javascript">

window.onload=function(){
	var page = document.getElementsByClassName("page");

	var c = '${pagenumbean.current_page_num}';

	for (var i = 0; i < page.length; i++) {
		var pagenum = parseInt(page[i].innerHTML);
		if (pagenum == c) {
			page[i].style.color = "red";
			page[i].style.fontWeight = "bold";
		} else {
			page[i].style.color = "black";
			page[i].style.fontWeight = "bold";
		}
	}
}

</script>

</head>
<body>

	<c:import url="/WEB-INF/views/user/login.jsp"/>
	<c:import url="/WEB-INF/views/headlogo.jsp"/>
	<c:import url="/WEB-INF/views/user/scrollup.jsp"/>
	
		<div id="check-boardwrite">내 작성글 확인</div>
        <hr>
        <!--코멘트 없을경우-->
        <c:if test="${empty li }">
		<div id="empty-review-page">------------- 후기 결과가 없습니다 -------------</div>
		</c:if>
        <!------------ 코멘트 있을 경우 내 코멘트 리스트 ------------------>
      <c:if test="${not empty li }">
        <ul id="my-boardwrite">
      
      <c:forEach var="my" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
        
            <li><img id="profile-pic" src="${root }images/${my.t_com_profileimg }.png" >${my.t_user_id}
              <!-- 하이퍼 링크로 클릭하면 해당 화장실 페이지로 이동하게 함 -->
              <span id="span">|&nbsp; ${my.t_com_date }&nbsp;|&nbsp; 별점 수 <img id="like-pic" src="${root}images/star.png"> ${my.t_com_score } </span>
                
               <div id="link">
	              <a id="link_1" href="${root }toilet/detail?t_no=${my.t_no}&t_user_id=${my.t_user_id}">
	                ${my.t_com_com } 
	               </a>
               </div>
                </li>
                <hr id="hr">
         </c:forEach>   
         
        </ul>
       
        <!-------- 페이지 번호 ----------------------->
	<div id="page-no">
		<a
			href="${root }user/my_commentlist?current_page_num=${pagenumbean.page_start }&t_user_id=${t_user_id}"
			style="text-decoration: none;">첫페이지</a>
		<c:forEach begin="${pagenumbean.page_num_min }" end="${pagenumbean.page_num_max }"
			varStatus="status">
			<a id="current-no"
				href="${root }user/my_commentlist?current_page_num=${status.index }&t_user_id=${t_user_id}"
				style="text-decoration: none;" class="page">${status.index }</a>
		</c:forEach>
		<a
			href="${root }user/my_commentlist?current_page_num=${pagenumbean.page_end }&t_user_id=${t_user_id}"
			style="text-decoration: none;">끝페이지</a>
			
	</div>
</c:if>
        <br>
        <a id="back" href="${root }user/mypage?t_user_id=${t_user_id}">뒤로가기</a>

<!-- footer -->
	<p id="copyright">
		<img src="${root }images/지푸라기.png" style="width: 4%;">
		Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED
	</p>


</body>
</html>
      
