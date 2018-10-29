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
				
				<tr data-toggle="collapse" data-target="#accordion${info.count }" class="clickable">
					<td>${info.count }</td>
					<td>${myProgram.title}</td>
					<td>${myProgram.detail}</td>
				</tr>
				
				<tr>
					<td colspan="3" style="border-top-width: 0px;">
						 <div id="accordion${info.count }" class="collapse">
						 <%-- 
						 <table class="table simpleTable" >
						 	<thead>
						 	</thead>
						 	<tbody>
				<tr data-toggle="collapse" data-target="#accordion_game${info.count }" class="clickable">
					<td>${info.count }</td>
					<td>${myProgram.title}</td>
					<td>${myProgram.detail}</td>
				</tr>
						 	</tbody>
						 </table>
						  --%>
						 </div>
					</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>

</div>
<div class="col-sm-12">
<c:if test="${requestScope.gameProgramList != null}">
	<button class="btn btn-lg btn-outline-danger" style="font-size: 23px"
							 onclick="location.href='${pageContext.request.contextPath}/gameProgramDetail.do?programNo=0' ">
							 <i class="fa fa-list-alt"></i> 내 프로그램 상세보기</button>
</c:if>
</div>

