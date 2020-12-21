<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>임시비밀번호 확인</title>
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
<style>
input[type="text"], input[type="tel"], input[type="email"], input[type="password"] {
	margin: -20% 0% 0% 5%;
}

#temp-pw{
	margin-top: 10%;
}
#text{
	margin-left: 30%;
}
</style>
</head>
<body>

	<div id="temp-pw">
   <h1>임시비밀번호 확인</h1>
   <hr>
   <form action="${root }user/passwordcheck2" method="post">
      <div id="find_idpw">
         <p id="text">아이디와 임시비밀번호를 입력해주세요.</p>
         <table>
            <tr>
               <td><p id="name">아이디</p></td>
               <td><input type="text" name="t_user_id"></td>
            </tr>
            <tr>
            <td id="pw"><p>비밀번호</p></td>
            <td><input name="t_user_pw" type="password"></td>
            </tr>
         </table>
      </div>
      <div id="btns">
         <input type="submit" value="확인">
         <input type="button" onclick="location.href='${root}main'" value="취소">
      </div>
   </form>
      </div>
</body>
</html>
