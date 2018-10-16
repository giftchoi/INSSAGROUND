<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%-- <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/register.css" > --%>
<div class="col-sm-12 main-content">
<div class="card-container">
	<div class="form-card">
		<h1 class="title"> 아이디 찾기</h1>
	<br>
	<form action="${pageContext.request.contextPath}/findMemberId.do"	method="post">
		<sec:csrfInput/> 
		<div class="input-container">
			 이름<input type="text" required="required" name="name"/>
		</div>
		<div class="input-container">
			 이메일<input type="text" required="required" name="email"/>
		</div>
		<div >
			 <input type="submit" value="아이디 찾기"><br>
			 </div>
		</form>
      <div class="c-footer"><a href="registerForm.do">Join Us</a></div>
       <div class="c-footer"><a href="findPasswordForm.do">Forgot your password?</a></div>
	</div>
	</div>
</div>
