<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
			if(confirm("해당 게시물을 삭제하시겠습니까?")){
				//location.href="groundPostDelete.do?postNo=${postVO.postNo}";
				$("#deleteForm").submit();
			}
		});//click
		$("#editBtn").click(function(){
			alert();
			if(confirm("해당 게시물을 수정하시겠습니까?")){
				location.href="groundPostUpdateForm.do?postNo=${postVO.postNo}";
			}
/* 			if(confirm("해당 게시물을 수정하시겠습니까?")){
				location.href="groundPostUpdateForm.do?postNo="+${postVO.postNo};
			} */
		});//click
		
	});
</script>
<sec:authentication var="principal" property="principal" />

<table class="table simpleTable">
<thead>
	<tr>
		<th  style="text-align:left; font-size:20px;">${postVO.title }</th><th style="text-align:right;"><input type="button"
							class="btn btn-white" value="목록" onclick="location.href='groundPost.do?groundNo=${sessionScope.ground.groundNo}'"></th>
	</tr>
</thead>

<tbody>

<tr>
<td style="text-align:left;">작성자 : ${postVO.insiderVO.memberVO.id }</td><td style="text-align:right;">${postVO.timePosted } 조회수:${postVO.hits }</td>
</tr>
<tr>
	<td colspan="2">${postVO.content }</td>
</tr>
<c:if test="${postVO.insiderVO.memberVO.id==principal.id }">
<tr>
<td colspan="2">
	<a id="editBtn" class="btn btn-grey">수정</a>&nbsp;&nbsp;<a id="deleteBtn" class="btn btn-grey">삭제</a>
</td>
</tr>
</c:if>
</tbody>
</table>
<form id="deleteForm" action="groundPostDelete.do" method="post">
<sec:csrfInput/>
	<input type="hidden" name="postNo" value="${postVO.postNo }">
	<input type="hidden" name="insiderVO.groundNo" value="${sessionScope.ground.groundNo }">
</form>