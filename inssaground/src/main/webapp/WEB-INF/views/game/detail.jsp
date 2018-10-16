<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Start post-content Area -->
<!-- <section class="post-content-area single-post-area"> -->
<div class="container">
	<div class="col-lg-12" style="font-size: 100">
		<div class="single-post row">


			<div class="col-lg-3  col-md-3 meta-details">

				<div class="user-details row" style="font-size: 2.2rem;">
					<p class="user-name col-lg-12 col-md-12 col-6">
						<a href="#">아이유</a> <span class="lnr lnr-user"></span>
					</p>
					<p class="date col-lg-12 col-md-12 col-6">
						<a href="#">12 Dec, 2017</a> <span class="lnr lnr-calendar-full"></span>
					</p>
				</div>
			</div>
			<div class="col-lg-9 col-md-9" style="font-size: 1.7rem;">
						<h1>${requestScope.gvo.title }</h1>
						<br>
						<pre>${requestScope.gvo.content}</pre>
			</div>

		</div>


	</div>
</div>


