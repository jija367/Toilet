<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--------------------- 삭제되었을때 --------------------------------->
<c:if test="${pw_check_code eq 'delete' }">

<script type="text/javascript">
   alert("탈퇴완료되었습니다.");
   location.href="${root}main";
</script>

</c:if>

<!--------------------- 업데이트되었을때 --------------------------------->
<c:if test="${pw_check_code eq 'update' }">

<script type="text/javascript">
   alert("변경완료되었습니다.");
   var a='${t_user_id}';
   location.href="${root}user/mypage?t_user_id="+a;
</script>

</c:if>


</body>
</html>