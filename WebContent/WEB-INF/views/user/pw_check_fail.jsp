<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
alert("비밀번호 불일치");
location.href="${root}user/pw_check?t_user_id=${t_user_id}&pw_check_code=${pw_check_code}";

</script>

</body>
</html>