<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
		
		});//click
		$("#editBtn").click(function(){
			
		});//click
		
	});
</script>
<sec:authentication var="principal" property="principal" />
<table class="table">
<tbody>
<tr>
	<td >${postVO.title }</td><td style="text-align:right;">${postVO.timePosted }</td><td style="text-align:right;">조회수:${postVO.hits }</td>
</tr>
<tr>
	<td colspan="3">${postVO.content }</td>
</tr>
<c:if test="${postVO.insiderVO.memberVO.id==principal.id }">
<tr>
<td colspan="3">
	<i id="editBtn"class="material-icons button edit">edit</i>&nbsp;&nbsp;<i id="deleteBtn" class="material-icons button delete">delete</i>
</td>
</tr>
</c:if>
</tbody>

</table>