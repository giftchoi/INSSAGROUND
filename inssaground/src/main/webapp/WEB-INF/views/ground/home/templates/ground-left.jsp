<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-12  col-md-12 meta-details">
	<ul class="tags">
		<li><a href="#">Food,</a></li>
		<li><a href="#">Technology,</a></li>
		<li><a href="#">Politics,</a></li>
		<li><a href="#">Lifestyle</a></li>
	</ul>
	<div class="user-details row">
		<p class="user-name col-lg-12 col-md-12 col-6">
			<a href="ground-home.do?groundNo=${sessionScope.ground.groundNo}">모임 홈</a>
			<span class="lnr lnr-user"></span>
		</p>
		<p class="user-name col-lg-12 col-md-12 col-6">
			<a href="groundScheduleList.do?groundNo=${sessionScope.ground.groundNo}">일정 리스트</a>
			<span class="lnr lnr-user"></span>
		</p>
		<p class="user-name col-lg-12 col-md-12 col-6">
			<a href="groundNoticeList.do?groundNo=${sessionScope.ground.groundNo}">공지 게시판</a>
			<span class="lnr lnr-user"></span>
		</p>
		<p class="date col-lg-12 col-md-12 col-6">
			<a href="groundPost.do?groundNo=${sessionScope.ground.groundNo}">자유게시판</a> <span class="lnr lnr-calendar-full"></span>
		</p>
		<p class="view col-lg-12 col-md-12 col-6">
			<a href="groundMemberList.do">INSSA MEMBER</a> <span class="lnr lnr-eye"></span>
		</p>
		<sec:authentication var="principal" property="principal" />
			<c:if test="${sessionScope.ground.master eq principal.id}">
				<p class="view col-lg-12 col-md-12 col-6">
					<a href="groundMasterPage.do">모임 관리</a> <span class="lnr lnr-eye"></span>
				</p>
			</c:if>
		<!-- <ul class="social-links col-lg-12 col-md-12 col-6">
											<li><a href="#"><i class="fa fa-facebook"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter"></i></a></li>
											<li><a href="#"><i class="fa fa-github"></i></a></li>
											<li><a href="#"><i class="fa fa-behance"></i></a></li>
										</ul>		 -->
	</div>
</div>