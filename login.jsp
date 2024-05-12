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
            margin-left: 10px;
            font-size: 60px;
            
        }
        
         #header a 
	    {
	        text-decoration: none;
	        font-family: 'Nanum Pen Script', cursive;
	    }

        #datetime 
        {
            margin-right: 20px;
            margin-left: 10px;
            font-size: 50px;
        }

        #content 
        {
            position: fixed;
          	bottom: 4%;
            right: 4%;
            margin-bottom: 20px;
	        padding: 10px;
	        font-size: 70px;
	        font-family: 'Nanum Pen Script', cursive;
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
		    width: 270px; /* 원하는 너비 값으로 조절 */
		    height: 50px; /* 원하는 높이 값으로 조절 */
		    background-color: rgba(255, 255, 255, 0.8); /* 0.8은 반투명도를 나타내며, 필요에 따라 조절 가능 */
		    border: 1px solid #ccc; /* 원하는 테두리 스타일 및 색상으로 조절 */
		    border-radius: 7px; /* 원하는 테두리 모양으로 조절 */
		    padding: 5px; /* 원하는 안쪽 여백 값으로 조절 */
		    font-size: 50px; /* 원하는 글자 크기로 조절 */
		    font-family: 'Nanum Pen Script', cursive;
		}
		
		#user_pw
        {
		    width: 270px; /* 원하는 너비 값으로 조절 */
		    height: 50px; /* 원하는 높이 값으로 조절 */
		    background-color: rgba(255, 255, 255, 0.8); /* 0.8은 반투명도를 나타내며, 필요에 따라 조절 가능 */
		    border: 1px solid #ccc; /* 원하는 테두리 스타일 및 색상으로 조절 */
		    border-radius: 7px; /* 원하는 테두리 모양으로 조절 */
		    padding: 5px; /* 원하는 안쪽 여백 값으로 조절 */
		    font-size: 50px; /* 원하는 글자 크기로 조절 */
		    font-family: 'Nanum Pen Script', cursive;
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

        input[type="text"], input[type="user_pw"], input[type="user_id"] 
        {
            width: 200px; /* 입력 필드 너비 조절 */
            height: 25px;
            margin-bottom: 10px;
        }

        
    </style>
</head>
<body>

   <div id="header">
       <a href="login.jsp" style="cursor:pointer">
           <h1>감정일기 - To You</h1>
         </a>
       <div id="datetime"></div>
   </div>

    <div id="content">
    <form method="post" action="loginAction.jsp">
        <label for="user_id">ID:</label>
        <input type="text" id="user_id" name="user_id" required>
        <br>
        <label for="user_pw">PW:</label>
        <input type="password" id="user_pw" name="user_pw" required>
        <br>
        <input type="submit" value="login">
    	<input type="submit" value="join" onclick="window.location.href='join.jsp'">
    </form>

    
        
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
    </script>

</body>
</html>