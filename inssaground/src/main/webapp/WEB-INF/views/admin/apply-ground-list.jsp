<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 offset-2">
<table class="table simpleTable">
  <thead>
    <tr>
      <th colspan="3">APPLY GROUND</th>
    </tr>
    <tr class="center">
      <th>No</th>
      <th>GROUND NAME</th>
      <th>MASTER</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${groundList.list}" var="ground">
      <tr>
      <td>${ground.groundNo}</td>
      <td><a href="applyGroundDetail.do?groundNo=${ground.groundNo}">${ground.groundName}</a></td>
      <td>${ground.master}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>
<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->