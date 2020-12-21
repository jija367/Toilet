<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>id_search</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/find_idpw.css">
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
</head>
<body>

    <c:import url="/WEB-INF/views/headlogo.jsp"/>

	<!-- id 찾기로 들어올 경우  -->
	<c:if test="${searchKey eq 'id_search' }">
		<h1>아이디 찾기</h1>

		<hr>
		<form action="${root }user/id_searchpass" method="post">
			<div id="find_idpw">
				<p id="text">찾으시려는 아이디의 이름과 연락처를 입력해주세요.</p>
				<table>
					<tr>
						<td><p id="name">이름</p></td>
						<td><input type="text" name="t_user_name" value="${t_user_name }"></td>
					</tr>
					<tr>
						<td><p id="tel">연락처</p></td>
						<td><input type="text" name="t_user_tel" value="${t_user_tel }"></td>
					</tr>
				</table>				
			</div>
			<div id="btns">
				<input type="submit" value="확인"> 
				<input type="button" onclick="location.href='${root}main'" value="취소">
			</div>
		</form>
	</c:if>

	<!-- pw 찾기로 들어올 경우  -->
	<c:if test="${searchKey eq 'pw_search' }">
		<h1>패스워드 찾기</h1>

		<hr>
		<form action="${root }user/passwordcheck1" method="post">
			<div id="find_idpw">
				<p id="text">찾으시려는 패스워드의 아이디와 이메일을 입력해주세요.</p>
				<table>
					<tr>
						<td><p id="id">아이디</p></td>
						<td><input type="text" name="t_user_id" value="${t_user_id }"></td>
					</tr>
					<tr>
						<td><p id="email">이메일</p></td>
						<td><input name="t_user_email" type="email" value="${t_user_email }"></td>
					</tr>
				</table>
			</div>
			<div id="btns">
				<input type="submit" value="확인"> 
				<input type="button" onclick="location.href='${root}main'" value="취소">
			</div>
		</form>
	</c:if>

	<hr>
    <p id="copyright"><img src="${root}images/지푸라기.png" width="3%"> Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>
</body>
</html>