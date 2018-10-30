<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	#chat {background-color:transparent; border:0; overflow-x:hidden; overflow-y:auto; padding-top:1; padding-right:5; padding-bottom:5; padding-left:5;}
    </style>
 <script type="text/javascript">
 	$(document).ready(function(){
 		var ws = new WebSocket("ws://192.168.0.148:8888/inssaground/chat-ws.do");
 		
 	 	ws.onopen = function(){
 	 		$("#status").text("연결 O");
 	 		$("input[name=chatInput]").keyup(function(event) {
 	 			if(event.keyCode == 13){
 	 				ws.send($("input[name=chatInput]").val());
 	 				$("input[name=chatInput]").val("");
 	 			}
 	 		}); // keyup
 	 	};//ws.onopen
 	 	ws.onmessage = function(evt){
 	 		$("textarea").eq(0).append(evt.data+"\n");
 	 		//$("textarea").scrollTop($("#textarea").prop("scrollHeight"));
 	 	}; // onmessage
 	 	ws.onclose = function(evt){
 	 		$("status").text("연결 X");
 	 	};//onclose
 	 	var $textarea = $("#chat");
 	 	$textarea.scrollTop($textarea[0].scrollHeight);
 	 	
 	});//ready
 	//document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;
	
 	
 	
 
 </script>   
    
    
<div class="container">
<h3>${sessionScope.ground.groundName} 채팅</h3>
<div id="status"></div>

<textarea name="chatMsg" rows="10" cols="40" id="chat"  autofocus></textarea>

<p>
메시지 입력 : <input type="text" name="chatInput" placeholder="입력후 엔터치면 서버로 전송" size="25" autofocus="autofocus">
</div>