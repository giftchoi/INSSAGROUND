<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-10 offset-1">
		<div class="col-lg-12 posts-list">
			<div class="single-post row">
				<div class="col-lg-12">

					<div class="">
						<!-- <h3 class="mt-20 mb-20">일정 리스트</h3>	 -->

						<table class="table simpleTable">
							<thead>
								<tr>
									<th colspan="5">SCHEDULE LIST</th><th style="text-align:right;" colspan="2"><a class="btn btn-white" href="groundScheduleForm.do">일정 등록 하기</a></th>
								</tr>
								<tr class="center">
									<th colspan="2">#</th>
									<th colspan="2">제목</th>
									<th>아이디</th>
									<th>인원</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sList.list}" var="list">
									<tr>
										<td colspan="2">${list.scheduleNo}</td>
										<td colspan="2"><a href="groundScheduleDetail.do?scheduleNo=${list.scheduleNo}">${list.title}</a></td>
										<td>${list.insiderVO.memberVO.id}</td>	
										<td>${list.currPersonnel}/${list.maxPersonnel}</td>

										<%-- <td>
											<form action="groundScheduleDetail.do">
												<input type="submit" value="상세보기"> <input
													type="hidden" name="scheduleNo" value="${list.scheduleNo}">
											</form>
										</td> --%>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 페이징 -->
						<div class="pagingInfo">
							<c:set var="pb" value="${requestScope.sList.pagingBean}" />

							<ul class="pagination pagination-lg pagination-centered">
								<c:if test="${pb.previousPageGroup}">
									<li><a class="page"
										href="groundScheduleList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
									end="${pb.endPageOfPageGroup}">
									<c:choose>
										<c:when test="${pb.nowPage!=i}">
											<li><a class="page"
												href="groundScheduleList.do?pageNo=${i}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="active"><a href="#">${i}</a></li>
										</c:otherwise>
									</c:choose>
	&nbsp;
	</c:forEach>
								<c:if test="${pb.nextPageGroup}">
									<li><a class="page"
										href="groundScheduleList.do?pageNo=${pb.startPageOfPageGroup+1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>

	
					</div>
				</div>
				<div class="col-lg-3  col-md-3 meta-details"></div>
			</div>
			<div class="col-lg-9 col-md-9">

		</div>
	</div>

</div>

<!-- End post-content Area -->
