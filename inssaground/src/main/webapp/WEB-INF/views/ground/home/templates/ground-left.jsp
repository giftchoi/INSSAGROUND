<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<script>
 function withDraw(){
	if(confirm("해당 모임에서 탈퇴하겠습니까?"))
	$("#withDrawForm").submit();
 }

</script>

<div class="col-lg-12  col-md-12 meta-details">

	<ul class="tags">
		<li><a href="ground-home.do?groundNo=${sessionScope.ground.groundNo}">홈</a></li><br>
		<li><a href="groundScheduleList.do?groundNo=${sessionScope.ground.groundNo}">정모 일정</a></li><br>
		<li><a href="groundNoticeList.do?groundNo=${sessionScope.ground.groundNo}">공지 게시판</a></li><br>
		<li><a href="groundPost.do?groundNo=${sessionScope.ground.groundNo}">자유 게시판</a></li><br>
		<li><a href="groundMemberList.do?groundNo=${sessionScope.ground.groundNo}">회원 목록</a> </li><br>
		<li><a href="javascript:withDraw()">모임 탈퇴</a> </li><br>
				<sec:authentication var="principal" property="principal" />
			<c:if test="${sessionScope.ground.master eq principal.id}">
				<li><a href="groundMasterPage.do">모임 관리</a></li>
			</c:if>
	</ul>
</div>
<form id="withDrawForm" action="withdrawGround.do" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="groundNo" value="${sessionScope.ground.groundNo }">
</form>