<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Start post-content Area -->
			<section>
				<div class="col-sm-12">
					<div class="row">
						<div class="col-lg-8 posts-list">
							<div class="single-post row">
								<div class="col-lg-12">
								
									<div class="">
										<h3 class="mt-20 mb-20">일정 리스트</h3>	
						<table>
										<c:forEach items="${sList.list}" var="list">
							<td>
								<div class="card ground">
									
									<div class="card-ground-title"></div>
									
									<div class="row card-ground-body">
										<div class="col-sm-6 master-profile"align="center">
											
												<div align="center">
												&nbsp;제목:${list.title} <br>
												&nbsp;아이디: ${list.insiderVO.memberVO.id }<br>
												&nbsp;위치: ${list.loc }<br>
												&nbsp;최대인원: ${list.maxPersonnel}<br>
												<!-- <i class="fa fa-flag"></i><span class="info-span"> </span> -->
												</div>
										</div>
										<div class="col-sm-6 ground-info">
										<form action="scheduleParticipation.do">
											<input type="submit" value="참여"><br>
											<input type="hidden" name="scheduleNo" value="${list.scheduleNo}">
										</form>
										<form >
											<input type="submit" value="불참">
											<input type="hidden" name="scheduleNo" value="${list.scheduleNo}">
										</form>
										<form action="groundScheduleDetail.do">
											<input type="submit" value="상세보기" >
											<input type="hidden" name="scheduleNo" value="${list.scheduleNo}">
										</form>
										</div>
									</div>
									
								</div>
							</td>
							<c:if test="${info.count%3==0 }">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
				<a href="groundScheduleForm.do">모임 등록 하기</a>
				<!-- 페이징 -->
							<div class="pagingInfo">
				<c:set var="pb" value="${requestScope.sList.pagingBean}" />

				<ul class="pagination pagination-lg pagination-centered">
					<c:if test="${pb.previousPageGroup}">
						<li><a class="page" href="groundScheduleList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
								<li><a class="page" href="groundScheduleList.do?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#">${i}</a></li>
							</c:otherwise>
						</c:choose>
	&nbsp;
	</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<li><a class="page" href="groundScheduleList.do?pageNo=${pb.startPageOfPageGroup+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
				
				
				
				<!--  -->
									</div>								
								</div>
								<div class="col-lg-3  col-md-3 meta-details">
																							
									</div>
								</div>
								<div class="col-lg-9 col-md-9">
									
									<!--  -->
									
			
									
								
								
									<!-- 게시판 여기다  -->							
								</div>
								<div class="col-lg-12">
									<!-- <div class="quotes">
										MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training.										
									</div> -->
									<div class="row mt-30 mb-30">
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
											
										</div>
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
										</div>	
										<div class="col-lg-12 mt-30">
																				
										</div>									
									</div>
								</div>
							</div>
							<div>
							<!-- 	<div class="row">
									<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="img/blog/prev.jpg" alt=""></a>
										</div>
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-left"></span></a>
										</div>
										<div class="detials">
											<p>Prev Post</p>
											<a href="#"><h4>Space The Final Frontier</h4></a>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
										<div class="detials">
											<p>Next Post</p>
											<a href="#"><h4>Telescopes 101</h4></a>
										</div>
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-right"></span></a>
										</div>
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="img/blog/next.jpg" alt=""></a>
										</div>										
									</div>									
								</div> -->
							</div>							
						</div>
											
				</div>	
			</section>
			<!-- End post-content Area -->
