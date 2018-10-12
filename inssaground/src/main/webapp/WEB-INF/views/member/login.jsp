<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%-- <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/register.css" > --%>
<div class="col-sm-12 main-content">
<div class="card-container">
	<div class="form-card">
		<h1 class="title"> LOGIN</h1>
		<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<br>
	<form action="${pageContext.request.contextPath}/login.do"	method="post" id="loginForm">
	<sec:csrfInput/>
		<div class="input-container">
			 아이디<input type="text" required="required" name="id"/>
		</div>
		<div class="input-container">
			 패스워드 <input type="password" required="required" name="password"/>
		</div>
		<div >
			 <input type="submit" value="로그인"><br>
			 </div>
		</form>
		</sec:authorize>
      <div class="c-footer"><a href="#">Join Us</a></div>
      <div class="c-footer"><a href="#">Forgot your id?</a></div>
       <div class="c-footer"><a href="#">Forgot your password?</a></div>
	</div>
	</div>
</div>
