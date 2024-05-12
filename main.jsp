<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
 
    <title>감정일기</title>
    <style>
    
    @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

        body 
        {
        	min-height: 80vh;
   		 	max-width: 400px;
    		
    		
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #F0E6ED;
            text-align: center;
            overflow-y: auto;  /*변경된 부분 */
        }

        #header 
        {        
            background-color: #D8BCD1;
            padding: 10px;
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            font-family: 'Nanum Pen Script', cursive;
            margin-left: -10px;
        }

         #header h1 
        {
           text-decoration: none;
           color: #000000;
            margin: 0;
            margin-left: 20px;
            font-size: 60px;
            
        }
        
         #header a 
	    {
	        text-decoration: none;
	        font-family: 'Nanum Pen Script', cursive;
	    }

        #datetime 
        {
            margin-right: 30px;
            margin-left: 10px;
            font-size: 50px;
        }

        #content 
        {
            position: fixed;
          	bottom: 10%;
            right: 4%;
            margin-bottom: 20px;
	        padding: 10px;
	        font-size: 40px;
        }
        
        #diaryImage 
        {
            position: fixed;
           	bottom: 0; 
            right: 0;
            margin-right: 20px;
        }
        
         #user_id
        {
		    width: 150px; /* 원하는 너비 값으로 조절 */
		    height: 30px; /* 원하는 높이 값으로 조절 */
		    background-color: rgba(255, 255, 255, 0.8); /* 0.8은 반투명도를 나타내며, 필요에 따라 조절 가능 */
		    border: 1px solid #ccc; /* 원하는 테두리 스타일 및 색상으로 조절 */
		    border-radius: 5px; /* 원하는 테두리 모양으로 조절 */
		    padding: 4px; /* 원하는 안쪽 여백 값으로 조절 */
		    font-size: 16px; /* 원하는 글자 크기로 조절 */
		}
		
		#user_pw
        {
		    width: 150px; /* 원하는 너비 값으로 조절 */
		    height: 30px; /* 원하는 높이 값으로 조절 */
		    background-color: rgba(255, 255, 255, 0.8); /* 0.8은 반투명도를 나타내며, 필요에 따라 조절 가능 */
		    border: 1px solid #ccc; /* 원하는 테두리 스타일 및 색상으로 조절 */
		    border-radius: 5px; /* 원하는 테두리 모양으로 조절 */
		    padding: 4px; /* 원하는 안쪽 여백 값으로 조절 */
		    font-size: 16px; /* 원하는 글자 크기로 조절 */
		}
        
        input[type="submit"] 
		{
		
		
			margin-left: 100px;
			margin-right: -105px;
			margin-top: 20px;
	        width: 95px; /* 원하는 너비 값으로 조절 */
	        height: 55px; /* 원하는 높이 값으로 조절 */
	        border: 2px solid #D8BCD1; /* 원하는 테두리 스타일 및 색상으로 조절 */
	        border-radius: 5px; /* 원하는 테두리의 둥글기 정도로 조절 */
	        background-color: #D8BCD1; /* 원하는 배경 색상으로 조절 */
	        color: #ffffff; /* 원하는 텍스트 색상으로 조절 */
	        font-size: 40px; /* 원하는 글자 크기로 조절 */
	        padding-bottom: 20px;
	        cursor: pointer; /* 마우스를 갖다 댈 때 커서 모양을 손가락으로 변경 */
	        font-family: 'Nanum Pen Script', cursive;
	        
	        
			/* margin-left: 55px;
			margin-right: -42px;
	        width: 50px; /* 원하는 너비 값으로 조절 */
	        height: 30px; /* 원하는 높이 값으로 조절 */
	        border: 2px solid #D8BCD1; /* 원하는 테두리 스타일 및 색상으로 조절 */
	        border-radius: 3px; /* 원하는 테두리의 둥글기 정도로 조절 */
	        background-color: #D8BCD1; /* 원하는 배경 색상으로 조절 */
	        color: #ffffff; /* 원하는 텍스트 색상으로 조절 */
	        font-size: 15px; /* 원하는 글자 크기로 조절 */
	        cursor: pointer; /* 마우스를 갖다 댈 때 커서 모양을 손가락으로 변경 */ */
	    }
	
	    input[type="submit"]:hover {
	        background-color: #C9A8B8; /* 마우스 오버 시 변경할 배경 색상 */
	        border-color: #C9A8B8; /* 마우스 오버 시 변경할 테두리 색상 */
	    }
	    
	    label
        {
            display: inline-block;
            width: 100px;  /* 레이블 너비 조절 */
            text-align: right;
            margin-right: 10px;
        }

        input[type="text"], input[type="password"], input[type="user_id"] 
        {
            width: 200px; /* 입력 필드 너비 조절 */
            height: 25px;
            margin-bottom: 10px;
        }

        #menu 
        {
            background-color: #D8BCD1;
            padding: 18px;
            position: fixed;
            bottom: 0;
            height: 80px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transform: translateX(-20px);
        }

        #menu a 
        {
            text-decoration: none;
            color: #000000;
            margin: 0 30px;
        }

        @media only screen and (max-width: 600px) 
        {
            #menu 
            {
                flex-direction: column;
                transform: none;
            }
        }
        
        
         button
        {
          font-family: 'Nanum Pen Script', cursive;
         width: 120px; /* 원하는 너비 값으로 조절 */
	        height: 60px; /* 원하는 높이 값으로 조절 */
           border: 2px solid #D8BCD1; /* 원하는 테두리 스타일 및 색상으로 조절 */
           border-radius: 7px; /* 원하는 테두리의 둥글기 정도로 조절 */
           background-color: #D8BCD1; /* 원하는 배경 색상으로 조절 */
           color: #ffffff; /* 원하는 텍스트 색상으로 조절 */
           font-size: 50px; /* 원하는 글자 크기로 조절 */
           padding-bottom: 20px;
           cursor: pointer; /* 마우스를 갖다 댈 때 커서 모양을 손가락으로 변경 */
        }
        
        
        .log 
        {
         color: #000000;
          /* margin: 50px; */
          margin-top: 20px;
          
         padding: 10px 24px;
          font-size: 30px;
          font-family: 'Nanum Pen Script', cursive;
          right: 1%;
          bottom: 10%;
            margin-bottom: 5px;
        }
        
        
       .Tutorial {
       color: #000000;
          /* margin: 50px; */
          margin-top: 20px;
          
         padding: 10px 24px;
          font-size: 30px;
          font-family: 'Nanum Pen Script', cursive;
          right: 1%;
          bottom: 20%;
            margin-bottom: 5px;
       }
       
      .modal {
  display: none; /* 처음엔 보이지 않음 */
  position: fixed; /* 고정 위치 */
  z-index: 1; /* 상위에 위치 */
  left: 0;
  top: 0;
  width: 100%; /* 전체 너비 */
  height: 100%; /* 전체 높이 */
  overflow: auto; /* 필요시 스크롤 */
  background-color: rgba(0, 0, 0, 0.4); /* 배경 색과 투명도 조절 */
  border-radius: 10px; /* 모서리를 둥글게 만듦 */
  font-family: 'Nanum Pen Script', cursive;
}

