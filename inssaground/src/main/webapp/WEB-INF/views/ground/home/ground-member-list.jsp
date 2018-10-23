<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-10 offset-1">
    <table class="table simpleTable">
  <thead>
    <tr>
      <th style="font-size:25px;"colspan="4">INSSA MEMBER</th>
    </tr>
    <tr class="center">
      <th>No</th>
      <th>NAME</th>
      <th>ID</th>
 	  <th>EMAIL</th>
    </tr>
  </thead>
  <tbody>
	 <c:forEach items="${memberList}" var="list" varStatus="info">
      <tr>
      		<td>${info.count }</td>
      		<td><a href="memberInfo.do?id=${list.memberVO.id}">${list.memberVO.name }</a></td>
      		<td>${list.memberVO.id }</td>
 			<td>${list.memberVO.email }</td>
    	</tr>
	 </c:forEach>
  </tbody>
</table>
</div>
