<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="col-sm-12">
	<div class="row main-content">
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

	<div class="pagingInfo">
				<c:set var="pb" value="${groundList.pagingBean}" />

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
								<li class="active"><a href="readyApplyGround.do?pageNo=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
	&nbsp;
	</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li><a class="page" href="">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			</div>
			</div>
			</div>
<!-- <i class="material-icons button edit">edit</i>
        <i class="material-icons button delete">delete</i> -->