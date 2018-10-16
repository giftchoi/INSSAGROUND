<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%-- <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/register.css" > --%>
<div class="col-sm-12 main-content">
<div class="card-container">
	<div class="form-card">
		<h1 class="title">임시 비밀번호 발급</h1>
	<br>
	<form action="${pageContext.request.contextPath}/findPassword.do" method="post">
	<sec:csrfInput/>
		<div class="input-container">
			 아이디<input type="text" required="required" name="id"/>
		</div>
		<div >
			 <input type="submit" value="발급"><br>
			 </div>
		</form>
      <div class="c-footer"><a href="registerForm.do">Join Us</a></div>
	</div>
	</div>
</div>
