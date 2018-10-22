<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="myTable">
  <thead>
    <tr>
      <th colspan="4">사진 모음</th>
    </tr>
    <tr>
      <th>No</th>
      <th>picture</th>
      <th>id</th>
      <th>TIME</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${postList}" var="list">
      <tr>
      <td>${list.postNo}</td>
      <td><a href=>${list.pictureList}</a></td>
      <td>${list.insiderVO.memberVO.id}</td>
      <td>${list.timePosted}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
