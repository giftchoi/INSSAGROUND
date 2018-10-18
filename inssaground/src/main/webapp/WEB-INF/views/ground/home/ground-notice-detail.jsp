<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h4>공지 상세 보기</h4>
<table class="myTable">
	<tbody>
		<tr>
			<td style="text-align:left"><i class="fa fa-bell"></i></td><td colspan="2" style="text-align:right">${noticeVO.timePosted }&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><pre>${noticeVO.content }</pre></td>
		</tr>
	</tbody>
</table>
<a class="btn btn-red" href="groundNoticeList.do?groundNo=${sessionScope.ground.groundNo}">목록</a>