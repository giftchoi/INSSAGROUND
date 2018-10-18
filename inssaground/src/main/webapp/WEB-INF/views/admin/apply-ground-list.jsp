<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  color: #333;
}
table {
  text-align: left;
  line-height: 40px;
  border-collapse: separate;
  border-spacing: 0;
  border: 2px solid #ed1c40;
  width: 500px;
  margin: 50px auto;
  border-radius: .25rem;
}
thead tr:first-child {
  background: #ed1c40;
  color: #fff;
  border: none;
}
th:first-child,
td:first-child {
  padding: 0 15px 0 20px;
}
th {
  font-weight: 500;
}
thead tr:last-child th {
  border-bottom: 3px solid #ddd;
}
tbody tr:hover {
  background-color: #f2f2f2;
  cursor: default;
}
tbody tr:last-child td {
  border: none;
}
tbody td {
  border-bottom: 1px solid #ddd;
}
td:last-child {
  text-align: right;
  padding-right: 10px;
}
.button {
  color: #aaa;
  cursor: pointer;
  vertical-align: middle;
  margin-top: -4px;
}
.edit:hover {
  color: #0a79df;
}
.delete:hover {
  color: #dc2a2a;
}
</style>
<table>
  <thead>
    <tr>
      <th colspan="3">APPLY GROUND</th>
    </tr>
    <tr>
      <th>No</th>
      <th>GROUND NAME</th>
      <th>MASTER</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${groundList.list}" var="ground">
      <tr>
      <td>${ground.groundNo}</td>
      <td>${ground.groundName}</td>
      <td>${ground.master}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->