/* 모달 내용 스타일 */
.modal-content {
  background-color: #D8BCD1;
  margin: 15% auto; /* 중앙 정렬 */
  padding: 20px;
  border: 1px solid #888;
  width: 70%; /* 너비 조절 */
  border-radius: 10px; /* 모서리를 둥글게 만듦 */
  font-family: 'Nanum Pen Script', cursive;
}

/* 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 50px; /* 더 큰 크기로 변경 */
  font-weight: bold;
  font-family: 'Nanum Pen Script', cursive;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.modal-content h3 {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 20px;
  font-size: 50px;
  font-family: 'Nanum Pen Script', cursive;
}


    </style>
</head>
<body>

   <div id="header">
   <a href="main.jsp" style="cursor:pointer">
            <h1>감정일기 - To You</h1>
         </a>
       <div id="datetime"></div>
   </div>

<div id="myModal" class="modal">
  <!-- 모달 내용 -->
  <div class="modal-content">
    <h3>알림 <span class="close">&times;</span></h3>
    <iframe id="modalIframe" src="about:blank" style="width:100%; height:500px; border: none; border-radius: 10px; /* 알림의 모서리 둥글게 */"></iframe>
  </div>
</div>
  

<div class="Tutorial" style="display: inline-block; margin-left: 50px; float:right;  margin-top: 50px; position: absolute;">  
<button id="myBtn" style="margin-bottom: 40px;">
  <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16" style="cursor:pointer;">
    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
  </svg>
