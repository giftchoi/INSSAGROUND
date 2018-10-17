<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="row ground-bg-area">
		<div class="col-sm-12">
			<img
				src="${pageContext.request.contextPath }/resources/image/testImg2.jpg"
				width="100%" height="350">
		</div>
	</div>
	<div class="row ground-detail-content">
		<div class="col-sm-3">
			<img
				src="${pageContext.request.contextPath }/resources/image/testImg.jpg"
				width="150" height="150">
		</div>
		<div class="col-sm-9">
			<div class="row ground-detail-title">
				<div class="col-sm-12">
					<h3>${groundVO.groundName }</h3>
				</div>
			</div>
			<div class="row ground-detail-info">
				<div class="col-sm-12">
					<span class="info-span">${groundVO.area }</span> <span
						class="info-span">${groundVO.maxPersonnel }</span>
				</div>
			</div>
			<div class="row ground-detail-hashtag">
				<div class="col-sm-12">
					<span class="hashtag">#해시태그1</span> <span class="hashtag">#해시태그2</span>
					<span class="hashtag">#해시태그3</span>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<pre>
				<h3>${groundVO.introduction }</h3>
			</pre>
		</div>

	</div>
	<div class="row">
		<div class="col-sm-12">
			<sec:authentication var="principal" property="principal" />
			<c:set var="isInssa" value="false" />
			<c:forEach items="${principal.groundNoList}" var="groundNo">
				<c:if test="${not isInssa }">
					<c:if test="${groundNo eq groundVO.groundNo }">
						<input class="btn btn-red" type="button" value="모임 홈">
						<c:set var="isInssa" value="true"/>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${not isInssa}">
				<input class="btn btn-red" type="button" value="참여신청">
			</c:if>
		</div>
	</div>

</div>