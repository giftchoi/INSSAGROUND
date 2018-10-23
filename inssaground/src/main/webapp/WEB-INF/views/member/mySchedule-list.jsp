<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 offset-2">
	<table class="table simpleTable" style="table-layout:fixed;">
		<thead>
			<tr>
				<th style="font-size:25px;"colspan="4">MY SCHEDULE</th>
			</tr>
			<tr class="center">
				<th></th>
				<th>GROUND</th>
				<th colspan="2">TITLE</th>
				<th>TIME</th>
				<th>LOCATION</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myScheduleList.list}" var="mySch">
				<tr>
					<td>${mySch.groundVO.groundName}</td>
					<td><a href="groundScheduleDetail.do?scheduleNo=${mySch.scheduleNo}">${mySch.title}</a></td>
							<td>${mySch.startDate} ~ ${mySch.endDate}</td>
							<td>${mySch.loc}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>