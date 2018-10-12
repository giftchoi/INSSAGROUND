<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-10 offset-1">
	<div class="row main-content">
		<div class="col-sm-12">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg.jpg"
							alt="Los Angeles" width="1000" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg2.jpg"
							alt="Chicago" width="1000" height="500">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg3.jpg"
							alt="New York" width="1000" height="500">
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>

		</div>
	</div>
	<div class="row main-content">
		<div class="col-sm-12">
			<div class="row content-title">
				<div class="col-sm-12">
				<h1> 추천 GROUND</h1>
				</div>
			</div>
		<div class="row ground-content">
				<div class="col-sm-12">
				<button class="button circle">전체보기</button>
					<button class="button circle">전체보기</button>
					<button class="button circle">전체보기</button>
					<button class="button circle">전체보기</button>
					<button class="button circle">전체보기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row main-content">
				<div class="col-sm-12">
			<div class="row content-title">
				<div class="col-sm-12">
				<h1> 이달의 인기 사용자 게임</h1>
				</div>
			</div>

			<div class="row content">
				<div class="col-sm-12">
					<div class="card game">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<div class="card game">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<br>
					<div class="card game">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<div class="card game">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

