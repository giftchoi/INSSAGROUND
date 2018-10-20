<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<form action="reportAnswer.do" method="post">
<sec:csrfInput/>		
<input type="hidden" name="subject" value="${report.title}">
<input type="hidden" name="receiver" value="${report.id}">
<table class="myTable">
  <thead>
    <tr>
      <th colspan="2">REPORT</th>
    </tr>
  </thead>
  <tbody>
      <tr><td>리포트 번호</td><td>${report.reportNo}</td></tr>
     <tr><td>신고 모임 번호</td><td>${report.groundNo}</td></tr>
     <tr><td>신고자</td><td>${report.id}</td></tr>
     <tr><td>작성 시간</td><td>${report.timePosted}</td></tr>
      <tr><td>제목</td><td>${report.title}</td></tr>
      <tr><td>내용</td><td><pre>${report.content}</pre></td></tr>
      <tr><td>답글</td><td><textarea name="content" rows="10" cols="70"></textarea></td></tr>
	 <tr><td colspan="2"><input class="btn btn-red" type="submit" value="답장"></td></tr>
  </tbody>
</table>
</form>

<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->