<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">모임 개설 신청</h1>
			<form>
				<!-- <div class="input-container">
					<span id="profile-img"></span>
				</div> -->
				<div class="input-container">
					모임명<br>
					<input type="text"  maxlength="30" required="required" />
				</div>
				<div class="input-container">
					주요 취미
					<select>
						<option>-------</option>
						<option></option>
					</select>				
					<select>
						<option>-------</option>
						<option></option>
					</select>
				</div>
				<div class="input-container">
						지역
					<select>
						<option>-------</option>
						<option></option>
					</select>				
					<select>
						<option>-------</option>
						<option></option>
					</select>
				</div>
				
				<div class="input-container">
					최대인원 <input type="number" name="">
				</div>

				<div class="input-container">
					모임 소개<br>
					<pre><input type="" name=""></pre>
				</div>
				
				<div>
					<input type="button" value="개설 신청"><br>
				</div>
			</form>
		</div>
	</div>
</div>