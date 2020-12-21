<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/review.css">
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
<script deffer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
	<div class="logos">
		<img src="${root}images/지푸라기.png" id="logo1" width="16%" height="10%">
		<img src="${root}images/logo.png" id="logo2" width="8%" height="10%">
	</div>

	<div id="review-page">Review (후기)</div>
	<ul>
		<li><img src="${root}images/pic1.png">파이리 <textarea>화장 고치는 파우더 룸이 따로 마련되어 있어 좋았습니다!</textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div></li>
	</ul>
	<ul>
		<li><img src="${root}images/pic3.png">꼬부기 <textarea>급할 때 아주 유용한 사이트입니다! 
          화장실 상태도 깨끗했어요~
          급할 때 아주 유용한 사이트입니다! 
          화장실 상태도 깨끗했어요~
          급할 때 아주 유용한 사이트입니다! 
          화장실 상태도 깨끗했어요~
          급할 때 아주 유용한 사이트입니다! 
          화장실 상태도 깨끗했어요~
        </textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div></li>
	</ul>
	<ul>
		<li><img src="${root}images/pic2.png">아구몬 <textarea>시설 깨끗하고 관리가 잘 되어 있어요~
              사이트 자주 애용할게요! 
            </textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div></li>
	</ul>
	<ul>
		<li><img src="${root}images/pic4.png">파피몬 <textarea>급할 때 아주 유용한 사이트입니다! 
              화장실 상태도 깨끗했어요~</textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div></li>
	</ul>
	<ul>
		<li><img src="${root}images/pic3.png">피카츄 <textarea>시설 깨끗하고 관리가 잘 되어 있어요~
              사이트 자주 애용할게요! 
            </textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div></li>
	</ul>
	<ul>
		<li>
		<img src="${root}images/pic2.png">버터플
		<textarea>급할 때 아주 유용한 사이트입니다! 
              화장실 상태도 깨끗했어요~</textarea>
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="reset">삭제</button>
			</div>
		</li>
	</ul>
</body>
</html>