<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="col-sm-12">
<div  align="center">
	<div class="col-sm-12 border">
		<c:forEach items="${requestScope.uco}" var="cgvo">
			<div class="card game" style="border-width: 10px;"  
				onclick="location.href='${pageContext.request.contextPath}/customGameDetail.do?cGameNo=${cgvo.cGameNo}'">
				<div class="card-header" style="text-align: center;">
					<h3>${cgvo.title }</h3>
				</div>
				<div class="card-body">
					<h5 style="font-family: serif; text-align: center;">준비물:
						${cgvo.materials }</h5>
				</div>
				<div class="row rowgamefooter">
					<div class="col-sm-6" align="left">
						<h5 style="font-family: serif; text-align: left;">${cgvo.gameTime}
							분</h5>
					</div>
					<div class="col-sm-6" align="right">
						<h5 align="right" style="color: red;">${cgvo.minPersonnel} ~
							${cgvo.maxPersonnel} 명</h5>
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/upgradeCustomGame.do" method="post" id="upgradeCustomGame">
	<sec:csrfInput/>
	
	<input type="hidden" name="cGameNo" value="${cgvo.cGameNo}">
	<input type="submit" value="등업하기" style="background-color:transparent;  border:0px transparent solid;">
	</form>
			</div>
		</c:forEach>
	</div>
	</div>
</div>

