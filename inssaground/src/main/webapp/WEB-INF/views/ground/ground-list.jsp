<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(
			function() {
				$(".card.ground").click(
						function() {
							$('div.modal').modal();
							$('.modal-content').load(
									"groundDetail.do?groundNo="
											+ $(this)
													.find("input[type=hidden]")
													.val());
						});//click

			});
</script>

<div class="col-sm-12">
	<div class="row main-content">
		<div class="col-sm-8 offset-2">
			<div>
				<h1>GROUND</h1>
			</div>
			<div class="search-filter-area">
				<hr>
				지역 <select name="sido">
					<option value="">전체</option>
					<c:forEach items="${requestScope.sidoList }" var="sido">
					<option value="${sido.sidoNo }">${sido.sidoName }</option>
					</c:forEach>
				</select> 
				<select name="sigungu" disabled="disabled">
					<option value="">----</option>
				</select> 취미 <select name="category">
					<option value="">전체</option>
				</select> <select name="hobby">
					<option value="">----</option>
				</select> 모임명 <input type="text" name="keyword"> <input class="btn btn-red"
					type="button" value="검색">
				<hr>
			</div>
			<div class="search-list-area">
					<table cellpadding="10">
						<tr>
				<c:forEach items="${listVO.list }" var="ground" varStatus="info">

					
							<td>
								<div class="card ground">
									<input type="hidden" name="groundNo"
										value="${ground.groundNo }">
									<div class="card-ground-title">${ground.groundName }</div>
									<div class="row card-ground-body">
										<div class="col-sm-6 master-profile">
											<img
												src="${pageContext.request.contextPath }/resources/image/testImg.jpg"
												width="100%" height="100%">
										</div>
										<div class="col-sm-6 ground-info">
											<i class="fa fa-map-marker fa-4x"></i>
											<span class="info-span">
											${ground.area }</span><br> 
											<i class="fa fa-users fa-3x"></i>
											<span class="info-span">${ground.maxPersonnel }</span> <br> 
											<i class="fa fa-puzzle-piece fa-4x"></i>
											<span class="info-span">${ground.hobby }</span><br>
										</div>
									</div>
								</div>
							</td>
					<c:if test="${info.count%3==0 }">
											</tr><tr>
					</c:if>
				

				</c:forEach>
				</tr>
			</table>
			</div>
			<hr>
			<div class="pagingInfo">
				<c:set var="pb" value="${requestScope.listVO.pagingBean}" />

				<ul class="pagination pagination-sm">
					<c:if test="${pb.previousPageGroup}">
						<li><a href="">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
								<li><a href="">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#">${i}</a></li>
							</c:otherwise>
						</c:choose>
	&nbsp;
	</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li><a href="">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="myModal">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content"></div>
	</div>
</div>



