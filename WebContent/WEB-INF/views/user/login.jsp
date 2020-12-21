<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
<link rel="stylesheet" href="${root}css/index.css" />
<link rel="stylesheet" href="${root}fullpage/fullpage.min.css" />
<script src="./fullpage//fullpage.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<style type="text/css">
.sidebar>form>#btn1 {
	margin-top: 5%;
	margin-left: 15%;
	width: 30%;
	height: 55px;
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
</style>
</head>
<body>
	<input type="checkbox" id="menuicon">
	<label for="menuicon"> <span></span> <span></span> <span></span>
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
				<input type="button" value="패스워드 찾기" id="btn4" onclick="location.href='${root}user/id_search?searchKey=pw_search'">
			</form>
		</c:if>
		
		
		<c:if test="${not empty t_user_id}">
			<h1>로그인 완료</h1>
			<form name="form" action="${root }user/logout" method="get">
				<input type="submit" value="로그아웃" id="btn1"> 
				<input type="button" value="마이페이지" id="btn2" onclick="location.href='${root}user/mypage?t_user_id=${t_user_id}'">
			</form>
		</c:if>
	</div>

</body>
</html>