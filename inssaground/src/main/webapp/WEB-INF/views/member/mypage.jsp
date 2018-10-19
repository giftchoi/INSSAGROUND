<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <table class="myTable">
  <thead>
    <tr>
      <th colspan="4">MY GROUND</th>
    </tr>
    <tr>
      <th>HOBBY</th>
      <th>GROUND NAME</th>
      <th>STATUS</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${myGround}" var="ground">
      <tr>
      <td>${ground.hobby}</td>
      <c:choose>
      <c:when test="${ground.STATUS==0}">
      <td>${ground.groundName}</td>
      <td>참여 대기중</td></c:when>
      <c:otherwise> <td><a href="applyGroundDetail.do?groundNo=${ground.groundNo}">${ground.groundName}</a></td>
      <td>참여 중</td></c:otherwise>
      </c:choose>
    </tr>
  </c:forEach>
  </tbody>
</table>
