<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id_searchpass</title>

<style type="text/css">

body {
   margin: 0 auto;
   width: 100%;
   height: 100%;
   background: rgb(243, 240, 255);
   font-family: 'Courier New', Courier, monospace;
}

input[type="button"] {
   margin: 1.6% 0% 0% 0%;
    width: 23%;
    padding: 0.5% 0.5%;
    font-size: 1em;
    background: rgb(206, 243, 242);
    border: 1px solid rgb(170, 173, 173) ;
    cursor: pointer;
}

h3 {
   text-align: center;
   margin: 2% 0%;
}

span{
font-weight: bold;

}

#find_idpw {
   margin: 0 outo;
   margin: 10% 0% 10% 18%;
   padding-top: 2%;
   text-align:center;
   width: 65%;
  
}


</style>

</head>
<body>
<div id="find_idpw">
<h3><span>${t_user_name }</span>님의 
아이디는 <span>${t_user_id }</span>입니다</h3>
<input type="button" value="비밀번호 찾기" onclick="location.href='${root}user/id_search?searchKey=pw_search'">
<input type="button" value="메인" onclick="location.href='${root}main'" style="background: white;">
</div>
</body>
</html>