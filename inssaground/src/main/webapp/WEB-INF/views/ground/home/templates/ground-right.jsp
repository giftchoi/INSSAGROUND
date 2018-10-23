<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 sidebar-widgets">
	<div class="widget-wrap">
		<!-- 	<div class="single-sidebar-widget search-widget">
									<form class="search-form" action="#">
			                            <input placeholder="Search Posts" name="search" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'" >
			                            <button type="submit"><i class="fa fa-search"></i></button>
			                        </form>
								</div> -->

		<div class="single-sidebar-widget user-info-widget">
			<img
				src="${pageContext.request.contextPath}/resources/uploadImage/${mvo.profile}"
				alt="" width="300" height=""> <a href="#"><h4>${mvo.name}</h4></a>
			<p>출석:${insiderVO.attendance}</p>
			<p>아이디:${mvo.id}</p>
			
			<!-- <p>하고싶은 말</p> -->
			<!--	</div>
								<div class="single-sidebar-widget popular-post-widget">
									 <h4 class="popular-title">Popular Posts</h4>
									<div class="popular-post-list">
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp1.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>Space The Final Frontier</h6></a>
												<p>02 Hours ago</p>
											</div>
										</div>
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp2.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>The Amazing Hubble</h6></a>
												<p>02 Hours ago</p>
											</div>
										</div>
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp3.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>Astronomy Or Astrology</h6></a>
												<p>02 Hours ago</p>
											</div>
										</div>
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp4.jpg" alt="">
											</div>
											<div class="details">
												<a href="blog-single.html"><h6>Asteroids telescope</h6></a>
												<p>02 Hours ago</p>
											</div>
										</div>															
									</div> 
								</div>-->
			<div class="single-sidebar-widget ads-widget">
				<a href="#"><img class="img-fluid" src="img/blog/ads-banner.jpg"
					alt=""></a>
			</div>
			<div class="single-sidebar-widget post-category-widget">
				<h4 class="category-title">Post Catgories</h4>
				<ul class="cat-list">
					<li><a href="#" class="d-flex justify-content-between">
							<p>Technology</p>
							<p>37</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Lifestyle</p>
							<p>24</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Fashion</p>
							<p>59</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Art</p>
							<p>29</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Food</p>
							<p>15</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Architecture</p>
							<p>09</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Adventure</p>
							<p>44</p>
					</a></li>
				</ul>
			</div>
			<!-- <div class="single-sidebar-widget newsletter-widget">
									<h4 class="newsletter-title">Newsletter</h4>
									<p>
										Here, I focus on a range of items and features that we use in life without
										giving them a second thought.
									</p>
									<div class="form-group d-flex flex-row">
									   <div class="col-autos">
									      <div class="input-group">
									        <div class="input-group-prepend">
									          <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i>
											</div>
									        </div>
									        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email'" >
									      </div>
									    </div>
									    <a href="#" class="bbtns">Subcribe</a>
									</div>	
									<p class="text-bottom">
										You can unsubscribe at any time
									</p>								
								</div> -->
			<div class="single-sidebar-widget tag-cloud-widget">
				<h4 class="tagcloud-title">해시 태그</h4>
				<ul>
					<c:forEach items="${gvo.tagList}" var="list">
					<li><a style="font-size:15px;" href="#">#${list}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

</div>