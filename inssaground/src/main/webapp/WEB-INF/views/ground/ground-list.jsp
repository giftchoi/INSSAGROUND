<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
						});
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
			</select>
			<select name="sigungu">
				<option value="">----</option>
			</select>
			 취미 <select name="category" >
				<option value="">전체</option>
			</select>
			<select name="hobby" >
				<option value="">----</option>
			</select>
			모임명 <input type="text" name="keyword" >
			<input class="btn"type="button"value="검색">
			<hr>
			</div>
			<div class="search-list-area">
		
				<c:forEach items="${groundList }" var="ground" varStatus="info">
					<c:if test="${info.count%3==0 }">
						<br>
					</c:if>
					<div class="card ground">
						<input type="hidden" name="groundNo" value="${ground.groundNo }">
						<div class="card-ground-title">${ground.groundName }</div>
						<div class="row card-ground-body">
							<div class="col-sm-6 master-profile">
								<img
									src="${pageContext.request.contextPath }/resources/image/testImg.jpg"
									width="100%" height="100%">
							</div>
							<div class="col-sm-6 ground-info">
								<span class="info-span"><i class="fas fa-map-marker-alt"></i>${ground.area }</span><br>
								 <span class="info-span">${ground.maxPersonnel }</span> <br>
								 <span class="info-span">${ground.hobby }</span><br>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

</div>
<div class="modal" id="myModal">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content"></div>
	</div>
</div>



