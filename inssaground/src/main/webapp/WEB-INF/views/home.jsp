<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style type="text/css">
.rowgamefooter{
    position : absolute;
    width: inherit;
    bottom: 0;
    margin-left: 0;
}
</style>
<div class="col-sm-10 offset-1">
	<div class="row main-content">
		<div class="col-sm-12">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg.jpg"
							alt="Los Angeles" width="1000" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg2.jpg"
							alt="Chicago" width="1000" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg3.jpg"
							alt="New York" width="1000" height="500">
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>

		</div>
	</div>
	<div class="row main-content">
		<div class="col-sm-12">
			<div class="row content-title">
				<div class="col-sm-12">
					<h1>추천 GROUND</h1>
				</div>
			</div>
			<div class="row ground-content">
				<div class="col-sm-12">
				<c:forEach items="${groundList }" var="ground">
						<button class="button circle">#${ground.groundNo }</button>
				</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<div class="row main-content">
		<div class="col-sm-12">
			<div class="row content-title">
				<div class="col-sm-12">
					<h1>이달의 인기 사용자 게임</h1>
				</div>
			</div>

			<div class="row content">
				<div class="col-sm-12">

					<div class="game-post-area">
						<c:forEach items="${requestScope.pcoList }" var="cgvo">
							<sec:authorize access="isAuthenticated()">
								<!-- 로그인 상태 -->
								<div class="card game"
									onclick="location.href='${pageContext.request.contextPath}/customGameDetail.do?cGameNo=${cgvo.cGameNo}'">
									<div class="card-header">
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
											<h5 align="right" style="color: red;">
												${cgvo.minPersonnel} ~ ${cgvo.maxPersonnel} 명</h5>
										</div>
									</div>
								</div>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div class="card game">
									<div class="card-header">
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
											<h5 align="right" style="color: red;">
												${cgvo.minPersonnel} ~ ${cgvo.maxPersonnel} 명</h5>
										</div>
									</div>
								</div>
							</sec:authorize>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

