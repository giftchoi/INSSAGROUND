<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
}

.carouselRow {
	margin: 20px;
	height: 400px;
}

.card {
	display: inline-block;
	width: 400px;
	height: 150px;
}

.groundRow {
	margin-top: 50px;
	text-align: center;
	height: 400px;
}

.content {
	margin-top: 100px;
	text-align: center;
}

.gameRow {
	margin-top: 50px;
	height: 400px;
	text-align: center;
}

.circle {
	margin: 10px;
	width: 180px;
	height: 180px;
	border-radius: 50%;
}
</style>
<title>INSSAGROUND HOME</title>
</head>
<body>
	<div class="row carouselRow">
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
							alt="Los Angeles" width="1100" height="400">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg2.jpg"
							alt="Chicago" width="1100" height="400">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath }/resources/image/testImg3.jpg"
							alt="New York" width="1100" height="400">
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
	<div class="row groundRow">
		<div class="col-sm-10 offset-1">
			<h3>인기 GROUND</h3>
			<div class="row content">
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
	<div class="row gameRow">
		<div class="col-sm-10 offset-1">
			<h3>이달의 사용자 게임</h3>
			<div class="row content">
				<div class="col-sm-12">
					<div class="card">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<div class="card">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<br>
					<div class="card">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
					<div class="card">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>Custom Game</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>