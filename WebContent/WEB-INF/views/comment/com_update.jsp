<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="${root }css/comment-update.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
   
    <title>comment-update</title>
</head>
<body>
	<c:import url="/WEB-INF/views/user/login.jsp"/>
	<c:import url="/WEB-INF/views/user/scrollup.jsp"/>
	
<div class="logos">
        <img src="${root }images/지푸라기.png" id="logo1" width="12%" height="10%" onclick="on()">
        <img src="${root }images/logo.png" id="logo2" width="5%" height="10%">
    </div>
    <h1>Review(후기) 수정</h1>
    <hr>
    
<form name="form" action="${root }comment/com_updatepass" method="post">
<div id="update-comment">
       <table id="update-comment-table">
           <tr id="tr">
               <td id="choose">프로필이미지<br> 선택</td>
                	<td id="choose-profile-img">
                		<label for="radio-btn1">
                            <img src="${root }images/1.png">
                            <input type="radio" name="t_com_profileimg" value="1" id="radio-btn1" checked>
                        </label>
                         <label for="radio-btn2">
                            <img src="${root }images/2.png">
                            <input type="radio" name="t_com_profileimg" value="2" id="radio-btn2">
                        </label>
                        <label for="radio-btn3">
                            <img src="${root }images/3.png">
                            <input type="radio" name="t_com_profileimg" value="3" id="radio-btn3">
                        </label>
                        <label for="radio-btn4">
                            <img src="${root }images/4.png">
                            <input type="radio" name="t_com_profileimg" value="4" id="radio-btn4">
                        </label>
                        </td>
                </tr>
            <tr id="tr">
            	<td id="choose">별점</td>
            	<td><span class="star" onclick="star(1)">☆</span>
						<span class="star" onclick="star(2)">☆</span>
						<span class="star" onclick="star(3)">☆</span>
						<span class="star" onclick="star(4)">☆</span>
						<span class="star" onclick="star(5)">☆</span></td>
       	 	</tr>      
            <tr id="tr">
	            <td id="choose">후기</td>
	            <td><textarea name="t_com_com" id="com" cols="60" rows="10" placeholder="후기를 작성하세요">${commentbean.t_com_com }</textarea></td>
        </tr> 
        	 <tr id="tr">
          		 <td colspan="2"><button id="write-button" type="submit" onclick="return ch()">작성</button></td>
        </tr>           
        </table>     
        
        </div>
    <hr>

    <p id="copyright"><img src="${root }images/지푸라기.png" width="4%"> Copyright&copy;ZIPURAGI ALL RIGHTS RESERVED</p>       

<input type="hidden" name="t_com_score" id="t_com_score" value="${commentbean.t_com_score }">
<input type="hidden" name="t_no" value="${t_no}">
<input type="hidden" name="t_com_no" value="${commentbean.t_com_no }">

</form>


<script type="text/javascript">
window.onload=function(){
    var star=document.getElementsByClassName("star");
   
   if('${commentbean.t_com_score }' >0){
      for(var i=0;i<star.length;i++){
           if(i<'${commentbean.t_com_score}'){
               star[i].innerHTML='★';
           }else{
               star[i].innerHTML='☆';
           }
       }
   } 
}


function star(a){
    var star=document.getElementsByClassName("star");
    for(var i=0;i<star.length;i++){
        if(i<a){
            star[i].innerHTML='★';
        }else{
            star[i].innerHTML='☆';
        }
    }
    
    // commentbean에 스코어 저장
    document.getElementById("t_com_score").value=a;
}


function ch(){
   var com=document.getElementById("com");
   
   if(com.value==""){
      alert("내용을 입력해주세요");
      return false;
   
   }else if(com.value.length>50){
      alert("50자 이내로 작성해주세요");
      return false;
   }
      
   return true;
}

</script>
</body>
</html>


<%-- 				<td><img alt="a" src="${root }images/1.png" width="50" height="50">
					  <input type="radio" name="t_com_profileimg" value="1" checked></td>
				<td><img alt="b" src="${root }images/2.png" width="50" height="50">
					  <input type="radio" name="t_com_profileimg" value="2"></td>
				<td><img alt="c" src="${root }images/3.png" width="50" height="50">
					  <input type="radio" name="t_com_profileimg" value="3"></td>
				<td><img alt="d" src="${root }images/4.png" width="50" height="50">
					  <input type="radio" name="t_com_profileimg" value="4"></td>
		</tr>
<br> --%>
	<!-- 	<tr>
				<td id="choose-star">별점</td>
				<td><span class="star" onclick="star(1)">☆</span>
						<span class="star" onclick="star(2)">☆</span>
						<span class="star" onclick="star(3)">☆</span>
						<span class="star" onclick="star(4)">☆</span>
						<span class="star" onclick="star(5)">☆</span></td>
	</tr> -->

	<%-- <tr>
				<td id="rewrite-comment">후기</td>
				<td><textarea name="t_com_com" rows="5" cols="10" >${commentbean.t_com_com }</textarea></td>
	</tr> --%>


	<!-- <tr>	
				<td><input type="submit" value="작성"></td>
	</tr> -->
	
	
