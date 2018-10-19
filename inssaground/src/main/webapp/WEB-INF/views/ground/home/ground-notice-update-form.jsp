<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script>
	function updateNotice(){
		if(confirm("내용을 수정하시겠습니까?")){
			$("#updateForm").submit();
		}
	}
</script>

<h4>공지 수정 </h4>
<form id="updateForm"action="groundNoticeUpdate.do"method="post">
<input type="hidden" name="noticeNo" value="${noticeVO.noticeNo }">
<sec:csrfInput/>
<table class="myTable" >
	<tbody>
		<sec:authentication property="principal" var="principal"/>
		<tr>
			<td style="text-align:left"><i class="fa fa-bell"></i></td><td colspan="2" style="text-align:right">${noticeVO.timePosted }&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="content" rows="10" cols="70">${noticeVO.content }</textarea></td>
		</tr>
	</tbody>
</table>
</form>
<c:if test="${sessionScope.ground.master eq principal.id}">
<a class="btn btn-red" href="javascript:updateNotice()">수정</a>
<a class="btn btn-red" href="">취소</a>
</c:if>

