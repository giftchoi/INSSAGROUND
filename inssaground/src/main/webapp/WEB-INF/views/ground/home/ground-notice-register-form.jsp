<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<p class="title"><h3 class="mt-20 mb-20">모임 공지 등록</h3></p>
<form method="post" action="groundNoticeRegister.do">
	<table class="myTable">
		<sec:csrfInput/>	<!--post방식을 위한 security token -->
		<tbody>
			<tr>
			<td colspan="3"><textarea name="content" rows="10"cols="70"></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><button class="btn btn-red">공지 등록</button></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="groundNo" value="${sessionScope.ground.groundNo}">
</form>
