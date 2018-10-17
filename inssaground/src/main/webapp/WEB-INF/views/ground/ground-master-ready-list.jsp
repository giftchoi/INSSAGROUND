<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$(".approveBtn").click(function(){
			var form = $(this).parent();
			form.attr("action","approveParticipation.do");
			alert(form.attr("action"));
			form.submit();
		});//click
		$(".rejectBtn").click(function(){
			
			$("#approvalForm").attr("action","rejectParticipation.do");
			$("#approvalForm").submit();
		});//click
		
	});//ready
	
	
</script>
<c:forEach items="${requestScope.readyList }" var="mvo">
	프로필 이미지 넣기
	<form method="post">
	<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${sessionScope.ground.groundNo}">
		<input type="text" name="memberVO.id" readonly="readonly"value="${mvo.id }"><br>
		<input id=""type="button" class="approveBtn btn btn-red" value="참여승인">
		<input id=""class="rejectBtn btn btn-grey"type="button" value="참여거절">
	</form>
</c:forEach>
