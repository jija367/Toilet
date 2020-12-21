<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete/update</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/leave.css">
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
	function del() {
		var a = confirm("탈퇴시 작성한 후기는 모두 삭제됩니다. 정말 탈퇴하시겠습니까?");
		if (a == true) {
			return true;
		} else {
			return false;
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

.logos {
	margin-top: 3% !important;
}

h1 {
	text-align: center;
	margin: 2% 0%;
}

hr {
	width: 65%;
	margin-bottom: 1%;
}

#leave-msg {
	width: 65%;
	margin-left: 21%;
	padding-top: 2%;
}

#write-pw {
	margin: 2% 20% 5% 20%;
	border: 1.4px solid rgb(54, 15, 80);
	text-align: center;
	padding: 2% 0%;
}

#id {
	margin-top:1%;
	margin-left: 1.7%;
}

b {
	font-size: 1em;
}

#text, #password {
	margin-left: 2%;
	/* padding-top: 1.5%; */
	font-size: 1.2em;
}

#btns {
	margin: 1% 0% 5% 34%;
}

input[type="submit"] {
	margin: 1.6% 0% 1.6% 0%;
    width: 23%;
    padding: 0.5% 0.5%;
    font-size: 1em;
    background: rgb(206, 243, 242);
    border: 1px solid rgb(170, 173, 173) ;
}

input[type="button"] {
	margin: 1.6% 0% 1.6% 1.6%;
	width: 23%;
	padding: 0.5% 0.5%;
	font-size: 1em;
	background: white;
	border: 1px solid rgb(170, 173, 173) ;
}

#copyright {
	text-align: center;
	margin: 2% 0%;
}
</style>

</head>

<body>
	
	<c:import url="/WEB-INF/views/user/login.jsp"/>
    <c:import url="/WEB-INF/views/headlogo.jsp"/>
    
<!---------------------- 회원 탈퇴로 들어왔을 경우 ----------------------------------------------->  
    
<c:if test="${pw_check_code eq 'delete' }">
    
    <h1>회원탈퇴</h1>

    <hr>
    <p id="leave-msg">그 동안 <b>'지푸라기</b>'를 이용해주셔서 감사합니다.<br>
        회원 탈퇴를 하실 경우 아래와 같이 회원님의 모든 정보가
        삭제됩니다.<br>
        현재 회원님께서 이용 중인 서비스와 이용 내역을 확인하신 후
        신중하게 탈퇴해 주시기 바랍니다.</p>
    <p id="leave-msg">
        -프로필 정보<br>
        -리뷰 댓글 등 모든 게시판 내 작성한 게시글
    </p>
    
<form action="${root }user/pw_check_pass" method="get">
    <div id="write-pw">회원 탈퇴를 위해 비밀번호를 입력해주세요
        <div>
            <p id="id">아이디 <input type="text" name="t_user_id" value="${t_user_id }"></p>
            <p id="pw">비밀번호 <input type="password" name="t_user_pw"></p>
            <input name="pw_check_code" type="hidden" value="delete">
        </div>
    </div>
    <div id="btns">
        <input type="submit" onclick="return del()" value="탈퇴">
        <input type="button" onclick="location.href='${root}main?t_user_id=${t_user_id }'" value="취소">
    </div>
</form>
    
</c:if>

<!---------------------- 회원 정보 수정으로 들어왔을 경우 ----------------------------------------------->      
    
<c:if test="${pw_check_code eq 'update' }">
    
    <h1>회원정보 수정</h1>

    <hr>
    
		<form action="${root }user/pw_check_pass" method="get">

			<div id="write-pw">
				본인확인을 위해 비밀번호를 입력해주세요
				<div>
					<p id="id">아이디 <input type="text" name="t_user_id" value="${t_user_id }"></p>
					<p id="pw">비밀번호 <input name="t_user_pw" type="password"></p>
				</div>
			</div>
			<div id="btns">
				<input name="pw_check_code" type="hidden" value="update"> 
				<input type="submit" value="수정"> 
				<input type="button" onclick="location.href='${root}main?t_user_id=${t_user_id }'" value="취소">
			</div>
		</form>
</c:if>

<!----------------------------------------------------------------------->

    <hr>
    <p id="copyright"><img src="${root}images/지푸라기.png" width="3%"> Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>
</body>
</html>