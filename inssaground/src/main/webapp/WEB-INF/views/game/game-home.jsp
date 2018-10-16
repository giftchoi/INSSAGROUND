<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/game/main.css">
<div class="col-sm-12">
<div class="row main-content">
	<div class="col-sm-12">
		<div>
			<h1>INSSA GAME</h1>
		</div>
		<div class="category-menu-area">
			<ul class="game-category-list">	
 						<li data-filter=".smallscale" ><h3>#소규모</h3></li>
                        <li data-filter=".largescale" ><h3>#대규모</h3></li>
                        <li data-filter=".inside" ><h3>#실내</h3></li>
                        <li data-filter=".outside" ><h3>#실외</h3></li>                    
			</ul>
		</div>
		<div class="game-post-area">
		<c:forEach items="${requestScope.officialGameLvo.list }" var="ogvo">
					<div class="card game" onclick="location.href='${pageContext.request.contextPath}/officialGameDetail.do?oGameNo=${ogvo.oGameNo}'">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>${ogvo.title }</h1>
						</div>		
					</div>
		</c:forEach>
				<div class="pagingInfo">
					<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
					<c:set var="pb" value="${requestScope.officialGameLvo.pagingBean}"></c:set>
					<!-- 
			step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->
					<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->
					<ul class="pagination">
						<c:if test="${pb.previousPageGroup}">
							<li><a
								href="${pageContext.request.contextPath}/gameList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
							end="${pb.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${pb.nowPage!=i}">
									<li><a
										href="${pageContext.request.contextPath}/gameList.do?pageNo=${i}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i}</a></li>
								</c:otherwise>
							</c:choose>
						&nbsp;
						</c:forEach>
						<c:if test="${pb.nextPageGroup}">
							<li><a
								href="${pageContext.request.contextPath}/gameList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 
			step3 1) 다음 페이지 그룹이 있으면 화살표 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 		--> 
	 		
			<!-- 
					<div class="card game">
						<div class="card-header">Header</div>
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<br>
					<div class="card game">
						<div class="card-header">Header</div>
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<div class="card game">
						<div class="card-header">Header</div>
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
			 -->
		</div>
	</div>
</div>
</div>