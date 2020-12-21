<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<title>구글 맵 사용</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}css/toiletloc.css" />
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMI3gt8utOUQfXBOpclwO7r0gAGeBkp5Q&callback=initMap&region=kr"
        async defer></script>
<script type="text/javascript">
//화장실 위도
var a=${oneToilet.t_la };
// 화장실 경도
var b=${oneToilet.t_lo };

// 내위치 위도 coords.latitude
// 내위치 경도 coords.longitude

var map, watchId, coords;

function startWatchPosition() {
    watchId = navigator.geolocation.watchPosition(function (position) { //일정한 시간단위로 함수를 주기적으로 부름
        coords = position.coords;
        var mapCenter = new google.maps.LatLng(coords.latitude, coords.longitude);
        
        if (!map) {
            map = new google.maps.Map(document.getElementById("map"), {
                center: mapCenter,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                zoom: 14
            });
        }
        var time = new Date();
        time.setTime(position.timestamp);
        var title = time.getHours() + ":" + time.getMinutes() + ":" + time.getSeconds(); //이름

        var marker = new google.maps.Marker({ //찍히는 좌표
            position: mapCenter,
            title: title,
            map: map
        });
        map.setCenter(mapCenter);
    }, onPositionError, {
        enableHighAccuracy: true
    });
    
}

function stopWatchPosition() {
   
   var t_name='${oneToilet.t_name }';
   
   // 클릭하면 줌 되게 하는 함수
   var toilet = { lat: a, lng: b };
   map.panTo(toilet);
   map.setZoom(14);
   
   navigator.geolocation.clearWatch(watchId);
    var toilets = [t_name, a, b];

    var title = toilets[0];
    var pos = new google.maps.LatLng(a, b);

    var m = new google.maps.Marker({
            position: pos,
            title: title,
            icon: "${root}svg/mark4.svg",
            map: map,
            animation: google.maps.Animation.DROP,
        });

        m.addListener('click', function () {
            alert(this.getTitle());
        });
 
 }

function onPositionError(error) {
    alert("위치정보수집에러:" + error.message);
}


navigator.geolocation.getCurrentPosition(onSuccess, onError, {
    maximumAge: 30000,
    timeout: 0
});

function onError(error) {
    if (error === error.TIMEOUT) {
        alert("시간이 초과되었습니다..");
    } else {
        alert("기타 에러 발생");
    }
}
   
/////////////// 코멘트작성 유효성 검사 함수 //////////////////////////////////////////////////////////////////////////////
   
function star(a) {
      var star = document.getElementsByClassName("star");
      var t_com_score = document.getElementById("t_com_score");
      for (var i = 0; i < star.length; i++) {
         if (i < a) {
            star[i].innerHTML = '★';
         } else {
            star[i].innerHTML = '☆';
         }
      }
      t_com_score.value = a;
   }

function ch() {

    var id=document.getElementById("t_user_id");
    var score=document.getElementById("t_com_score");
    var com=document.getElementById("textarea");
    
    if(id.value == ""){
       alert("로그인 후 작성 가능합니다.");
       return false;
    }else if(score.value==0){
       alert("별점을 선택해주세요");
       return false;
    }else if(com.value == ""){
       alert("내용을 입력해주세요");
       return false;
    }else if(com.value.length>50){
       alert("50자 이내로 작성해주세요");
       return false;
    }

    return true;  

}
   
   
</script>
<style type="text/css">
.star {
   cursor: pointer;
}

#comment-write-btn{
   margin-bottom: 3%;
   border:1px solid rgb(128, 128, 128);
}
#review-more-button{
   border:1px solid rgb(128, 128, 128);
}
form img{
    width: 40%;
    border-radius: 50%;
}
#profile-pic {
	width: 25%;
	height: 25%;
	border-radius: 50%;
	margin-right: 5%;
	margin-bottom:3%;
}
#buttons {
	margin-left: 75%;
}

#like-pic {
	width: 4%;
	margin-right: 2%;
}
#review_list {
   width:75%;
   margin:5% 0% 4% 13%;
   padding-top:2%;
   border-top: 1.5px solid rgb(230, 230, 217);
}



