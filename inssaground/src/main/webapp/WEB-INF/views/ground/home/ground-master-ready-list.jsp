<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
table {
  text-align: left;
  line-height: 40px;
  border-collapse: separate;
  border-spacing: 0;
  border: 2px solid #ff1a1a;
  width: 700px;
  margin: 50px auto;
  border-radius: .25rem;
  font-size:20px;
}

thead tr:first-child {
  background: #ff1a1a;
  color: #fff;
  border: none;
}

th:first-child,
td:first-child {
  padding: 0 15px 0 20px;
}

th {
  font-weight: 500;
  text-align:center;
}

thead tr:last-child th {
  border-bottom: 3px solid #ddd;
}

tbody tr:hover {
  background-color: #f2f2f2;
  cursor: default;
}

tbody tr:last-child td {
  border: none;
}

tbody td {
	text-align:center;
	font-size:18pxl
  border-bottom: 1px solid #ddd;
}

.button {
  color: #aaa;
  cursor: pointer;
  vertical-align: middle;
  margin-top: -4px;
}

.edit:hover {
  color: #0a79df;
}

.delete:hover {
  color: #dc2a2a;
}
</style>
<script>
	$(document).ready(function(){
		$(".approveBtn").click(function(){
			var form = $("#approvalForm");
			form.attr("action","approveParticipation.do");
			form.find("input[name=memberVO.id]");
			alert(form.attr("action"));
			form.submit();
		});//click
		$(".rejectBtn").click(function(){
			
			$("#approvalForm").attr("action","rejectParticipation.do");
			$("#approvalForm").submit();
		});//click
		
	});//ready
</script>

<table>
<thead>
	<tr>
		<th colspan="6"> 모임 참여 대기 회원 </th>
	</tr>
	<tr>
      <th>#</th>
      <th colspan="3">회원 정보</th>
      <th>승인</th>
      <th>거절</th>
    </tr>
</thead>
	<tbody>
			<c:if test="${empty requestScope.readyList }">
				<tr>
					<td colspan="6"> 참여 신청 회원이 없습니다. </td>
				</tr>
			</c:if>
		<c:forEach items="${requestScope.readyList }" var="mvo" varStatus="info">
			
			<tr>
			<td>${info.count }</td>
			<td>프로필 이미지 넣기</td>
				<sec:csrfInput/>
					<td colspan="2">${mvo.id }(${mvo.name })<h5>${mvo.email }</h5></td>	<!-- second child  -->
					<td><input id=""type="button" class="approveBtn btn btn-red" value="참여승인"></td>
					<td><input id=""class="rejectBtn btn btn-grey"type="button" value="참여거절">	</td>	
			</tr>
		</c:forEach>
	</tbody>
</table>
<form id="approvalForm"method="post">
		<input type="hidden" name="groundNo" value="${sessionScope.ground.groundNo}">
		<input type="hidden" name="memberVO.id" >
</form>