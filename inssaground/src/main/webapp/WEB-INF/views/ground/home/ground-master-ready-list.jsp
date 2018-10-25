<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>

</style>
<script>
	$(document).ready(function(){
		$(".approveBtn").click(function(){
			var form = $("#approvalForm");
			form.attr("action","approveParticipation.do");		
			var id = form.find(":input[type=hidden]").eq(2);		
			id.val($(this).parent().parent().find("#id").text());
			form.submit();
		});//click
		$(".rejectBtn").click(function(){
			if(confirm("해당 회원의 모임 참여를 거절하시겠습니까?")){
				var form = $("#approvalForm");
				form.attr("action","rejectParticipation.do");
				var id = form.find(":input[type=hidden]").eq(2);		
				id.val($(this).parent().parent().find("#id").text());
				form.submit();
			}
		});//click
		
	});//ready
</script>

<table class="table simpleTable">
<thead>
	<tr>
		<th colspan="5"> 모임 참여 대기 회원 </th>
	</tr>
	<tr class="center">
      <th>#</th>
      <th colspan="2">회원 정보</th>
      <th>승인</th>
      <th>거절</th>
    </tr>
</thead>
	<tbody>
			<c:if test="${empty requestScope.readyList }">
				<tr>
					<td colspan="5"> 참여 신청 회원이 없습니다. </td>
				</tr>
			</c:if>
		<c:forEach items="${requestScope.readyList }" var="mvo" varStatus="info">	
			<tr class="center">
				<td rowspan="3">${info.count }</td><td rowspan="3"><img src="${pageContext.request.contextPath }/resources/uploadImage/${mvo.profile}" width="100px" height="120px"></td><td id="id">${mvo.id }</td><td><input id=""type="button" class="approveBtn btn btn-red" value="참여승인"></td>
					<td><input id=""class="rejectBtn btn btn-grey"type="button" value="참여거절">	</td>	
			</tr>
			<tr>
				<td>${mvo.name }</td>
			</tr>
			<tr>
				<td>${mvo.email }</td>
			</tr>
			<%-- <tr>
			<td>${info.count }</td>
			<td>프로필 이미지 넣기</td>
				<sec:csrfInput/>				
					<td colspan="2"><tr><td>${mvo.id }</td></tr>(${mvo.name })<h5>${mvo.email }</h5></td>	<!-- second child  -->
					<td><input id=""type="button" class="approveBtn btn btn-red" value="참여승인"></td>
					<td><input id=""class="rejectBtn btn btn-grey"type="button" value="참여거절">	</td>	
			</tr> --%>
		</c:forEach>
	</tbody>
</table>
<form id="approvalForm"method="post">
<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${sessionScope.ground.groundNo}">
		<input type="hidden" name="memberVO.id" >
</form>