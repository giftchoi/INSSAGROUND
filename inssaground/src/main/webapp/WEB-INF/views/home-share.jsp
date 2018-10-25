<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style type="text/css">
.rowgamefooter{
    position : absolute;
    width: inherit;
    bottom: 0;
    margin-left: 0;
}
.overlay{
 	background-color : rgba(255,26,26,0.8);
 	width: 180px;
	height: 180px;
 	margin: 10px;
 	padding-top: 70px;
	position:absolute;
	top:0;
	pointer-events:none;
	font-size:25px;
	color:white;
	font-weight:400;
}
</style>
<script>
	$(document).ready(function(){
		var gno = ${requestScope.groundNo};
		$('div.modal').modal();
		$('.modal-content').load("groundDetail.do?groundNo="+gno);
		$(".gBtn").mouseenter(function(){
			/* $(this).next().show(); */
			//alert($(this).position().left);
			$(".overlay").css("top",$(this).position().top);
			$(".overlay").css("left",$(this).position().left);
			$(".overlay").show();
		});
		$(".gBtn").mouseleave(function(){
			$(".overlay").hide();
		});
		$(".gBtn").click(function(){
			var gno = $(this).find(":input[name=groundNo]").val();
			$('div.modal').modal();
			$('.modal-content').load("groundDetail.do?groundNo="+gno);
		});
		
	});
</script>
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
							src="${pageContext.request.contextPath }/resources/image/hobbyImg_knitting.jpg"
							alt="뜨개질" width="800" height="550">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/hobbyImg_extremeSports.jpg"
							alt="익스트림스포츠" width="800" height="550">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/hobbyImg_volunteer.jpg"
							alt="봉사활동" width="800" height="550">
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
					추천 모임
				</div>
			</div>
			<div class="row ground-content">
				<div class="col-sm-12">
				<c:forEach items="${groundList }" var="ground" varStatus="info">

					<c:choose>
						<c:when test="${info.count%2==0 }">
							<button class="gBtn button circle circle-red">
						</c:when>
						<c:otherwise>
							<button class="gBtn button circle circle-grey">
						</c:otherwise>
					</c:choose>
					${fn:substring(ground.groundName,0,10) }
					<c:if test="${fn:length(ground.groundName)>10}">
					...
					</c:if>
						<input type="hidden"name="groundNo"value="${ground.groundNo }">
						<!-- <div class="overlay"  style="display:none">자세히 보기</div> -->
					</button>

					
				</c:forEach>
					<div class="overlay" style="display:none">상세 보기</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row main-content">
		<div class="col-sm-12">
			<div class="row content-title">
				<div class="col-sm-12">
					이달의 인기 사용자 게임
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
<div class="modal" id="myModal">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<input type="hidden" name="modalParent" value=self>
		</div>
	</div>
</div>
