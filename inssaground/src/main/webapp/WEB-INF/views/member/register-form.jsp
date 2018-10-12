<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">회원가입</h1>
			<form>
				<div class="input-container">
					<span id="profile-img"></span>
				</div>
				<div class="input-container">
					아이디<br>
					<input type="text"  maxlength="30" required="required" />
					<span class="right-space"id=""></span>
				</div>
				<div class="input-container">
					이름<br>
					<input type="email" maxlength="15" required="required" />
					<span class="right-space"id=""></span>					
				</div>
				<div class="input-container">
					패스워드<br>
					<input type="password" maxlength="30" required="required" />
					<span class="right-space"id=""></span>
				</div>
				<div class="input-container">
					패스워드 확인<br>
					<input type="password"maxlength="30"  required="required" />
					<span class="right-space"id=""></span>
				</div>

				<div class="input-container">
					이메일<br>
					<input type="text" maxlength="30" required="required" /> 
					<span class="right-space"id=""></span>
				</div>
				<div>
					<input type="button" value="회원가입"><br>
				</div>
			</form>
		</div>
	</div>
</div>
