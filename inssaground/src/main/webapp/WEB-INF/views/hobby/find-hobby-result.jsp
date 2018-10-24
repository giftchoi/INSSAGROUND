<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-12">
	<h1
		style="text-align: center; font-weight: bolder; font-size: xx-large;">나의
		맞춤 취미</h1>
</div>
<c:forEach items="${fvo}" var="list">
	${list.HOBBY_NO} ${list.RANK} <br>
</c:forEach>
<hr>
<c:forEach items="${hobby}" var="hb">
	${hb.NAME}
</c:forEach>