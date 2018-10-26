<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 offset-2">
	<table class="table simpleTable" style="table-layout:fixed;">
		<thead>
			<tr>
				<th style="font-size:25px;"colspan="3">MY GAME PROGRAM</th>
			</tr>
			<tr class="center">
				<th>NO.</th>
				<th>TITLE</th>
				<th>DETAIL</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.gameProgramList}" var="myProgram" varStatus="info">
				<tr>
					<td>${info.count }</td>
					<td>${myProgram.title}</td>
					<td>${myProgram.detail}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<%-- 	
	<div class="pagingInfo">
				<c:set var="pb" value="${myProgramList.pagingBean}" />

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
								<li class="active"><a href="myProgram.do?pageNo=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
	&nbsp;
	</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li><a class="page" href="">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			
	 --%>		
</div>
<div class="col-sm-12">
<c:if test="${requestScope.gameProgramList != null}">
	<button class="btn btn-lg btn-outline-danger" style="font-size: 23px"
							 onclick="location.href='${pageContext.request.contextPath}/resultGameProgram.do' ">
							 <i class="fa fa-list-alt"></i> 내 프로그램 상세보기</button>
</c:if>
</div>