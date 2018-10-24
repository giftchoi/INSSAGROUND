<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-12">
	<h1
		style="text-align: center; font-weight: bolder; font-size: xx-large;">나의
		맞춤 취미</h1>
</div>
<br><br><br><br><br><br><br>
<%-- <c:forEach items="${fvo}" var="list">
	${list.HOBBY_NO} ${list.RANK} <br>
</c:forEach> --%>


<%-- <div class="col-sm-12">
<br><br><br><br><br><br>
<c:forEach items="${hobby}" var="hb">
<div class="border" 
	style="border-radius: 50%; border:3px solid #ff1a1a!important; background-color:white; font-size: xx-large; text-align: center; border-width: 20rem; font-weight: bolder;" >
	${hb.NAME}
</div>
</c:forEach>
</div> --%>
<div class="col-sm-12">
<div class="row ground-content">
				<div class="col-sm-12">
				<c:choose>
					<c:when test="${hobby!=null}">
					<c:forEach items="${hobby}" var="hb">
					<button class="button circle" style="background-color: white; border-color:crimson; border-width: thick; font-size: x-large;">${hb.NAME}</button>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<h1 style="font-weight: bolder; color: red;">취미를 찾을수 없습니다.</h1>
					</c:otherwise>
					</c:choose>
				
				</div>
			</div>
</div>