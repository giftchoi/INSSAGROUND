<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="myTable">
  <thead>
    <tr>
      <th colspan="5">REPORT LIST</th>
    </tr>
    <tr>
      <th>No</th>
      <th>REPORT TITLE</th>
      <th>REPORTER</th>
      <th>TIME</th>
      <th>STATUS</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${reportList.list}" var="report">
      <tr>
      <td>${report.reportNo}</td>
      <c:choose><c:when test="${report.status eq 1}">
      <td>${report.title}</td>
      <td>${report.id}</td>
      <td>${report.timePosted}</td>
      <td>처리완료</td>
      </c:when><c:otherwise>
      <td><a href="reportDetail.do?reportNo=${report.reportNo}">${report.title}</a></td>
      <td>${report.id}</td>
      <td>${report.timePosted}</td>
      <td>대기중</td>
      </c:otherwise></c:choose>
    </tr>
  </c:forEach>
  </tbody>
</table>
	<div class="pagingInfo">
				<c:set var="pb" value="${reportList.pagingBean}" />

				<ul class="pagination pagination-lg pagination-centered">
					<c:if test="${pb.previousPageGroup}">
						<li><a class="page" href="">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
								<li><a class="page">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="reportList.do?pageNo=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
	&nbsp;
	</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li><a class="page" href="">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->