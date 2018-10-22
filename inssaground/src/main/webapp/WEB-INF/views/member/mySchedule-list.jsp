<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 offset-2">
	<table class="table simpleTable" style="table-layout:fixed;">
		<thead>
			<tr>
				<th style="font-size:25px;"colspan="4">MY GROUND</th>
			</tr>
			<tr class="center">
				<th>HOBBY</th>
				<th colspan="2">GROUND NAME</th>
				<th style="width:50px;">STATUS</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${myGround}" var="ground">
				<tr>
					<td>${ground.hobby}</td>
					<c:choose>
						<c:when test="${ground.STATUS==0}">
							<td>${ground.groundName}</td>
							<td>참여 대기중</td>
						</c:when>
						<c:when test="${ground.STATUS==3}">
							<td>${ground.groundName}</td>
							<td>탈퇴</td>
						</c:when>
						<c:otherwise>
							<td><a
								href="applyGroundDetail.do?groundNo=${ground.groundNo}">${ground.groundName}</a></td>
							<td>활동 중</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>