<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-12">

	<table class="table simpleTable" style="table-layout:fixed;">
		<thead>
			<tr>
				<th style="font-size:25px;"colspan="4">자유 게시판</th><th style="text-align:right;"><a class="btn btn-white" href="groundPostRegisterForm.do">글쓰기</a></th>
			</tr>
			<tr class="center">
				<th colspan="2"style="width:100px">TITLE</th>
				<th>ID</th>
				<th >DATE</th>
				<th style="width:30px">HITS</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.listVO.list}" var="post">
				<tr>
					<td colspan="2"><a href="groundPostDetail.do?postNo=${post.postNo }">${post.title }</a></td>
					<td>${post.insiderVO.memberVO.id }</td>
					<td>${post.timePosted }</td>
					<td>${post.hits }</td>
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
