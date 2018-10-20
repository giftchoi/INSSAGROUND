<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="myTable">
  <thead>
    <tr>
      <th colspan="4">REPORT LIST</th>
    </tr>
    <tr>
      <th>No</th>
      <th>REPORT TITLE</th>
      <th>REPORTER</th>
      <th>TIME</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${reportList.list}" var="report">
      <tr>
      <td>${report.reportNo}</td>
      <td><a href="reportDetail.do?reportNo=${report.reportNo}">${report.title}</a></td>
      <td>${report.id}</td>
      <td>${report.timePosted}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->