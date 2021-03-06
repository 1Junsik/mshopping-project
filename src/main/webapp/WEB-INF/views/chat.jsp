<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Sankai</title>
<link rel='stylesheet' href='./resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='./resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>

.msgWrap {
   width: 70%;
   margin-left: auto;
    margin-right: auto;
}

#msgArea {
   border: 1px solid black;
   overflow-y:scroll;
   background-color: #CEECF5;
   height: 600px;
   margin-bottom:10px;
}
#msg {
  border: 0; 
  border-radius: 5px;
  padding: 10px; 
  margin-right: 
  0.5%;
  background-color: #eee;
}
#msgIntro {
   margin-top: 30px;
   font-size: 30px;
   font-family: 'Single Day', cursive;
   text-align: center;
}

.inputWrap {
   width: 100%;
   margin-bottom: 50px;
}

.inputForm {
   width: 100%;
}

.mainButtonWrap {
   width: 70%;
   margin-left: auto;
   margin-right: auto;
   margin-bottom: 10px;
   text-align: center;
   
}

#button-send {
  width: 80px; 
  border-radius: 5px;
  background: #ffd600; 
  border: none; 
  padding: 10px; 
}

.chat_wrap .header { font-size: 25px; padding: 15px 0; background: #8B4513; color: white; text-align: center; font-family: 'Single Day', cursive; }
#msgArea {margin-top: 25px; font-family: 'Single Day', cursive;}

.msgArea .chat_ul  { font-size: 20px;  margin-top: 10px;}
.msgArea .chat_ul .sender  { margin: 10px 20px 0 20px; font-weight: bold; }
.msgArea .chat_ul .message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: right; }

</style>
<script src="./resources/jquery/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Single+Day&display=swap');
</style>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<div class="chat_wrap">
   <div class="header">
      <b>SANKAITALK</b>
   </div>
   <div class="msgWrap">
   
      <div id="msgIntro" class="col">
      
      </div>
      
      <div id="msgArea" class="col">
      
      </div>
      <table class="inputWrap">
      <tr class="input_div">
         <td class="inputForm"><input type="text" id="msg" class="form-control" placeholder="???????????? ????????? ???????????? ???????????????."></td>
         <td class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-send">??????</button>
         </td>
      </tr>
      </table>
   </div>
   <div class="mainButtonWrap">
      <a href="../mountshop" class="btn btn-light">????????????</a>
      <c:if test="${userid == '?????????'}">
         <a href="#" id="allDelete" class="btn btn-danger">????????????</a>
      </c:if>
   </div>
</div>

<script type="text/javascript">
var url;
var sock;

$(document).ready(function() {
   $('#msg').on('keypress', textKeyPress);
});

//?????? ?????? ????????? ?????????
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
//???????????? ???????????? ????????? ???
function onMessage(msg) {
   
   var data = msg.data;
   var sessionId = null; //???????????? ?????? ??????
   var message = null;
   
   var arr = data.split(":");
   
   for(var i=0; i<arr.length; i++){
      console.log('arr[' + i + ']: ' + arr[i]);
   }
   
   var cur_session = '${userid}'; //?????? ????????? ????????? ??? ??????
   console.log("cur_session : " + cur_session);
   
   sessionId = arr[0];
   message = arr[1];
   
    //????????? ??? ?????????????????? ??? ?????????????????? ???????????? ??????
   if(sessionId == cur_session){
      
      var str = "<div class='msgArea'>";
      str += "<div class='chat_ul' style='text-align: right;'>";
      str += "<b class='sender'>" + sessionId + " <br> " + "</b>" + "<b class='message' style='background: #ffd600;'>" + message + "</b>";
      str += "</div></div>";
      
      $("#msgArea").append(str);
   }
   else{
      
      var str = "<div class='msgArea'>";
      str += "<div class='chat_ul' style='text-align: left;' >";
      str += "<b class='sender'>" + sessionId + " <br> " + "</b>" + "<b class='message'>" + message + "</b>";
      str += "</div></div>";
      
      $("#msgArea").append(str);
   }
    
    let chat = document.querySelector('#msgArea');
    msgArea.scrollTop = msgArea.scrollHeight;
    
   var data = {
         message : message
         };
    
   $.ajax({ 
      url : "addChat",
      type : "post",
      data: data,
        async : false,
      success: function(result) { 
         if(result == 1) {
            alert("????????? ?????? ??????");
         }
      }
   });
}
//??????????????? ????????? ???
function onClose(evt) {
   
   var user = '${userid}';
   var str = user + " ?????? ?????????????????????.";
   
   $("#msgArea").append(str);
}
//???????????? ???????????? ???
function onOpen(evt) {
   
   var user = '${userid}';
   var str = user + "???! ??? ?????? ??????????????? ???????????? ???????????? ???????????????. ????????? ??????????????? :)";
   
   $("#msgIntro").append(str);
   
   $.ajax({ 
      url : "chatList",
      type : "post",
        async : false,
      success: function(data) { 
         alert("????????? ?????? ???????????? ??????!");
         $(data).each(function(data) {
            if(user == this.userName){
               
               var str = "<div class='msgArea'>";
               str += "<div class='chat_ul' style='text-align: right;'>";
               str += "<b class='sender'>" + this.userName + " <br> " + "</b>" + "<b class='message' style='background: #ffd600;'>" + this.chCon + "</b>";
               str += "</div></div>";
               
               $("#msgArea").append(str);
            }
            else{
               
               var str = "<div class='msgArea'>";
               str += "<div class='chat_ul' style='text-align: left;'>";
               str += "<b class='sender'>" + this.userName + " <br> " + "</b>" + "<b class='message'>" + this.chCon + "</b>";
               str += "</div></div>";
               
               $("#msgArea").append(str);
            }
         });
      }
   });
}

//??????????????? ???????????? ??? ????????? ????????? ??????
function textKeyPress(event) {
   if (event.which == 13) {
      sendMessage();
   }
}
</script>

<c:if test="${userid == '?????????'}">
   <!-- ?????? ?????? ?????? ?????? ????????????  -->
   <script type="text/javascript">
      $("#allDelete").on("click", function() {
         var flag = confirm('????????????, ?????? ?????? ?????? ?????? ???????????????????');
      
         if(flag) {
            $.ajax({
               url : "allDelete",
               type : "post",
               success : function(){
                  location.reload(true);
               }
            });
         }
      });
</script>
</c:if>
   <footer id="colophon" class="site-footer">
   <div class="container">
      <div class="site-info">
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Sankai</h1>
         <i class="fa fa-love"></i><a href="intro">????????? ??????</a><br><a href="https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%B2%95">????????????</a>

      </div>
   </div>   
   </footer>
</body>
</html>