<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.red-outline {
	padding-top:15%;
	margin : 60px 0px 60px;
	width: 100%;
	height: 80%;
	border: 3px solid red;
}
.content{
	min-height:800px;
	text-align : center;
}
</style>
<div class="col-sm-12">
	<div class="row content">
		<div class="col-sm-8 offset-2">
			<div class="red-outline">
				<div>
					<h1>이메일로 임시 패스워드가 발급되었습니다</h1>
					<span class="fa fa-check-square fa-5x"></span><br><br><br><br><br>
					<form action="${pageContext.request.contextPath}/home.do">
					<input class="btn btn-danger" type="submit" value="홈으로 이동">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>