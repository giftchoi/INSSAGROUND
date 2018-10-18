<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!-- Start post-content Area -->
<!-- <section class="post-content-area single-post-area"> -->
<div class="container">


	<c:choose>
		<c:when test="${requestScope.gameType eq 'custom'}">
			<!-- 사용자 정의 게임 : 갖고온거 -->
			<!-- 	c.c_game_no,c.title,c.max_Personnel,c.min_Personnel,c.game_Time,
			c.materials,c.content,c.recommendation,c.cg_no,m.id,m.name
	-->

			<div class="col-lg-12" style="font-size: 100">
				<div class="single-post row">
					<div class="col-lg-3  col-md-3 meta-details">
						<div class="user-details row" style="font-size: 2.2rem;">
							<p class="user-name col-lg-12 col-md-12 col-6">
								<a href="#">${requestScope.gvo.memberVO.id }</a> <span
									class="lnr lnr-user"></span>
							</p>
							<p class="date col-lg-12 col-md-12 col-6">
								<a href="#">${requestScope.gvo.memberVO.email }</a> <span
									class="lnr lnr-calendar-full"></span>
							</p>
						</div>
					</div>

					<div class="col-lg-9 col-md-9" style="font-size: 1.7rem;">
						<h1>${requestScope.gvo.title }</h1>
						<br>
						<p>인원 : ${requestScope.gvo.minPersonnel } ~
							${requestScope.gvo.maxPersonnel }</p>
						<br>
						<p>게임시간 : ${requestScope.gvo.gameTime }분</p>
						<br>
						<p>준비물 : ${requestScope.gvo.materials }</p>
						<br>
						<c:choose>
							<c:when test="${requestScope.gvo.cgNo eq 1 }">
								<p>분류: 실내 게임</p>
							</c:when>
							<c:otherwise>
								<p>분류: 실외 게임</p>
							</c:otherwise>
						</c:choose>
						<br>
						<p>추천수 : ${requestScope.gvo.recommendation }</p>
						<br>
						<pre>${requestScope.gvo.content}</pre>
					</div>
				</div>
				
				<div class="row" style="align: right">
				<form action="deleteCustomGame.do" id="deleteCustomGameForm" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="cGameNo" value="${requestScope.gvo.cGameNo}">
				</form>
				 <button class="btn btn-danger" form="deleteCustomGameForm" type="button">
						수정</button>
					&nbsp;
					<button class="btn btn-danger" form="deleteCustomGameForm"
						type="submit">삭제</button>

					<script type="text/javascript">
						$(document).ready(function() {
							$("#deleteCustomGameForm").submit(function() {
								return confirm("사용자 정의 게임을 삭제하시겠습니까?")
							});
						});
						
						</script>
						
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 공식게임 : 갖고온거 -->
			<!-- 	o_game_no, title, min_personnel, max_personnel,
			game_time, materials, content, cg_no -->
			<div class="col-lg-12" style="font-size: 100">
				<div class="single-post row">
					<div class="col-lg-3  col-md-3 meta-details">
						<div class="user-details row" style="font-size: 2.2rem;">
							<p class="user-name col-lg-12 col-md-12 col-6">
								<a href="#">관리자</a> <span class="lnr lnr-user"></span>
							</p>
							<p class="date col-lg-12 col-md-12 col-6">
								<a href="#">자리</a> <span class="lnr lnr-calendar-full"></span>
							</p>
						</div>
					</div>

					<div class="col-lg-9 col-md-9" style="font-size: 1.7rem;">
						<h1>${requestScope.gvo.title }</h1>
						<br>
						<p>인원 : ${requestScope.gvo.minPersonnel } ~
							${requestScope.gvo.maxPersonnel }</p>
						<br>
						<p>게임시간 : ${requestScope.gvo.gameTime }분</p>
						<br>
						<p>준비물 : ${requestScope.gvo.materials }</p>
						<br>
						<c:choose>
							<c:when test="${requestScope.gvo.cgNo eq 1}">
								<p>분류: 실내 게임</p>
							</c:when>
							<c:otherwise>
								<p>분류: 실외 게임</p>
							</c:otherwise>
						</c:choose>
						<br>
						<pre>${requestScope.gvo.content}</pre>
					</div>

				</div>
				            <div class="row" style="align: right">
            <form action="deleteOfficialGame.do" id="deleteOfficialGameForm" method="post">
            <sec:csrfInput/>
            <input type="hidden" name="oGameNo" value="${requestScope.gvo.oGameNo }">
            </form>
            
               <button class="btn btn-danger"
                  onclick="location.href='${pageContext.request.contextPath}/officialGameUpdateForm.do'">
                  수정</button>
               &nbsp;
               <button class="btn btn-danger" form="deleteOfficialGameForm" type="submit">
                  삭제</button>
                  
                  
                  <script type="text/javascript">
                  $(document).ready(function() {
                     $("#deleteOfficialGameForm").submit(function() {
                        return confirm("공식 게임을 삭제하시겠습니까?");
                     });
                  });
                  </script>
            </div>
			</div>
		</c:otherwise>
	</c:choose>

</div>



