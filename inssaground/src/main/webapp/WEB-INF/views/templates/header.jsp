<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>


li.dropdown {
    display: inline-block;
}

.dropdown-content {
	font-size:13px;
    display: none;
    position: absolute;
    min-width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
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
<sec:authorize access="hasRole('ROLE_MEMBER')">
<ul>
	<li><a  href="#"><sec:authentication property="principal.name" />님</a></li>
	<li><a href="${pageContext.request.contextPath}/mypage.do">MYPAGE</a></li>
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
	<li><a  href="" title="홈">HOME</a></li>
	<li class="dropdown"><a href="javascript:void(0)" title="모임">GROUND</a>
    <div class="dropdown-content">
      <a href="groundList.do">모임 찾기</a>
      <a href="groundApplyForm.do">모임 개설 신청</a>
      <a href="#">뭐를 넣을 까요</a>
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
      <a href="gameHome.do">INSSA GAME</a>
      <a href="gameCustom.do">CUSTOM GAME</a>
      <a href="#">뭐를 넣을 까요</a>
    </div>
	</li>
	<li><a href="">ABOUT US</a></li>

</ul>
</div>