</button>
</div>
  


<div class="log" style="display: inline-block; margin-left: 50px; float:right;  margin-top: 50px; position: absolute;">
  
    <button style="margin-bottom: 40px;" onclick="logout()">로그아웃</button>
    </div>
    
    
    <div id="menu">
        <a onclick="history.back()" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-chevron-compact-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223"/>
</svg></a>
        <a href="di.jsp" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9 9 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.4 10.4 0 0 1-.524 2.318l-.003.011a11 11 0 0 1-.244.637c-.079.186.074.394.273.362a22 22 0 0 0 .693-.125m.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6-3.004 6-7 6a8 8 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a11 11 0 0 0 .398-2"/>
</svg>
        </a>
<a href="pli.jsp" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
</svg></a>
        <a href="calen.jsp" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
</svg></a>
		<a href="list.jsp" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
  <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4"/>
</svg></a>
        <a href="set.jsp" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0"/>
  <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z"/>
</svg></a>
        <a onclick="history.forward()" style="cursor:pointer">
        <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671"/>
</svg></a>
    </div>
    
      <div style="text-align: center; margin-top: 120px;">
    <a href="#" onclick="login.jsp">
    <img src="./diary.png" style="float: left;" width="500" height="650" alt="Diary Image">
</a></div>


    <script>
    function updateDateTime() 
    {
    	var now = new Date();
        // 날짜와 시간 옵션을 분리합니다.
        var dateOptions = { year: 'numeric', month: 'long', day: 'numeric' };
        var timeOptions = { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true };
        
        // 날짜와 시간을 각각 toLocaleString으로 변환합니다.
        var dateStr = now.toLocaleString('ko-KR', dateOptions);
        var timeStr = now.toLocaleString('ko-KR', timeOptions);
        
        // 날짜와 시간 사이에 원하는 만큼의 공백을 추가합니다.
        var dateTimeStr = dateStr + ' ' + timeStr; // 여기에서 공백을 조절할 수 있습니다.

        var dateTimeElement = document.getElementById('datetime');
        dateTimeElement.innerHTML = dateTimeStr;
    }

    // Initial call to display date and time
    updateDateTime();

    // Update date and time every second
    setInterval(updateDateTime, 1000);
        
       
        function logout() 
        {
          // 예시 로그아웃 요청 (서버 구현에 따라 다를 수 있음)
          /*
          fetch('/logout', {
            method: 'POST',
            credentials: 'include' // 필요한 경우, 쿠키를 포함시킵니다.
          }).then(response => {
            if (response.ok) {
              window.location.href = 'login.jsp'; // 로그인 페이지로 이동
            } else {
              alert('로그아웃에 실패했습니다.');
            }
          }).catch(error => {
            console.error('로그아웃 요청 중 오류 발생:', error);
          });
          */

          // 임시로 로그인 페이지로 즉시 이동하는 이 예시를 사용합니다.
          window.location.href = 'login.jsp';
        }
        
     // 모달 가져오기
        var modal = document.getElementById("myModal");

        // 모달을 여는 버튼
        var btn = document.getElementById("myBtn");

        // 모달을 닫는 span 요소
        var span = document.getElementsByClassName("close")[0];

        // 버튼 클릭시 모달 열기
        btn.onclick = function() {
          modal.style.display = "block";
          // iframe에 원하는 웹페이지 URL 설정
          document.getElementById("modalIframe").src = "http://localhost:8088/UI/set_alarm.jsp";
        }

        // span 클릭시 모달 닫기
        span.onclick = function() {
          modal.style.display = "none";
        }

        // 모달 외부 클릭시 모달 닫기
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
    </script>

</body>
</html>