<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <div class="row">
  <div class="col-sm-4">
  	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<ul>
		<li><a  href="loginForm.do">MY GROUND</a></li>
		<li><a href="registerForm.do">MY SCHEDULE</a></li>
		<li><a href="registerForm.do">MY GAME PROGRAM</a></li>
		<li><a href="modifyMemberForm.do">EDIT MY INFO</a></li>
		<li><a href="registerForm.do">WITHDRAW</a></li>
		</ul>
	</sec:authorize>
  </div>
  <div class="col-*-*"></div>
</div>
