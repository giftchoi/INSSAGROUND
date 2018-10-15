<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.top-header{
		text-align:right;
		padding-top:10px;
		position:relative;
		height:50px;
		width:100%;
		top:0;
}
.bottom-header{
		text-align:center;
		height:130px;
		width:100%;
}
li{
	display:inline;
	/* margin:0 1px; */
}
li a{
	display:inline-block;
	color:#222222;
	text-transform:uppercase;
	font-family: 'Montserrat', sans-serif;
	font-size:20px;
	text-decoration: none;
	/* line-height:20px; */
	margin: 5px 32px 5px 32px;
	transition:all 0.3s ease-in-out;
	-moz-transition:all 0.3s ease-in-out;
	-webkit-transition:all 0.3s ease-in-out;
}

li a:hover{ 
	text-decoration:none;
	color: #ff1a1a;
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
	<li><a  href="" title="홈">HOME</a></li>
	<li><a href="" title="모임">GROUND</a></li>
	<li><a href="home.do"> 
<sec:authorize access="!hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOff.png" alt="home"  width="200" height="130"/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOn.png" alt="home"  width="200" height="130"/>
</sec:authorize>
</a></li>
	<li><a href="gameHome.do">GAME</a></li>
	<li><a href="">ABOUT US</a></li>
</ul>
</div>