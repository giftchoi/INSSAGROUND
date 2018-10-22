<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="myTable">
  <thead>
    <tr>
      <th colspan="4">INSSA MEMBER</th>
    </tr>
    <tr>
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
      		<td>${list.memberVO.name }</td>
      		<td>${list.memberVO.id }</td>
 			<td>${list.memberVO.email }</td>
    	</tr>
	 </c:forEach>
  </tbody>
</table>