<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>review</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/review.css">
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

#like-pic {
	width: 3%;
	margin-right: 2%;
}

#comment {
	margin-top: 5%;
}

#empty-review-page {
	font-size: 1.5em;
	margin: 5% 0% 5% 32%;
	color: navy;
}

#copyright {
	margin: 4% 0% 2% 40%;
}

#logo1 {
	cursor: pointer;
}

#review-page {
	border: 3px solid darkturquoise;
	background: darkturquoise;
	color: whitesmoke;
	width: 60%;
	height: 40%;
	border-radius: 20px;
	margin: 3% 0% 3% 22%;
	text-align: center;
	font-size: 2.5em;
	font-weight: 600;
}
ul {
	list-style-type: none;
	 display: flex;
	/* 세로 정렬  */
	flex-direction: column; 
	margin: 0% 0% 1.2% 20%;
	width: 80%;
}
#back{
	border: 1px solid black;
	text-indent: 30%;
	margin: 10% 0% 3% 25%;
	background: rgb(43, 171, 180);
	border: 2px solid rgb(43, 171, 180);
	color: whitesmoke;
	width: 20%;
	padding: 0.5% 1%;
}

#current-no {
	margin: 0% 2%;
}

#page-no {
	margin: 2% 0% 3% 38%;
	font-size: 1.4em;
}

li{
	width: 90%;
}
#profile-pic {
	width: 15%;
	height: 15%;
	border-radius: 50%;
	margin-right: 5%;
}
#buttons {
	margin-left: 65%;
}
#hr{
	border:2.4px solid orange;
	width: 80%;
	margin:0;
}

</style>

</head>
<body bgcolor="mintcream">

	<c:import url="/WEB-INF/views/user/login.jsp"/>
	<c:import url="/WEB-INF/views/headlogo.jsp"/>
	<c:import url="/WEB-INF/views/user/scrollup.jsp"/>

	<div id="review-page">Review (후기)</div>

	<c:if test="${empty li}">
		<div id="empty-review-page">------------- 작성된 후기가 없습니다
			-------------</div>
		<a id="back" href="${root }toilet/detail?t_no=${t_no}&t_user_id=${t_user_id}">뒤로가기</a>
	</c:if>
<!-- 변경 -->

<c:if test="${not empty li}">
		<ul>
		<c:forEach var="c" items="${li }"
					begin="${pagenumbean.for_start_num }"
					end="${pagenumbean.for_end_num -1}">
			<li>
					<!-- comment-list -->
					<img id="profile-pic"
						src="${root}images/${c.t_com_profileimg }.png"
						alt="${c.t_com_profileimg }">
						<span>${c.t_user_id }
            |&nbsp; ${c.t_com_date } |&nbsp; 별점 수 <img id="like-pic" src="${root}images/star.png">${c.t_com_score }</span>
            
					<div id="comment">
						<div>${c.t_com_com }</div>
					</div>
					<c:if test="${t_user_id eq c.t_user_id}">
						<div id="buttons">
							<br>
							<button
								onclick="location.href='${root}comment/com_update?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${t_no }'">수정</button>
							<button
								onclick="location.href='${root}comment/com_delete?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${t_no }'">삭제</button>
						</div>
					</c:if>
					<br>
					<hr id="hr">
			</li>
		</c:forEach>
	</ul>
	<a id="back" href="${root }toilet/detail?t_no=${t_no}&t_user_id=${t_user_id}">뒤로가기</a>
	
	<!-------- 페이지 번호 ----------------------->
	<div id="page-no">
		<a
			href="${root }comment/commentlist?current_page_num=${pagenumbean.page_start }&t_no=${t_no}&t_user_id=${t_user_id}"
			style="text-decoration: none;">첫페이지</a>
			
		<c:forEach begin="${pagenumbean.page_num_min }" end="${pagenumbean.page_num_max }" varStatus="status">
			<a id="current-no"
				href="${root }comment/commentlist?current_page_num=${status.index }&t_no=${t_no}&t_user_id=${t_user_id}"
				style="text-decoration: none;" class="page">${status.index }</a>
		</c:forEach>
		
		
		<a
			href="${root }comment/commentlist?current_page_num=${pagenumbean.page_end }&t_no=${t_no}&t_user_id=${t_user_id}"
			style="text-decoration: none;">끝페이지</a>
			
	</div>
</c:if>

	<!-- footer -->
	<p id="copyright">
		<img src="${root }images/지푸라기.png" style="width: 4%;">
		Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED
	</p>


	<!-- script -->
	<script type="text/javascript">
	
		function on() {
			location.href="${root}main";
		}
	
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
	</script>

</body>
</html>