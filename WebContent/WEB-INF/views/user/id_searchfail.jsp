<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var a=confirm("등록되지않은 회원이거나 이메일 인증을 하지 않았습니다. 회원가입을 하시겠습니까?");
if(a==true){
	location.href="${root }user/join";
}else{
location.href="${root }main";
}
</script>
</body>
</html>