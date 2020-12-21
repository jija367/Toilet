<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
.logos {
    margin:3% 0% 0% 3%;
    cursor: pointer;
}
#logo1 {
    width:15%;
}
#logo2 {
    margin-top: -2%;
    width:6%;
}

</style>

</head>
<body>

	<div class="logos">
		<img src="${root}images/지푸라기.png" id="logo1" width="16%" height="10%" onclick="location.href='${root}main?t_user_id=${t_user_id}'"> 
		<img src="${root}images/logo.png" id="logo2" width="8%" height="10%">
	</div>

</body>
</html>