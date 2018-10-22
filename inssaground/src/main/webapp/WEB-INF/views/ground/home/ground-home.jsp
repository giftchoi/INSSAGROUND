<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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


		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">				
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">							
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">				
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

<!-- Start post-content Area -->
<div class="col-sm-12">
			<section class="post-content-area single-post-area" >
				<div class="container" >
					<div class="row" align="center">
						<div class="">
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
									<!-- <p>
										Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training. who has the willpower to actually sit through a self-imposed
									</p>
									<p>
										Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training. who has the willpower to actually sit through a self-imposed
									</p> -->
								</div>
								<div class="col-lg-12">
									<!-- <div class="quotes">
										MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot camp when you can get the MCSE study materials yourself at a fraction of the camp price. However, who has the willpower to actually sit through a self-imposed MCSE training.										
									</div> -->
									<div class="row mt-30 mb-30" style = " font-size:1.5em">
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img1.jpg" alt="">
										</div>
										<div class="col-6">
											<img class="img-fluid" src="img/blog/post-img2.jpg" alt="">
										</div>	
										<div class="col-lg-12 mt-30">
											<%-- <table class="myTable">
												<thead>
													<tr>
														<td align="center" colspan="2">NOTICE</td>
													</tr>
													<tr>
														<td>
															No
														</td>
														<td>
															CONTENT
														</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															${notice.noticeNo}        
														</td>
														<td>
															${notice.content} 
														</td>
													</tr>
												</tbody>
											</table> --%>
											
											<table class="myTable">
											  <thead>
											    <tr>
											      <th colspan="2">NOTICE</th>
											    </tr>
											    <tr>
											      <th>No</th>
											      <th>CONTENT</th>										      
											    </tr>
											  </thead>
											  <tbody>
											 
											      <tr>
											      <td>${notice.noticeNo}</td>
											      <td><a href="#">${notice.content}</a></td>
											     
											    </tr>
											 
											  </tbody>
											</table>										
											
											
											<table class="myTable">
											  <thead>
											    <tr>
											      <th colspan="4">Board</th>
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
											      <td>${post.timePosted}</td>
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
							<div class="navigation-area">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="img/blog/prev.jpg" alt=""></a>
										</div>
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-left"></span></a>
										</div>
									<!-- 	<div class="detials">
											<p>Prev Post</p>
											<a href="#"><h4>Space The Final Frontier</h4></a>
										</div> -->
									</div>
									<div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
										<!-- <div class="detials">
											<p>Next Post</p>
											<a href="#"><h4>Telescopes 101</h4></a>
										</div> -->
										<div class="arrow">
											<a href="#"><span class="lnr text-white lnr-arrow-right"></span></a>
										</div>
										<div class="thumb">
											<a href="#"><img class="img-fluid" src="img/blog/next.jpg" alt=""></a>
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
							<div class="comment-form">
								<h4>신고</h4>
								<form>
									<div class="form-group form-inline">
									  <div class="form-group col-lg-6 col-md-12 name">
									    <input type="text" class="form-control" id="name" placeholder="Enter Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Name'">
									  </div>
									  <div class="form-group col-lg-6 col-md-12 email">
									    <input type="email" class="form-control" id="email" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'">
									  </div>										
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="subject" placeholder="Subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Subject'">
									</div>
									<div class="form-group">
										<textarea class="form-control mb-10" rows="5" name="message" placeholder="Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'" required=""></textarea>
									</div>
									<a href="#" class="primary-btn text-uppercase">Post Comment</a>	
								</form>
							</div>
						</div>

				</div>	
			</section>
			<!-- End post-content Area -->
</div>