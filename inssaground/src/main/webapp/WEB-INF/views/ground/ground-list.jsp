<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-12">
	<div class="row main-content">
		<div class="col-sm-12">
			<div>
				<h1>GROUND</h1>
			</div>
			<div class="search-filter-area">검색 필터 위치</div>
			<div class="search-list-area">

				<c:forEach items="${groundList }" var="ground">
					<div class="card game">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Ground</h1>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

</div>



