<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<div class="card game" onclick="location.href='${pageContext.request.contextPath}/customGameDetail.do'">
						<!-- <div class="card-header">Header</div> -->
						<div class="card-body">
							<h1>바꿈</h1>
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