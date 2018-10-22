<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/game/main.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="col-sm-12">
	<div class="row main-content">
		<div class="col-sm-12">
			<div>
				<h1>MAKE INSSA GAME PROGRAM</h1>
			</div>
			<br> <br>
			<div class="row">

				<div class="col-sm-4">
					<div class="card text-center">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item"><a class="nav-link active" href="#"
									style="margin-bottom: 0px;">공식</a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									style="margin-bottom: 0px;">사용자</a></li>
							</ul>
						</div>
						<div class="card-body" style="overflow:scroll; height:670px;">
							<div class="game-post-area">
								<c:forEach items="${requestScope.officialGameLvo.list }"
									var="ogvo">

									<div class="card game programcard"
										onclick="location.href='${pageContext.request.contextPath}/officialGameDetail.do?oGameNo=${ogvo.oGameNo}'">
										<div class="card-header">
											<h3>${ogvo.title }</h3>
										</div>
										<div class="card-body">
											<h5 style="font-family: serif; text-align: center;">준비물:
												${ogvo.materials }</h5>
										</div>
										<div class="rowgamefooter">
											<div class="col-sm-6" align="left">
												<h5 style="font-family: serif; text-align: left;">${ogvo.gameTime}
													분</h5>
											</div>
											<div class="col-sm-6" align="right">
												<h5 align="right" style="color: red;">
													${ogvo.minPersonnel} ~ ${ogvo.maxPersonnel} 명</h5>
											</div>
										</div>
									</div>

								</c:forEach>
								<div class="pagingInfo">
									<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
									<c:set var="pb"
										value="${requestScope.officialGameLvo.pagingBean}"></c:set>
									<ul class="pagination">
										<c:if test="${pb.previousPageGroup}">
											<li><a
												href="${pageContext.request.contextPath}/officialGameList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
										</c:if>
										<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${pb.nowPage!=i}">
													<li><a
														href="${pageContext.request.contextPath}/officialGameList.do?pageNo=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="active"><a href="#">${i}</a></li>
												</c:otherwise>
											</c:choose>
						&nbsp;
						</c:forEach>

										<c:if test="${pb.nextPageGroup}">
											<li><a
												href="${pageContext.request.contextPath}/officialGameList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
										</c:if>
									</ul>
								</div>

							</div>
						</div>
					</div>



				</div>
				<div class="col-sm-8">
					<form
						action="${pageContext.request.contextPath}/registerGameProgram.do"
						method="post" id="registerGameProgramForm">
						<table class="myTable">
							<thead>
								<tr>
									<th>프로그램명 :</th>
									<th colspan="2"><input type="text" name="programNo"
										style="background-color: #ff1a1a; width: 100%;"
										required="required"></th>

								</tr>
								<tr>
									<th>설명</th>
									<th colspan="2"><input type="text" name="title"
										style="width: 100%;" required="required"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Atualizar página da equipe</td>
									<td><i class="material-icons button">cancel</i></td>
								</tr>
								<tr>
									<td>1</td>
									<td>Atualizar página da equipe</td>
									<td><i class="material-icons button">cancel</i></td>
								</tr>
								<tr>
									<td>1</td>
									<td>Atualizar página da equipe</td>
									<td><i class="material-icons button">cancel</i></td>
								</tr>
								<tr></tr>
								<tr>
								<td colspan="3">
						<i class="material-icons button delete">
						<input type="reset" value="delete"  style="background-color:transparent;  border:0px transparent solid;">
						</i>
								</td>
								</tr>
							</tbody>
							
						</table>
						
						
					</form>


					<div class="btnArea">
						<!-- <button form="registerGameProgramForm"
							style="font-size: 24px; background-color: transparent; border: 0px transparent solid;">
							<i class="fa fa-pencil"></i>
						</button> -->
						<button form="registerGameProgramForm" class="btn btn-danger btn-lg" style="font-size: 26px;">
          				<span class="glyphicon glyphicon-check"></span> 등록
        				</button>
        				
        				<br><br><br>
						<button onclick="resultGameProgram()">내 게임프로그램 확인폼</button>

						<script type="text/javascript">
							$(document).ready(function() {
								$("#registerGameProgramForm").submit(function() {
									return confirm("게임 프로그램을 등록하시겠습니까?")
								});
							});
							function resultGameProgram(){
								location.href="${pageContext.request.contextPath}/resultGameProgramTest.do"
							}
						</script>
						
					</div>
				</div>
			</div>

		</div>
	</div>
</div>