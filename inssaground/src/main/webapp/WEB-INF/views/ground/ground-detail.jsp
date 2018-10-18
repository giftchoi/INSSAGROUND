<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function(){	
		$("#participateBtn").click(function(){
			//window.close();
			//window.open("home.do");
			//window.top.close();
/* 			window.open('','_self','');
			window.close(); */
			opener.document.location.href="javascript:participate()";
				//"participateGround.do?groundNo="+${groundVO.groundNo};
			//self.close();
		});
	});
	
	function participate(){
		$("#participateForm").submit();
	}
</script>
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
		<div class="col-sm-12 btnArea">
			<sec:authentication var="principal" property="principal" />
			<c:set var="isInssa" value="false" />
			<c:forEach items="${principal.groundNoList}" var="ground">
				<c:if test="${not isInssa }">
					<c:if test="${ground.GROUNDNO eq groundVO.groundNo }">
					<c:choose>
						<c:when test="${ground.STATUS eq 1}">
							<a class="btn btn-red"  href="ground-home.do?groundNo=${groundVO.groundNo}">모임 홈페이지</a>
						</c:when>
						<c:otherwise>
							<input class="btn btn-grey" type="button" value="참여 대기중">
						</c:otherwise>
					</c:choose>
						<c:set var="isInssa" value="true"/>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${not isInssa}">
				<c:choose>
					<c:when test="${groundVO.participants< groundVO.maxPersonnel }">
						<input class="btn btn-red" id="participateBtn" type="button" value="참여신청">
					</c:when>
					<c:otherwise>
						<input class="btn" id="" type="button" value="정원초과">
					</c:otherwise>
				</c:choose>
				
			</c:if>
		</div>
	</div>
</div>
<form id="participateForm"method="post" action="participateGround.do">
	<sec:csrfInput/>
	<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
</form>