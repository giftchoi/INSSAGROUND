<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->


<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/linearicons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">

<!-- Start post-content Area -->
<div class="col-sm-12">
	<div class="row bgImgArea">
		<div class="col-sm-10 offset-1">
			<img class="img-fluid"
				src="${pageContext.request.contextPath}/resources/uploadImage/${gvo.groundImgVO.imgName}"
				height="250px" width="90%"alt="">
		</div>
	</div>
	<div class="row inssaInfoArea">
		<div class="col-sm-10 offset-1">
			<h3 class="mt-20 mb-20">${gvo.groundName }</h3>
			<p class="excert">${gvo.introduction}</p>
		</div>
	</div>
	<div class="row noticeArea">
		<div class="col-sm-10 offset-1">
			<table class="table simpleTable">
				<thead>
					<tr>
						<th colspan="1">NOTICE</th>
						<th style="text-align: right;"><input type="button"
							class="btn btn-white" value="목록"  onclick="location.href='groundNoticeList.do?groundNo=${sessionScope.ground.groundNo}'"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left"><i class="fa fa-bell"></i></td>
						<td colspan="2" style="text-align: right">${notice.timePosted }&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3"><pre>${notice.content }</pre></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row boardArea">
		<div class="col-sm-10 offset-1">
			<table class="table simpleTable" style="table-layout:fixed;">
				<thead>
					<tr>
						<th colspan="3" >BOARD</th>
						<th style="text-align: right;"><input type="button"
							class="btn btn-white" value="목록" onclick="location.href='groundPost.do?groundNo=${sessionScope.ground.groundNo}'"></th>
					</tr>
					<tr class="center">
						<th colspan="2" style="width:100px;">TITLE</th>
						<th>ID</th>
						<th>TIME</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${post}" var="post">
						<tr>
							<td colspan="2"><a href="#">${post.title}</a></td>
							<td>${post.insiderVO.memberVO.id}</td>
							<td class="right">${post.timePosted}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row imgArea">
		<div class="col-sm-10 offset-1">
										<table>
								<c:forEach items="${picture}" var="post">
								<c:forEach items="${post.pictureList }" var="pic">
									<td><img src="${pageContext.request.contextPath}/resources/uploadImage/${pic}"></td>
								</c:forEach>
								
								</c:forEach>
							</table>
		</div>
	</div>

	<%-- <div class="row" align="center">
							<div class="single-post row">
								<div class="col-lg-12">
									<div class="feature-img">
										<img class="img-fluid" src="${pageContext.request.contextPath}/resources/uploadImage/${gvo.groundImgVO.imgName}" alt="">
									</div>									
								</div>

								<div class="col-lg-12 col-md-12" >
									<h3 class="mt-20 mb-20" >${gvo.groundName }</h3>
									<p class="excert">
										${gvo.introduction}
									</p>
									<div class="row mt-30 mb-30" style = " font-size:1.3em">
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
										</div>
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
										</div>	
										<div class="col-lg-12 mt-30">
											
											<table class="table simpleTable">
											  <thead>
											    <tr>
											      <th colspan="1">NOTICE</th><th style="text-align:right;"><input type="button" class="btn btn-white" value="목록"></th>
											    </tr>
											  </thead>
											  <tbody>
										<tr>
			<td style="text-align:left"><i class="fa fa-bell"></i></td><td colspan="2" style="text-align:right">${notice.timePosted }&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><pre>${notice.content }</pre></td>
		</tr>
											  </tbody>
											</table>										
	
											<table class="table simpleTable">
											  <thead>
											    <tr>
											      <th colspan="3">BOARD</th><th style="text-align:right;"><input type="button" class="btn btn-white" value="목록"></th>
											    </tr>
											    <tr>
											      <th>No</th>
											      <th>TITLE</th>
											      <th>ID</th>
											      <th>TIME</th>
											    </tr>
											  </thead>
											  <tbody>
											  <c:forEach items="${post}" var="post">
											      <tr>
											      <td>${post.postNo}</td>
											      <td><a href="#">${post.title}</a></td>
											      <td>${post.insiderVO.memberVO.id}</td>
											      <td class="right">${post.timePosted}</td>
											    </tr>
											  </c:forEach>
											  </tbody>
											</table>
											
											<!-- <p>
												MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower.
											</p>
											<p>
												MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower.
											</p>		 -->									
										</div>									
									</div>
								</div>
							</div>
							<!-- <div class="comments-area">
								<h4>05 Comments</h4>
								<div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/blog/c1.jpg" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Emilly Blunt</a></h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                <p class="comment">
                                                    Never say goodbye till the end comes!
                                                </p>
                                            </div>
                                        </div>
                                        <div class="reply-btn">
                                               <a href="" class="btn-reply text-uppercase">reply</a> 
                                        </div>
                                    </div>
                                </div>	
								<div class="comment-list left-padding">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/blog/c2.jpg" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Elsie Cunningham</a></h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                <p class="comment">
                                                    Never say goodbye till the end comes!
                                                </p>
                                            </div>
                                        </div>
                                        <div class="reply-btn">
                                               <a href="" class="btn-reply text-uppercase">reply</a> 
                                        </div>
                                    </div>
                                </div>	
								<div class="comment-list left-padding">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/blog/c3.jpg" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Annie Stephens</a></h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                <p class="comment">
                                                    Never say goodbye till the end comes!
                                                </p>
                                            </div>
                                        </div>
                                        <div class="reply-btn">
                                               <a href="" class="btn-reply text-uppercase">reply</a> 
                                        </div>
                                    </div>
                                </div>	
								<div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/blog/c4.jpg" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Maria Luna</a></h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                <p class="comment">
                                                    Never say goodbye till the end comes!
                                                </p>
                                            </div>
                                        </div>
                                        <div class="reply-btn">
                                               <a href="" class="btn-reply text-uppercase">reply</a> 
                                        </div>
                                    </div>
                                </div>	
								<div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/blog/c5.jpg" alt="">
                                            </div>
                                            <div class="desc">
                                                <h5><a href="#">Ina Hayes</a></h5>
                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                <p class="comment">
                                                    Never say goodbye till the end comes!
                                                </p>
                                            </div>
                                        </div>
                                        <div class="reply-btn">
                                               <a href="" class="btn-reply text-uppercase">reply</a> 
                                        </div>
                                    </div>
                                </div>	                                             				
							</div> -->
							
							<table>
								<c:forEach items="${picture}" var="post">
								<c:forEach items="${post.pictureList }" var="pic">
									<td><img src="${pageContext.request.contextPath}/resources/uploadImage/${pic}"></td>
								</c:forEach>
								
								</c:forEach>
							</table>
							
								<table class="myTable">
								  <thead>
								    <tr>
								      <th colspan="4">사진 모음</th>
								    </tr>
								    <tr>
								      <th>No</th>
								      <th>PICTURE</th>
								      <th>ID</th>
								      <th>TIME</th>
								    </tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${picture}" var="list">
								      <tr>
								      <td>${list.postNo}</td>
								      <td><img src="${pageContext.request.contextPath}/resources/uploadImage/${list.pictureList}"></td>
								      <td>${list.insiderVO.memberVO.id}</td>
								      <td>${list.timePosted}</td>
								    </tr>
								  </c:forEach>
								  </tbody>
								</table>

							
							
							
							
							

				</div>	
			<!-- End post-content Area --> --%>
</div>