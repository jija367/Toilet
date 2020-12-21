<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>UpdatePage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
   integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
   crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/info_update.css">
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
   
<script type="text/javascript">



function check(){
   var pw=document.getElementById("my-pw");
   var pw2=document.getElementById("my-pw-check");
   var email=document.getElementById("my-email");
   var tel=document.getElementById("my-tel");
   if(pw.value!=pw2.value){
      alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
      return false;
   }else if(pw.value==""||pw2.value==""||email.value==""||tel.value==""){
      alert("빈칸을 채워주세요");
      return false;
   }else{
      return true;
   }
}
</script>

<style>
body {
    margin: 0 auto;
    width: 100%;
    height: 100%;
    background: rgb(243, 240, 255) !important;
    font-family: 'Courier New', Courier, monospace;
}
</style>

</head>
<body>
   	<c:import url="/WEB-INF/views/user/login.jsp"/>
    <c:import url="/WEB-INF/views/headlogo.jsp"/>
    
    <h1>회원 정보 수정</h1>
    <hr>
    
   <form action="${root }user/user_updatepass" method="post" name="update1">

      <div id="update-info">
         <table id="update-info-table">
            <tr>
               <td id="update_name">이름</td>
               <td> ${userbean.t_user_name}</td>
            </tr>
            <tr>
               <td id="update_id">아이디</td>
               <td><input id="my-id"  name="t_user_id" readonly="true" value="${ userbean.t_user_id }"></td>
            </tr>
            <tr>
               <td id="update_pw">새 비밀번호</td>
               <td><input id="my-pw" type="password" name="t_user_pw" value="${ userbean.t_user_pw }"></td>
            </tr>
            <tr>
               <td id="update_pw-check">새 비밀번호 확인</td>
               <td><input id="my-pw-check" type="password" name="t_user_pw2" value="${ userbean.t_user_pw}"></td>
            </tr>
            <tr>
               <td id="update_email">이메일</td>
               <td><input id="my-email" type="email" name="t_user_email" value="${ userbean.t_user_email }"></td>
            </tr>
            <tr>
               <td id="update_tel">연락처</td>
               <td><input id="my-tel" type="tel" name="t_user_tel" value="${ userbean.t_user_tel }"></td>
            </tr>
         </table>
      </div>

      <hr>
      <input type="hidden" name="pw_check_code" value="update">
      <input type="submit" id="update-button" value="수정" onclick="return check()"> 
      <input type="button" onclick="location.href='${root}main?t_user_id=${t_user_id }'" value="취소">
   </form>
   
   <hr>
    <p id="copyright"><img src="${root}images/지푸라기.png" width="3%"> Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>
</body>
</html> 



