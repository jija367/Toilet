<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

function del(){
	var a=confirm("���� Ż���Ͻðڽ��ϱ�?");
	if(a==true){
		return true;
	}return false;
}

</script>

<form action="${root }user/user_deletepass" method="post">
��й�ȣ Ȯ�� <input type="password" name="t_user_pw">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="Ż��" onclick="return del()">
</form>

<a href="${root }main?t_user_id=${t_user_id}">����</a>

</body>
</html>