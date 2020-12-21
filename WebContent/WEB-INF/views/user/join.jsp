<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberJoin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${root}css/member.css">
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
</head>
<body>
<!-- 로고 -->
    <header>
        <c:import url="/WEB-INF/views/headlogo.jsp"/>
    </header>
    <!-- 폼 -->
    <form:form modelAttribute="userbean" action="${root }user/joinpass" method="post" class="form" name="join1">
        <span>아이디</span>
        <input type="button" onclick="idcheck()" value="중복확인"><br>
        <form:input path="t_user_id" id="t_user_id" onkeypress="idcheck_false()"/>
		<form:errors path="t_user_id"/>
        <p>패스워드</p>
        <form:password path="t_user_pw" id="t_user_pw"/>
		<form:errors path="t_user_pw" />
        <p>패스워드 확인</p>
        <form:password path="t_user_pw2" id="t_user_pw2"/>
		<form:errors path="t_user_pw2"/>
        <p>이름</p>
      	<form:input path="t_user_name"/>
		<form:errors path="t_user_name"/>
        <p>이메일</p>
      	<form:input path="t_user_email"/>
		<form:errors path="t_user_email"/>
        <p>연락처</p>
        <form:input path="t_user_tel"/>
		<form:errors path="t_user_tel"/>
		<br>
        <div class="btns">
            <input type="reset" value="다시 작성"> 
            <input type="submit" value="회원가입"  onclick="return check()">
        </div>
    </form:form>
    <!-- footer -->
    <footer>
        <p><img src="${root}images/지푸라기.png" width="5%"> Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>
    </footer>
    

<script type="text/javascript">

function on() {
	location.href="${root}main?t_user_id=${t_user_id}";
}

var idcheckCode=0;
var id_check_result='${id_check_result}';
if(id_check_result=="false"){
   alert("중복된 아이디입니다.");
   idcheckCode=0;

}else if(id_check_result=="true"){
   idcheckCode=1;
    alert("사용 가능한 아이디입니다.");

}

function check(){
   var pw=document.getElementById("t_user_pw");
   var pw2=document.getElementById("t_user_pw2");
   if(idcheckCode==0){
      alert("id 중복여부를 확인해 주세요");
      return false;
   }
   else if(pw.value!=pw2.value){
      alert("비밀번호확인이 일치하지 않습니다");
      return false;
   }
   alert("가입인증메일이 발송완료 되었습니다. 메일인증 후 이용해주세요.");
   return true;
}

function idcheck(){
   var id=document.getElementById("t_user_id");
   if(id.value==""){
      alert("아이디를 입력해주세요");
   }else{
      location.href="${root}user/id_check?t_user_id="+id.value;
   }
}

function idcheck_false(){
   idcheckCode=0;
}

</script>
</body>
</html>