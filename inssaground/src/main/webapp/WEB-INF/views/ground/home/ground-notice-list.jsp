<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- for jstl function  -->
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="col-sm-10 offset-1">
	<table class="table simpleTable">
		<thead>
			<tr>
				<th style="font-size:25px;"colspan="4">공지 게시판</th>
			</tr>
			<tr class="center">
				<th>#</th>
				<th colspan="2">내용</th>
				<th>등록일시</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty requestScope.listVO.list}">
				<tr>
					<td colspan="4">등록된 공지가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${requestScope.listVO.list}" var="notice"
				varStatus="info">
				<tr>
					<td>${info.count }</td>
					<td colspan="2"><a
						href="groundNoticeDetail.do?noticeNo=${notice.noticeNo}">${fn:substring(notice.content,0,20)}<c:if
								test="${fn:length(notice.content)>20 }">...</c:if></a></td>
					<td>${notice.timePosted }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagingInfo">
		<c:set var="pb" value="${requestScope.listVO.pagingBean}" />

		<ul class="pagination pagination-lg pagination-centered">
			<c:if test="${pb.previousPageGroup}">
				<li><a class="page" href="">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a class="page">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
	&nbsp;
	</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a class="page" href="">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>