</style>
</head>
<!-- 상단 지도  -->
<body onload="startWatchPosition()">

   <c:import url="/WEB-INF/views/user/login.jsp"/>
   <c:import url="/WEB-INF/views/headlogo.jsp"/>
   <c:import url="/WEB-INF/views/user/scrollup.jsp"/>
     
     <div id="map" style="width:70%; height:350px; border-radius:10px; margin-left:15%;">
       지도 초기화
     </div>

    
      <!-- 내위치, 화장실 버튼 -->
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;
  <button id="my-location-button" onclick="startWatchPosition()" >
      내위치
  </button>
  <button id="toilet-location-button" onclick="stopWatchPosition()" >
      화장실
  </button>

      <!-- 화장실 정보 -->
     <h1>화장실 정보</h1>

     <div class="container">
     	<form>
         <div id="hr">
            <div class="row">
               	<div class="col-25">
                  	<label for="x_name">화장실명</label>
               	</div>
               	<div class="col-75">
                  	<!-- DB에 읽을 DATA로 수정해야 할 부분(모두) -->
                  	<input type="text" id="x_name" name="t_name" readonly value="${oneToilet.t_name }">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_nm_name">위치(도로명 주소)</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_nm_name" name="t_nm_name" readonly  value="${oneToilet.t_nm_name }">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_m_name">위치(지번 주소)</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_m_name" name="t_m_name"  readonly value="${oneToilet.t_m_name}">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_mwm">남여 공용여부</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_mwm" name="t_mwm"  readonly value="${oneToilet.t_mwm }">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_close">개방시간</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_close" name="t_close" readonly  value="${oneToilet.t_close }">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_manage">관리기관</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_manage" name="t_manage"  readonly value="${oneToilet.t_manage }">
               	</div>
			</div>
			
			<div class="row">
                  <div class="col-25">
                     <label for="x_tel">관리자 전화번호</label>
                  </div>
                  <div class="col-75">
                     <input type="text" id="x_tel" name="t_tel"  readonly value="${oneToilet.t_tel }">
                  </div>
         	</div>
         	
         </div>
         <!-- 화장실 규모 -->
         <h1>화장실 규모</h1>
         <div id="hr">
            <div class="row">
               	<div class="col-25">
                  	<label for="x_ml_number">남성용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_ml_number" name="t_ml_number" readonly  value="${oneToilet.t_ml_number}">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_wml_number">여성용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_wml_number" name="t_wml_number"  readonly value="${oneToilet.t_wml_number}">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_hml_number">남성(장애인)용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_hml_number" name="t_hml_number" readonly  value="${oneToilet.t_hml_number}">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_hwml_number">여성(장애인)용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_hwml_number" name="t_hwml_number" readonly  value="${oneToilet.t_hwml_number}">
               	</div>
            </div>

            <div class="row">
               	<div class="col-25">
                  	<label for="x_cml_number">유아(남아)용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_cml_number" name="t_cml_number" readonly  value="${oneToilet.t_cml_number}">
               	</div>
            </div>

            	<div class="row">
               	<div class="col-25">
                  	<label for="x_hwms_number">유아(여아)용 대변기 수</label>
               	</div>
               	<div class="col-75">
                  	<input type="text" id="x_hwms_number" name="t_hwms_number" readonly  value="${oneToilet.t_hwms_number}">
               	</div>
            	</div>
         	</div>
      	</form>
   	</div>


   <form action="${root }comment/add_comment" method="post" id="form">
      <div id="choose-img">
         <p id="pro">프로필 이미지 선택</p>
         <div class="select-pictures">
            <div id="select-picture">
               <label for="radio-btn1"> 
                  <img alt="a" src="${root }images/pic1.png"><br> 
                  <input type="radio" name="t_com_profileimg" value="1" id="radio-btn1" checked>
               </label>
            </div>
            <div id="select-picture">
               <label for="radio-btn2"> 
                  <img alt="b" src="${root }images/pic2.png"><br> 
                  <input type="radio" name="t_com_profileimg" value="2" id="radio-btn2">
               </label>
            </div>
            <div id="select-picture">
               <label for="radio-btn3"> 
                  <img alt="c" src="${root }images/pic3.png"><br> 
                  <input type="radio" name="t_com_profileimg" value="3" id="radio-btn3">
               </label>
            </div>
            <div id="select-picture">
               <label for="radio-btn4"> 
                  <img alt="d" src="${root }images/pic4.png"><br> 
                  <input type="radio" name="t_com_profileimg" value="4" id="radio-btn4">
               </label>
            </div>
         </div>
      </div>
      <br>

      <span id="score">별점</span> 
      <span class="star" onclick="star(1)">☆</span>
      <span class="star" onclick="star(2)">☆</span> 
      <span class="star" onclick="star(3)">☆</span> 
      <span class="star" onclick="star(4)">☆</span>
      <span class="star" onclick="star(5)">☆</span> 
      <input type="hidden" name="t_com_score" value="0" id="t_com_score"> <br>

      <p id="review">후기</p>
      <textarea id="textarea" name="t_com_com" rows="5" cols="100%"></textarea>
      <br> 
      <input type="hidden" id="t_user_id" name="t_user_id" value="${t_user_id }"> 
      <input type="hidden" name="t_no" value="${oneToilet.t_no }"> 
      <input type="submit" id="comment-write-btn" value="후기 작성하기" onclick="return ch()">
   </form>

   
   <div id="review_list">
      <h1>후기 review</h1>
      <div>
         <ul id="ul">
         	<c:forEach var="c" items="${li }" begin="0" end="1">
            <li>
            <img id="profile-pic" src="${root }images/${c.t_com_profileimg }.png">${c.t_user_id } 
           	 ${c.t_com_date } | 별점 수 <img id="like-pic" src="${root}images/star.png">${c.t_com_score }
            <p>${c.t_com_com }</p>
            <c:if test="${t_user_id eq c.t_user_id}">
			<div id="buttons">
			<button onclick="location.href='${root}comment/com_update?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${c.t_no}'">수정</button>
			<button onclick="location.href='${root}comment/com_delete?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${c.t_no}'">삭제</button>
			</div>
			</c:if>
            </li>
            </c:forEach>
         </ul>
        
         <ul>
         	<c:forEach var="c" items="${li }" begin="2" end="3">
            <li>
            <img id="profile-pic" src="${root }images/${c.t_com_profileimg }.png">${c.t_user_id } 
           	 ${c.t_com_date } / 별점 수  <img id="like-pic" src="${root}images/star.png">${c.t_com_score }
            <p>${c.t_com_com }</p>
            <c:if test="${t_user_id eq c.t_user_id}">
            <div id="buttons">
			<button onclick="location.href='${root}comment/com_update?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${c.t_no}'">수정</button>
			<button onclick="location.href='${root}comment/com_delete?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${c.t_no}'">삭제</button>
			</div>
			</c:if>
            </li>
            </c:forEach>
         </ul>
        
      </div>
   </div>
   
   <button id="review-more-button" onclick='location.href="${root }comment/commentlist?t_no=${oneToilet.t_no}&t_user_id=${t_user_id}"'>후기더보기</button>

   <!-- footer -->
   <c:import url="/WEB-INF/views/user/footer.jsp"/>

</body>
</html>