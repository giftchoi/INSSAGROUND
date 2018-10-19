<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$("#deleteBtn").click(function(){
			if(confirm("해당 공지를 삭제하시겠습니까?")){
				$("#delNoticeForm").submit();
			}
		});//click
		
		$("#editBtn").click(function(){
			if(confirm("해당 공지를 수정하시겠습니까?")){
					location.href = "groundNoticeUpdateForm.do?noticeNo="+${noticeVO.noticeNo};
			}
		});//click
		
	});
</script>

<h4>공지 상세 보기</h4>
<table class="myTable" >
	<tbody>
		<sec:authentication property="principal" var="principal"/>
		<c:if test="${sessionScope.ground.master eq principal.id}">
			<tr>
				<td colspan="3"style="text-align:right"><i id="editBtn"class="material-icons button edit">edit</i>&nbsp;&nbsp;<i id="deleteBtn" class="material-icons button delete">delete</i></td>
			</tr>
		</c:if>
		<tr>
			<td style="text-align:left"><i class="fa fa-bell"></i></td><td colspan="2" style="text-align:right">${noticeVO.timePosted }&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><pre>${noticeVO.content }</pre></td>
		</tr>
	</tbody>
</table>
<a class="btn btn-red" href="groundNoticeList.do?groundNo=${sessionScope.ground.groundNo}">목록</a>
<form id="delNoticeForm"action="groundNoticeDelete.do" method="post">
<sec:csrfInput/>
	<input type="hidden"  name="noticeNo" value="${noticeVO.noticeNo }">
	<input type="hidden" name="groundNo" value="${noticeVO.groundNo }">
</form>