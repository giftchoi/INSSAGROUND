<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style type="text/css">

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
	<li><a href="groundApplyForm.do">TEST</a></li>
	<li><a  href="" title="홈">HOME</a></li>
	<li><a href="groundList.do" title="모임">GROUND</a></li>
	<li><a href="home.do"> 
<sec:authorize access="!hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOff.png" title="discharged! inssaground home "  width="200" height="130"/>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<img src="${pageContext.request.contextPath}/resources/image/logoOn.png" title="charging.. inssaground home"  width="200" height="130"/>
</sec:authorize>
</a></li>
	<li><a href="gameHome.do">GAME</a></li>
	<li><a href="">ABOUT US</a></li>
</ul>
</div>