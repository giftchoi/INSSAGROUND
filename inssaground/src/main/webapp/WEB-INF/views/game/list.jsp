<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/game/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/game/main.css">
</head>
<script type="text/javascript">

</script>
<body>
<!-- Start menu-area Area -->
            <section class="menu-area section-gap" id="menu" style="background-color:white;">
                <div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-19">게임 메인 메뉴</h1>
							</div>
						</div>
					</div>	

                    <ul class="filter-wrap filters col-lg-12 no-padding">
                        <li data-filter=".smallscale" style="border: 5px solid white; border-radius:20px; background-color: red;">#소규모</li>
                        <li data-filter=".largescale" style="border: 5px solid white; border-radius:20px; background-color: red;">#대규모</li>
                        <li data-filter=".inside" style="border: 5px solid white; border-radius:20px; background-color: red;">#실내</li>
                        <li data-filter=".outside" style="border: 5px solid white; border-radius:20px; background-color: red;">#실외</li>
                     
                    </ul>
                    
                    <div class="filters-content">
                        <div class="row grid">
                            <div class="col-md-6 all smallscale">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>숨바꼭질</h4>
										<h4 class="price">60분</h4>
									</div>			
									<p>
										돌아가면서 술래를 하며 술래에게 잡힌경우 술래가 된다...
									</p>									
								</div>					                               
                            </div>                           
                            <div class="col-md-6 all inside">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>수건돌리기</h4>
										<h4 class="price">60분</h4>
									</div>			
									<p>
										돌아가면서 술래를 하며 수건을 돌리면서 걸린경우 술래가된다.
									</p>									
								</div>
                            </div>
                            <div class="col-md-6 all outside">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>병뚜껑 차기</h4>
										<h4 class="price">30분</h4>
									</div>			
									<p>
										번갈아 가면서 병뚜껑을 차서 일정거리 이상 가장 먼 거리를 찬 사람이 승리
									</p>									
								</div>
                            </div>
                            <div class="col-md-6 all smallscale">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>널뛰기</h4>
										<h4 class="price">30분</h4>
									</div>
									<p>
										양쪽에 사람이 위치하여 번갈아 가면서 뛰어 위아래로 움직인다.
									</p>									
								</div>
                            </div>
                            <div class="col-md-6 all largescale">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>제기차기</h4>
										<h4 class="price">10분</h4>
									</div>
									<p>
										제기를 양발로 번갈아가면서 차면서 연속해서 가장 많이 찬 사람이 이긴다.
									</p>									
								</div>
                            </div>
                            <div class="col-md-6 all buffet">
								<div class="single-menu" style="border:1px solid red;">
									<div class="title-wrap d-flex justify-content-between">
										<h4>절대음감</h4>
										<h4 class="price">10분</h4>
									</div>
									<p>
										글자를 정하여 음을 순서대로 높여 마지막 글자까지 발음하면 끝..
									</p>									
								</div>
                            </div>                            
                        </div>
                    </div>
    
                </div>
            </section>
            <!-- End menu-area Area -->			
</body>
</html>
