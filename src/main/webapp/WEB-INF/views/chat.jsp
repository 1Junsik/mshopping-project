<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Chatting</title>
<style>
#msgArea {
	width: 700px;
	height: 400px;
	border: 1px solid black;
	overflow-y:scroll;
}
#msg {
	width: 500px;
}
#msgIntro {
	margin-top: 30px;
	font-size: 30px;
	font-family: 'Single Day', cursive;
}

.chat_wrap .header { font-size: 25px; padding: 15px 0; background: #F18C7E; color: white; text-align: center; font-family: 'Single Day', cursive; }

#msgArea {margin-top: 25px; font-family: 'Single Day', cursive;}
.msgArea .chat_ul  { font-size: 20px;  margin-top: 10px;}
.msgArea .chat_ul .sender  { margin: 10px 20px 0 20px; font-weight: bold; }
.msgArea .chat_ul .message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }


</style>
<script src="./resources/jquery/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
</style>

</head>
<body>

<div class="chat_wrap">
	<div class="header">
		<b>단체 채팅방</b>
	</div>
	<div>
	
		<div id="msgIntro" class="col">
		
		</div>
		
		<div id="msgArea" class="col">
		
		</div>
		<div class="input-div">
			<input type="text" id="msg" class="form-control" placeholder="엔터키를 누르면 메시지가 전송됩니다.">
<!-- 			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
			</div> -->
		</div>
	</div>
	<div>
		<a href="../mountshop">메인화면</a>
	</div>
</div>

<script type="text/javascript">
var url;
var sock;

$(document).ready(function() {
	$('#msg').on('keypress', textKeyPress);
});

//전송 버튼 누르는 이벤트
$("#button-send").on("click", function(e) {
	sendMessage();
	$('#msg').val('')
});

url = 'ws://localhost:8888/mountshop/chat';
sock = new WebSocket(url);
sock.onmessage = onMessage;
sock.onclose = onClose;
sock.onopen = onOpen;


function sendMessage() {
	sock.send($("#msg").val());
	$('#msg').val('');
}
//서버에서 메시지를 받았을 때
function onMessage(msg) {
	
	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	
	var arr = data.split(":");
	
	for(var i=0; i<arr.length; i++){
		console.log('arr[' + i + ']: ' + arr[i]);
	}
	
	var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
	console.log("cur_session : " + cur_session);
	
	sessionId = arr[0];
	message = arr[1];
	
    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
	if(sessionId == cur_session){
		
		var str = "<div class='chat_wrap'>";
		str += "<div class='chat_ul'>";
		str += "<b>" + sessionId + " : " + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
	else{
		
		var str = "<div class='msgArea'>";
		str += "<div class='chat_ul'>";
		str += "<b class='sender'>" + sessionId + " <br> " + "</b>" + "<b class='message'>" + message + "</b>";
		str += "</div></div>";
		
		$("#msgArea").append(str);
	}
    
    let chat = document.querySelector('#msgArea');
    msgArea.scrollTop = msgArea.scrollHeight;
	
}
//채팅창에서 나갔을 때
function onClose(evt) {
	
	var user = '${userid}';
	var str = user + " 님이 퇴장하셨습니다.";
	
	$("#msgArea").append(str);
}
//채팅창에 들어왔을 때
function onOpen(evt) {
	
	var user = '${userid}';
	var str = user + "님! 채팅은 익명성이 보장되니, 안심하고 유저들과 소통해주세요 :)";
	
	$("#msgIntro").append(str);
}

//입력란에서 엔터쳤을 때 서버로 메시지 전송
function textKeyPress(event) {
	if (event.which == 13) {
		sendMessage();
	}
}
</script>
</body>
</html>