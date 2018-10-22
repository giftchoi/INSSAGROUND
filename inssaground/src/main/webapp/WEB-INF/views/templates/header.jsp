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
   <li><a href="registerForm.do">JOIN US</a></li>
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
<sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
<ul>
   <li><a  href="#"><sec:authentication property="principal.name" />님</a></li>
   <li class="dropdown"><a href="${pageContext.request.contextPath}/readyApplyGround.do">ADMIN PAGE</a>
   <div class="dropdown-content">
   <a  href="readyApplyGround.do">모임 신청 접수</a>
      <a href="reportList.do">문의 접수</a>
      <a href="registerForm.do">게임 등업</a>
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
	<li><a href="ground-home.do?groundNo=30">TEST</a></li>
	<li><a href="#">HOBBY</a></li>
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