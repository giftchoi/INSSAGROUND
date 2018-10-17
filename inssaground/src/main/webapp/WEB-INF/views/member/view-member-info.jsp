<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <div class="row">
  <div class="col-sm-3">
  	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<ul>
		<li><a  href="loginForm.do">MY GROUND</a></li>
		<li><a href="registerForm.do">MY SCHEDULE</a></li>
		<li><a href="registerForm.do">MY GAME PROGRAM</a></li>
		<li><a href="modifyMemberForm.do">EDIT MY INFO</a></li>
		</ul>
	</sec:authorize>
  </div>
  <div class="col-sm-9">
  <div class="card-container wide">
		<div class="form-card">
			<h1 class="title">회원정보보기</h1>
				<div class="input-container">
					<span id="profile-img">
					<img src="${pageContext.request.contextPath}/resources/uploadImage/${member.profile}" width="210" height="210">
					</span>
				</div>
				<div class="input-container">
					아이디<br>
					<input type="text"  maxlength="30" required="required" name="id" readonly="readonly" value="${member.id }"/>
				</div>
				<div class="input-container">
					이름<br>
					<input type="text" maxlength="15" required="required" name="name" value="${member.name}" readonly="readonly"/>	
				</div>
				<div class="input-container">
					이메일<br>
					<input type="email" maxlength="30" required="required" name="email" value="${member.email}"  readonly="readonly"/> 
				</div>
				<div>
				<form action="modifyMemberForm.do">
				<input type="submit" class="btn btn-red" value="수정"><br>
				</form>
				</div>
		</div>
	</div>
  </div>
</div>
