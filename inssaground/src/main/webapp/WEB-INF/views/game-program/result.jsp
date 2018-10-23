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
				<h1>MY INSSA GAME PROGRAM</h1>
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
						action="${pageContext.request.contextPath}/updateGameProgram.do"
						method="post" id="updateGameProgramForm">
						<table class="myTable simpleTable">
							<thead>
								<tr>
									<th>프로그램명 :</th>
									<th colspan="2"><select name="programNo"
										style="background-color: #ff1a1a; width: 100%;">
											<option value="1">꿀잼</option>
											<option value="2">허니잼</option>
											<option value="3">개꿀맛잼</option>
											<option value="4">죽을맛</option>
									</select></th>

								</tr>
								<tr>
									<th>설명</th>
									<th colspan="2">이렇게 하면 정말 재밌겠다!</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Atualizar página da equipe</td>
									<td><i class="material-icons button">cancel</i></td>
								</tr>
								<tr>
									<td>2</td>
									<td>Atualizar página da equipe</td>
									<td><i class="material-icons button">cancel</i></td>
								</tr>
								<tr>
									<td>3</td>
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
					<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
					
						<table class="table">
							<thead>
								<tr>
									<th colspan="2">프로그램 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="100px">게임 갯수</td>
									<td>00개</td>
								</tr>
								<tr>
									<td>인원</td>
									<td>1 ~ 1000명</td>
								</tr>
								<tr>
									<td>총 소요시간</td>
									<td>1000분</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-4"></div>
					</div>

					<div class="btnArea">
						<button form="updateGameProgramForm" class="btn btn-light btn-lg" 
							style="font-size: 24px;">
							수정 <i class="fa fa-pencil"></i>
						</button>

						<script type="text/javascript">
							$(document).ready(function() {
								$("#updateGameProgramForm").submit(function() {
									return confirm("게임 프로그램을 수정하시겠습니까?")
								});
							});
						</script>
					</div>
					
				</div>
			</div>

		</div>
	</div>
</div>