<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>


li.dropdown {
    display: inline-block;
}

.dropdown-content {
	background-color:#fff;
    display: none;
    position: absolute;
    min-width: 230px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
	font-size:17px;
	font-weight:100;
    color: #6E6E6E;
    padding: 10px 5px 10px 0;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
<div class="top-header">

<sec:authorize access="!hasRole('ROLE_MEMBER')">
<ul>
   <li><a  href="loginForm.do">LOGIN</a></li>
   <li><a href="registerForm.do" style="
    padding-right: 12px;
">JOIN US</a></li>
</ul>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<ul>
   <li><a  href="#"><sec:authentication property="principal.name" />님</a></li>
   <li class="dropdown"><a href="${pageContext.request.contextPath}/myGround.do">MYPAGE</a>
   <div class="dropdown-content">
   <a  href="myGround.do">내 모임</a>
      <a href="mySchedule.do">내 일정</a>
      <a href="myProgram.do">내 프로그램</a>
      <a href="viewMemberInfo.do">나의 정보</a>
      <a href="withdrawForm.do">탈퇴</a>
      </div>
   </li>
   <li><a href="#" id="logoutAction" style="
    padding-right: 12px;
">LOGOUT</a></li>
	<li title="채팅"><div class="btn2">
</div></li>
</ul>
   <script type="text/javascript">
      $(document).ready(function() {
         $("#logoutAction").click(function() {
            $("#logoutForm").submit();
         });
      });
   </script>
   <form id="logoutForm"
      action="${pageContext.request.contextPath}/logout.do" method="post"
      style="display: none">
      <sec:csrfInput />
   </form>   
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<ul>
   <li><a  href="#"><sec:authentication property="principal.name" />님</a></li>
   <li class="dropdown"><a href="${pageContext.request.contextPath}/readyApplyGround.do">ADMIN PAGE</a>
   <div class="dropdown-content">
   <a  href="readyApplyGround.do">모임 신청 접수</a>
      <a href="reportList.do">문의 접수</a>
      <a href="upgradeCustomGameForm.do">게임 등업</a>
      <a href="viewMemberInfo.do">나의 정보</a> 
      </div>
   </li>
   <li><a href="#" id="logoutAction">LOGOUT</a></li>
</ul>
   <script type="text/javascript">
      $(document).ready(function() {
         $("#logoutAction").click(function() {
            $("#logoutForm").submit();
         });
      });
   </script>
   <form id="logoutForm"
      action="${pageContext.request.contextPath}/logout.do" method="post"
      style="display: none">
      <sec:csrfInput />
   </form>   
</sec:authorize>
</div>
<div class="bottom-header">
<ul>
	<li><a href="findHobby.do">HOBBY</a></li>
	<li class="dropdown"><a href="javascript:void(0)" title="모임">GROUND</a>
    <div class="dropdown-content">
      <a href="groundList.do">모임 찾기</a>
      <a href="groundApplyForm.do">모임 개설 신청</a>
  <!--     <a href="#">뭐를 넣을 까요</a> -->
    </div>
	</li>
	<li><a href="home.do"> 
<sec:authorize access="!hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOff.png" title="discharged! inssaground home "  width="200" height="130"/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOn.png" title="charging.. inssaground home"  width="200" height="130"/>
</sec:authorize>
</a></li>
	<li class="dropdown"><a href="javascript:void(0)" title="게임">GAME</a>
		    <div class="dropdown-content">
      <a href="gameHome.do">공식 게임</a>
      <a href="gameCustom.do">사용자 정의 게임</a>
      <a href="makeGameProgramForm.do">프로그램 만들기</a>
    </div>
	</li>
	<li class="dropdown"><a href="${pageContext.request.contextPath}/aboutus.do">ABOUT US</a>
	<div class="dropdown-content">
     	 <a  href="service.do">서비스 소개</a>
		<a href="aboutus.do">인싸그라운드 소개</a>
		<a href="team.do">팀 소개</a>
		<a href="reportForm.do">불량모임 신고</a>
    </div>
	</li>
</ul>
</div>


<div id="menu" align="left">
	<textarea name="chatMsg" rows="30" style="font-family: 'Noto Sans KR','Nanum Gothic', sans-serif !important;font-size:18px;width: 95%;height:80%;" id="chat" style="
    border-right-width: 0px;
    border-left-width: 0px;
    border-top-width: 0px; font-size:2em;" readonly="readonly"></textarea>

<p>
메시지 입력 : <input type="text" name="chatInput" placeholder="입력후 엔터치면 서버로 전송" size="25" autofocus="autofocus">
  <div onclick="history.back();" class="close">
  	
  </div>
</div>
<div onclick="history.back();" class="page_cover">
</div>
<script type="text/javascript">
 $(document).ready(function(){
	 var ws = new WebSocket("ws://192.168.0.148:8888/inssaground/chat-ws.do");
		//121.169.168.159
		//192.168.0.148
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
	 		//document.getElementById("chat").eq(0).append(evt.data+"\n").style.textAlign = 'right';
	 		$("textarea").eq(0).append(evt.data+"\n");
	 		document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;

	 	}; // onmessage
	 	ws.onclose = function(evt){
	 		$("status").text("연결 X");
	 	};//onclose
	 
	 
	 
	 
	 
	 /////////////////////////////
	 $(".btn2").click(function() {
		  $("#menu,.page_cover,html").addClass("open");
		  window.location.hash = "#open";
		});

		window.onhashchange = function() {
		  if (location.hash != "#open") {
		    $("#menu,.page_cover,html").removeClass("open");
		  }
		};
 });
</script>
<style>
html.open {
  overflow: hidden;
}

.btn2 {
  width: 50px;
  height: 50px;
  position: absolute;
  right: 0px;
  top: 0px;
  z-index: 1;
  background-image: url("http://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/menu.png");
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}

.close {
  width: 50px;
  height: 50px;
  position: absolute;
  right: 0px;
  top: 0px;
  background-image: url("http://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/close.png");
  background-size: 50%;
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
}
p{
font-family: 'Noto Sans KR','Nanum Gothic', sans-serif !important;
font-size:17px;
}
#menu {
  width: 400px;
  height: 100%;
  position: fixed;
  top: 0px;
  right: -402px;
  z-index: 10;
  border: 1px solid #c9c9c9;
  background-color: white;
  text-align: center;
  transition: All 0.2s ease;
  -webkit-transition: All 0.2s ease;
  -moz-transition: All 0.2s ease;
  -o-transition: All 0.2s ease;
}

#menu.open {
  right: 0px;
}

.page_cover.open {
  display: block;
}

.page_cover {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0px;
  left: 0px;
  background-color: rgba(0, 0, 0, 0.4);
  z-index: 4;
  display: none;
}
</style>
