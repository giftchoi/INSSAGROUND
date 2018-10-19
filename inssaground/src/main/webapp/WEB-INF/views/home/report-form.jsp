<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">불량 모임 신고</h1>		
			<form action="reportGround.do" method="post">
				<sec:csrfInput/>
				<div class="input-container">
					모임명<br>
					<select name="groundNo">
						<option>-------</option>
						<c:forEach items="${groundList}" var="groundList">
						<option value="${groundList.GROUNDNO}">${groundList.groundName}</option>
						</c:forEach>
					</select>		
				</div>
				<div class="input-container">
					신고 글 제목 <input type="text" name="title">
				</div>
				<div class="input-container">
					신고 내용<br>
					<textarea name="content" rows="10" cols="70"></textarea>
				</div>
				<div>
					<input type="submit"  value="신고"><br>
				</div>
			</form>
		</div>
	</div>
</div>