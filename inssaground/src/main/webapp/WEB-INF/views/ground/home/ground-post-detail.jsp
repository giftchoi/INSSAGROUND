<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
		
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
<table class="table">
<tbody>
<tr>
	<td style="text-align:left; font-size:20px;">${postVO.title }</td><td style="text-align:right;">${postVO.timePosted }</td>
</tr>
<tr>
<td style="text-align:left;">작성자 : ${postVO.insiderVO.memberVO.id }</td><td style="text-align:right;">조회수:${postVO.hits }</td>
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