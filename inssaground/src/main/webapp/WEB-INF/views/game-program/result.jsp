<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/game/main.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="col-sm-12">
	<div class="row main-content">
		<div class="col-sm-12">
			<div>
				<h1>EDIT INSSA GAME PROGRAM</h1>
			</div>
			<br> <br>
			<div class="row">

				<div class="col-sm-4">
					<div class="card text-center">

						<div class="card-body"
							style="overflow: scroll; overflow-x: hidden; height: 650px;">
							<div class="game-post-area">
								<!--카드 목록나올구문 ---------------------------------------------------------------------------------------------- -->
								<c:forEach items="${requestScope.officialGameLvo.list }"
									var="ogvo" varStatus="no">
									<div id="programcard${no.count }" class="card game programcard">

										<div class="card-header">
											<h4 id="gametitle${no.count }">${ogvo.title }</h4>
										</div>

										<div class="card-body">
											<h5 id="oGameNo${no.count }"
												style="font-family: serif; text-align: center;">${ogvo.oGameNo }</h5>
											<i class="material-icons"> <a
												href="${pageContext.request.contextPath}/officialGameDetail.do?oGameNo=${ogvo.oGameNo}"
												style="font-size: 20px; color: red" target="_blank">open_in_new</a>
											</i>
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
											<li><button class="pageBtn">${pb.startPageOfPageGroup-1}</button></li>
											<li>&laquo;</li>
											<!-- <li class='disabled'><a href='#'>&laquo;</a></li> -->
										</c:if>
										<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${pb.nowPage!=i}">

													<li><button class="pageBtn">${i}</button> <%-- 
													<a href="${pageContext.request.contextPath}/makeGameProgramFormByPageNo.do?pageNo=${i}">${i}</a>
														 --%></li>
												</c:when>
												<c:otherwise>
													<li class="active"><a href="#">${i}</a></li>
												</c:otherwise>
											</c:choose>
										&nbsp;
										</c:forEach>

										<c:if test="${pb.nextPageGroup}">
											<li>&raquo;</li>
											<li><button class="pageBtn">${pb.endPageOfPageGroup+1}</button></li>
											<!-- <li class='disabled'><a href='#'>&raquo;</a></li> -->
										</c:if>
									</ul>
								</div>
							</div>
<!--카드 목록나올구문------------------------------------------------------------------ -->
						</div>
					</div>
				</div>

				<div class="col-sm-8" style="overflow: scroll; overflow-x: hidden; height: 650px;">
					<form
						action="${pageContext.request.contextPath}/updateGameProgram.do"
						method="post" id="updateGameProgramForm" name="updateGameProgramForm">
<!-- updateGameProgram.do ---------------------------------------------------------------------------------------------- -->
<sec:csrfInput/>
						<table id="gameprogramlist" class="myTable simpleTable" style="margin-top: 0px;">
							<thead>
								<tr>
									<th>프로그램명 :</th>
									<th colspan="3"><input type="text" name="title" value="${requestScope.gpList[0].programTitle }"
										style="background-color: #ff1a1a; width: 100%;"
										required="required"></th>
								</tr>
								<tr>
									<th>설명</th>
									<th colspan="3"><input type="text" name="detail" value="${requestScope.gpList[0].detail }"
										style="width: 100%;" maxlength="15" required="required"></th>
								</tr>
							</thead>
							<tbody class="myProgramtBody">
								
								<c:forEach items="${requestScope.gpList }" var="gp">

									<tr>
										<td><span class='setoGameNo'>${gp.oGameNo }</span></td>
										<td data-toggle='collapse'
											data-target='#accordion${gp.oGameNo }' class='clickable'>
											${gp.title }</td>
										<td><span class='gameTime'>${gp.gameTime }</span> 분</td>
										<td><i class='material-icons button'>
												<button
													style='background-color: transparent; border: 0px transparent solid;'
													onclick='deleteLine(this);'>cancel</button>
										</i>
									</tr>
									<tr>
										<td colspan='4' style='border-top-width: 0px;'>
											<div id='accordion${gp.oGameNo }' class='collapse'>
												<div style='text-align: right; font-size: 17px;'>
													인원 : <span class='minVal'>${gp.minPersonnel }</span> ~ 
													<span class='maxVal'>${gp.maxPersonnel }</span> 명
												</div>
												<div style='text-align: right; font-size: 17px;'>준비물 :
													${gp.materials }</div>
												${gp.content }
											</div>
										</td>
									</tr>
								</c:forEach>

								<tr id="endgameprogram"></tr>
							</tbody>
						</table>

					</form>
<!-- updateGameProgram.do -------------------------------------------------------------------------------->
				
					<form
						action="${pageContext.request.contextPath}/deleteGameProgram.do"
						method="post" id="deleteGameProgramForm" name="deleteGameProgramForm">
						<sec:csrfInput/>
						<input type="hidden" id="deletePno" name="deletePno" required="required">
					</form>
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<div id="gameInfo">
<!-- 프로그램 정보 자리 ---------------------------------------------------------------------------------------------- -->
                 		</div>
					</div>
					<div class="col-sm-12">
					<div class="btnArea">
						<button form="updateGameProgramForm" class="btn btn-light btn-lg" 
							style="font-size: 24px;">
							수정 <i class="fa fa-pencil"></i>
						</button>
						<button form="deleteGameProgramForm" class="btn btn-light btn-lg" 
							style="font-size: 24px;">
							삭제 <i class="material-icons">delete_sweep</i>
						</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
</div>


		
<script>
var gamecount="${fn:length(gpList) }";
//alert(gamecount);
var personnelArr = new Array();
var oGameNoArr = new Array();
var totalTime = 0;
//var load = document.getElementById('loadoGameNo').innerHTML;

for(var i=0; i<parseInt(gamecount); i++){
	//oGameNoArr.push('${requestScope.gpList.get(i).oGameNo }');
	//personnelArr.push('${requestScope.gpList.get(i).minPersonnel }');
	//personnelArr.push('${requestScope.gpList.get(i).maxPersonnel }');
	//alert("${requestScope.gpList.get(i).gameTime }");
	totalTime += parseInt('${requestScope.gpList.get(i).gameTime }');
}

for (var i = 0; i < $(".setoGameNo").length; i++) {
	oGameNoArr.push( $(".setoGameNo").eq(i).html() );
	//alert(oGameNoArr[i]);
}
var min = Math.min.apply(null, personnelArr);
var max = Math.max.apply(null, personnelArr);

$(document).ready(function() {
	
     //$(".programcard").addClass("disabledbutton");
     //$(".btnArea").hide();
     
     //첫 로딩시 세팅된 게임 비활성화
     for(var i=1; i<=6; i++ ){
    	 if(oGameNoArr.indexOf($("#oGameNo"+i).text())>-1)
    		 $("#oGameNo"+i).parent().parent().addClass("disabledbutton");
     }
    

<%------------------------------------------- 카드 목록 제작  ajax --%>
 	$('.game-post-area').on("click",".pageBtn",function(event){
        // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
        //alert($(this).text());
        //$(".game-post-area").remove();
		
        $.ajax({
            type: "get",
            url: "makeGameProgramFormByPageNo.do",
            dataType:"json",
            data: {pageNo : $(this).text()},
            success: function(listVO) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
                
                var json="";

				var ogvo = listVO.list;
				for(var i=0; i<ogvo.length; i++){
					
json+="						<div id='programcard";
json+=						i+1;
						if(oGameNoArr.indexOf(ogvo[i].oGameNo) > -1){
json+=						"' class='card game programcard disabledbutton'>";
						}else {
json+=						"' class='card game programcard'>";							
						}
json+="							<div class='card-header'><h4 id='gametitle";
json+=							i+1;
json+=							"'>";
json+=					ogvo[i].title;
json+="						</h4></div><div class='card-body'><h5 id='oGameNo";
json+=							i+1;
json+=							"'style='font-family: serif; text-align: center;'>";
json+=					ogvo[i].oGameNo;
json+=						"</h5><i class='material-icons'>";
json+="						<a href='${pageContext.request.contextPath}/officialGameDetail.do?oGameNo=";
json+=					ogvo[i].oGameNo;
json+=								"' style='font-size: 20px; color: red' target='_blank'>open_in_new</a></i></div>";

json+="						<div class='rowgamefooter'>";
json+="							<div class='col-sm-6' align='left'><h5 style='font-family: serif; text-align: left;'>";
json+=					ogvo[i].gameTime;
json+=								" 분</h5></div>";
json+="						<div class='col-sm-6' align='right'><h5 align='right' style='color: red;'>";
json+=							ogvo[i].minPersonnel;
json+=								" ~ ";
json+=							ogvo[i].maxPersonnel;
json+=								" 명</h5></div></div></div>";
					
					
				}
				var pb = listVO.pagingBean;
json+="					<div class='pagingInfo'>";
						
json+="						<ul class='pagination'>";

						if(pb.previousPageGroup){							
json+="							<li><button class='pageBtn'>";
json+=									pb.startPageOfPageGroup-1;
json+=									"</button></li>";
json+=									"<li>&laquo;</li>";
//json+=									"<li class='disabled'><a href='#'>&laquo;</a></li>";
						}
						for(var i=pb.startPageOfPageGroup; i<=pb.endPageOfPageGroup; i++){
							if(pb.nowPage!=i){
								
json+="							<li><button class='pageBtn'>";
json+=							i;
json+=							"</button></li>";
							}
							else {
								
json+="							<li class='active'><a href='#'>";
json+=									i;
json+=							"</a></li>";		
							}
json+="								&nbsp;";
						}

							
							if(pb.nextPageGroup){
//json+=							"<li class='disabled'><a href='#'>&raquo;</a></li>";
json+="<li>&raquo;</li>"
json+="							<li><button class='pageBtn'>";
json+=							pb.endPageOfPageGroup+1;
json+=							"</button></li>";
							}
json+="					</ul></div>";
        		
                $(".game-post-area").html(json);
                

            },
            error: function(data) {
                alert("error!");
            }
        });
   
	});
 	<%------------------------------------------------------------------------------------------------ 카드 목록 제작  ajax --%>
 	
 
 	
 	
	//$("#programcard1").click(function() {
	$('.game-post-area').on('click','#programcard1',function() {
		// alert($("#oGameNo1").text());
		//$(".btnArea").show();
		 $.ajax({
             type: "get",
             url: "getLeftGameByGameNo.do",
             dataType:"json",
             data: {oGameNo : $("#oGameNo1").text()},
             success: function(gvo) {
                 //$.trim() => 앞뒤 공백 제거
                 //alert(gvo.title);

                   //게임정보 편집
                   oGameNoArr.push(gvo.oGameNo);
                 	gamecount++;
                   personnelArr.push(gvo.minPersonnel);
                   personnelArr.push(gvo.maxPersonnel);
               	personnelArr.sort();
                   totalTime += parseInt(gvo.gameTime);
                   max = Math.max.apply(null, personnelArr);
                   min = Math.min.apply(null, personnelArr);
               	
                 var str="";
                 str+="<tr><td>";
                 str+="<span class='setoGameNo'>";
                 str+=gvo.oGameNo;
                 str+="</span>";
                 str+="</td><td data-toggle='collapse' data-target='#accordion";
                 str+=gvo.oGameNo;
                 str+="' class='clickable'>";
                 str+=gvo.title;
                 str+="</td><td>";
                 //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                 //str+="cancel</button></i>";
                 str+="<span class='gameTime'>";
                 str+=gvo.gameTime;
                 str+="</span>";
                 str+=" 분</td><td><i class='material-icons button'>";
                 str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                 str+="cancel</button></i>";
                 str+="</tr>";
                 str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                 str+="<div id='accordion";
                 str+=gvo.oGameNo;
                 str+="' class='collapse'>";
                 str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                 	str+="<span class='minVal'>";
                 	str+=gvo.minPersonnel;
                    str+="</span>";
                	str+=" ~ ";
                	str+="<span class='maxVal'>";
                	str+=gvo.maxPersonnel;
                	str+="</span>";
                	str+=" 명</div>";
                	
                str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                 	str+=gvo.materials;
                	str+="</div>";
                 str+=gvo.content;
				 str+="</div>";
                 str+="</td></tr>";
                 
                 $('#endgameprogram').before(str);
                 
                 var info="";
                 info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
                info+="		<tr>";
                info+="			<th colspan='2'>프로그램 정보</th>";
                info+="		</tr>";
                info+="</thead>";
                
                info+="				<tbody>";
                info+="<tr>";
                info+="		<td width='150px'>게임 갯수</td>";
                info+="		<td>";
                info+=gamecount;
                info+="</td>";
                info+="</tr>";
                info+="<tr>";
                info+="		<td>예상 인원</td>";
                info+="		<td>";
                info+=min
                info+=" ~ ";
                info+=max
                info+="명</td>";
                info+="</tr>";
                info+="<tr>";
                info+="		<td>총 소요시간</td>";
                info+="		<td>";
                info+=totalTime;
                info+=" 분</td>";
                info+="</tr>";
                info+="				</tbody>";
                 info+="</table>";
              $("#gameInfo").html(info);                	   
                    
                 //$('#programcard1').remove();
                 $("#programcard1").addClass("disabledbutton");
             },
             error: function(data) {
                 alert("error!");
             }
         });
	});
	
	//$("#programcard2").click(function() {
	$('.game-post-area').on('click','#programcard2',function() {
		// alert($("#oGameNo1").text());
		 $.ajax({
            type: "get",
            url: "getLeftGameByGameNo.do",
            dataType:"json",
            data: {oGameNo : $("#oGameNo2").text()},
            success: function(gvo) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
               
  				oGameNoArr.push(gvo.oGameNo);
                //게임정보 편집
             	gamecount++;
               personnelArr.push(gvo.minPersonnel);
               personnelArr.push(gvo.maxPersonnel);
           	personnelArr.sort();
               totalTime += parseInt(gvo.gameTime);
               max = Math.max.apply(null, personnelArr);
               min = Math.min.apply(null, personnelArr);
           	
                var str="";
                  
                str+="<tr><td>";
                str+="<span class='setoGameNo'>";
                str+=gvo.oGameNo;
                str+="</span>";
                str+="</td><td data-toggle='collapse' data-target='#accordion";
                str+=gvo.oGameNo;
                str+="' class='clickable'>";
                str+=gvo.title;
                str+="</td><td>";
                //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                //str+="cancel</button></i>";
                str+="<span class='gameTime'>";
                str+=gvo.gameTime;
                str+="</span>";
                str+=" 분</td><td><i class='material-icons button'>";
                str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                str+="cancel</button></i>";
                str+="</tr>";
                str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                str+="<div id='accordion";
                str+=gvo.oGameNo;
                str+="' class='collapse'>";
                str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                	str+="<span class='minVal'>";
                	str+=gvo.minPersonnel;
                   str+="</span>";
               	str+=" ~ ";
               	str+="<span class='maxVal'>";
               	str+=gvo.maxPersonnel;
               	str+="</span>";
               	str+=" 명</div>";
               	
               str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                	str+=gvo.materials;
               	str+="</div>";
                str+=gvo.content;
				 str+="</div>";
                str+="</td></tr>";
                $('#endgameprogram').before(str);
                
                var info="";
                info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
               info+="		<tr>";
               info+="			<th colspan='2'>프로그램 정보</th>";
               info+="		</tr>";
               info+="</thead>";
               
               info+="				<tbody>";
               info+="<tr>";
               info+="		<td width='150px'>게임 갯수</td>";
               info+="		<td>";
               info+=gamecount;
               info+="</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>예상 인원</td>";
               info+="		<td>";
               info+=min
               info+=" ~ ";
               info+=max
               info+="명</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>총 소요시간</td>";
               info+="		<td>";
               info+=totalTime;
               info+=" 분</td>";
               info+="</tr>";
               info+="				</tbody>";
                info+="</table>";
             $("#gameInfo").html(info);                	   
                   
                //$('#programcard1').remove();
                $("#programcard2").addClass("disabledbutton");
            },
            error: function(data) {
                alert("error!");
            }
        });
	});
	//$("#programcard3").click(function() {
	$('.game-post-area').on('click','#programcard3',function() {
		// alert($("#oGameNo1").text());
		 $.ajax({
            type: "get",
            url: "getLeftGameByGameNo.do",
            dataType:"json",
            data: {oGameNo : $("#oGameNo3").text()},
            success: function(gvo) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
               
  				oGameNoArr.push(gvo.oGameNo);
  			//게임정보 편집
             	gamecount++;
               personnelArr.push(gvo.minPersonnel);
               personnelArr.push(gvo.maxPersonnel);
           	personnelArr.sort();
               totalTime += parseInt(gvo.gameTime);
               max = Math.max.apply(null, personnelArr);
               min = Math.min.apply(null, personnelArr);
           	
                var str="";
                  
                str+="<tr><td>";
                str+="<span class='setoGameNo'>";
                str+=gvo.oGameNo;
                str+="</span>";
                str+="</td><td data-toggle='collapse' data-target='#accordion";
                str+=gvo.oGameNo;
                str+="' class='clickable'>";
                str+=gvo.title;
                str+="</td><td>";
                //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                //str+="cancel</button></i>";
                str+="<span class='gameTime'>";
                str+=gvo.gameTime;
                str+="</span>";
                str+=" 분</td><td><i class='material-icons button'>";
                str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                str+="cancel</button></i>";
                str+="</tr>";
                str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                str+="<div id='accordion";
                str+=gvo.oGameNo;
                str+="' class='collapse'>";
                str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                	str+="<span class='minVal'>";
                	str+=gvo.minPersonnel;
                   str+="</span>";
               	str+=" ~ ";
               	str+="<span class='maxVal'>";
               	str+=gvo.maxPersonnel;
               	str+="</span>";
               	str+=" 명</div>";
               	
               str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                	str+=gvo.materials;
               	str+="</div>";
                str+=gvo.content;
				 str+="</div>";
                str+="</td></tr>";
                
                $('#endgameprogram').before(str);
                
                
                var info="";
                info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
               info+="		<tr>";
               info+="			<th colspan='2'>프로그램 정보</th>";
               info+="		</tr>";
               info+="</thead>";
               
               info+="				<tbody>";
               info+="<tr>";
               info+="		<td width='150px'>게임 갯수</td>";
               info+="		<td>";
               info+=gamecount;
               info+="</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>예상 인원</td>";
               info+="		<td>";
               info+=min
               info+=" ~ ";
               info+=max
               info+="명</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>총 소요시간</td>";
               info+="		<td>";
               info+=totalTime;
               info+=" 분</td>";
               info+="</tr>";
               info+="				</tbody>";
                info+="</table>";
             $("#gameInfo").html(info);                	   
                   
                //$('#programcard1').remove();
                $("#programcard3").addClass("disabledbutton");
            },
            error: function(data) {
                alert("error!");
            }
        });
	});
	//$("#programcard4").click(function() {
	$('.game-post-area').on('click','#programcard4',function() {
		// alert($("#oGameNo1").text());
		 $.ajax({
            type: "get",
            url: "getLeftGameByGameNo.do",
            dataType:"json",
            data: {oGameNo : $("#oGameNo4").text()},
            success: function(gvo) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
               
  				oGameNoArr.push(gvo.oGameNo);
  			//게임정보 편집
             	gamecount++;
               personnelArr.push(gvo.minPersonnel);
               personnelArr.push(gvo.maxPersonnel);
           	personnelArr.sort();
               totalTime += parseInt(gvo.gameTime);
               max = Math.max.apply(null, personnelArr);
               min = Math.min.apply(null, personnelArr);
           	
                var str="";
                  
                str+="<tr><td>";
                str+="<span class='setoGameNo'>";
                str+=gvo.oGameNo;
                str+="</span>";
                str+="</td><td data-toggle='collapse' data-target='#accordion";
                str+=gvo.oGameNo;
                str+="' class='clickable'>";
                str+=gvo.title;
                str+="</td><td>";
                //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                //str+="cancel</button></i>";
                str+="<span class='gameTime'>";
                str+=gvo.gameTime;
                str+="</span>";
                str+=" 분</td><td><i class='material-icons button'>";
                str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                str+="cancel</button></i>";
                str+="</tr>";
                str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                str+="<div id='accordion";
                str+=gvo.oGameNo;
                str+="' class='collapse'>";
                str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                	str+="<span class='minVal'>";
                	str+=gvo.minPersonnel;
                   str+="</span>";
               	str+=" ~ ";
               	str+="<span class='maxVal'>";
               	str+=gvo.maxPersonnel;
               	str+="</span>";
               	str+=" 명</div>";
               	
               str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                	str+=gvo.materials;
               	str+="</div>";
                str+=gvo.content;
				 str+="</div>";
                str+="</td></tr>";
                
                $('#endgameprogram').before(str);
                
                
                var info="";
                info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
               info+="		<tr>";
               info+="			<th colspan='2'>프로그램 정보</th>";
               info+="		</tr>";
               info+="</thead>";
               
               info+="				<tbody>";
               info+="<tr>";
               info+="		<td width='150px'>게임 갯수</td>";
               info+="		<td>";
               info+=gamecount;
               info+="</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>예상 인원</td>";
               info+="		<td>";
               info+=min
               info+=" ~ ";
               info+=max
               info+="명</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>총 소요시간</td>";
               info+="		<td>";
               info+=totalTime;
               info+=" 분</td>";
               info+="</tr>";
               info+="				</tbody>";
                info+="</table>";
             $("#gameInfo").html(info);                	   
                   
                //$('#programcard1').remove();
                $("#programcard4").addClass("disabledbutton");
            },
            error: function(data) {
                alert("error!");
            }
        });
	});
	
	//$("#programcard5").click(function() {
	$('.game-post-area').on('click','#programcard5',function() {
		// alert($("#oGameNo1").text());
		 $.ajax({
            type: "get",
            url: "getLeftGameByGameNo.do",
            dataType:"json",
            data: {oGameNo : $("#oGameNo5").text()},
            success: function(gvo) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
               
  				oGameNoArr.push(gvo.oGameNo);
  			//게임정보 편집
             	gamecount++;
               personnelArr.push(gvo.minPersonnel);
               personnelArr.push(gvo.maxPersonnel);
           	personnelArr.sort();
               totalTime += parseInt(gvo.gameTime);
               max = Math.max.apply(null, personnelArr);
               min = Math.min.apply(null, personnelArr);
           	
                var str="";
                  
                str+="<tr><td>";
                str+="<span class='setoGameNo'>";
                str+=gvo.oGameNo;
                str+="</span>";
                str+="</td><td data-toggle='collapse' data-target='#accordion";
                str+=gvo.oGameNo;
                str+="' class='clickable'>";
                str+=gvo.title;
                str+="</td><td>";
                //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                //str+="cancel</button></i>";
                str+="<span class='gameTime'>";
                str+=gvo.gameTime;
                str+="</span>";
                str+=" 분</td><td><i class='material-icons button'>";
                str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                str+="cancel</button></i>";
                str+="</tr>";
                str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                str+="<div id='accordion";
                str+=gvo.oGameNo;
                str+="' class='collapse'>";
                str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                	str+="<span class='minVal'>";
                	str+=gvo.minPersonnel;
                   str+="</span>";
               	str+=" ~ ";
               	str+="<span class='maxVal'>";
               	str+=gvo.maxPersonnel;
               	str+="</span>";
               	str+=" 명</div>";
               	
               str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                	str+=gvo.materials;
               	str+="</div>";
                str+=gvo.content;
				 str+="</div>";
                str+="</td></tr>";
                
                $('#endgameprogram').before(str);
                
                
                var info="";
                info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
               info+="		<tr>";
               info+="			<th colspan='2'>프로그램 정보</th>";
               info+="		</tr>";
               info+="</thead>";
               
               info+="				<tbody>";
               info+="<tr>";
               info+="		<td width='150px'>게임 갯수</td>";
               info+="		<td>";
               info+=gamecount;
               info+="</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>예상 인원</td>";
               info+="		<td>";
               info+=min
               info+=" ~ ";
               info+=max
               info+="명</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>총 소요시간</td>";
               info+="		<td>";
               info+=totalTime;
               info+=" 분</td>";
               info+="</tr>";
               info+="				</tbody>";
                info+="</table>";
             $("#gameInfo").html(info);                	   
                   
                //$('#programcard1').remove();
                $("#programcard5").addClass("disabledbutton");
            },
            error: function(data) {
                alert("error!");
            }
        });
	});
	//$("#programcard6").click(function() {
	$('.game-post-area').on('click','#programcard6',function() {
		// alert($("#oGameNo1").text());
		 $.ajax({
            type: "get",
            url: "getLeftGameByGameNo.do",
            dataType:"json",
            data: {oGameNo : $("#oGameNo6").text()},
            success: function(gvo) {
                //$.trim() => 앞뒤 공백 제거
                //alert(gvo.title);
               
  				oGameNoArr.push(gvo.oGameNo);
  				 //게임정보 편집
             	gamecount++;
               personnelArr.push(gvo.minPersonnel);
               personnelArr.push(gvo.maxPersonnel);
           	personnelArr.sort();
               totalTime += parseInt(gvo.gameTime);
               max = Math.max.apply(null, personnelArr);
               min = Math.min.apply(null, personnelArr);
           	
                var str="";
                  
                str+="<tr><td>";
                str+="<span class='setoGameNo'>";
                str+=gvo.oGameNo;
                str+="</span>";
                str+="</td><td data-toggle='collapse' data-target='#accordion";
                str+=gvo.oGameNo;
                str+="' class='clickable'>";
                str+=gvo.title;
                str+="</td><td>";
                //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                //str+="cancel</button></i>";
                str+="<span class='gameTime'>";
                str+=gvo.gameTime;
                str+="</span>";
                str+=" 분</td><td><i class='material-icons button'>";
                str+="<button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                str+="cancel</button></i>";
                str+="</tr>";
                str+="<tr><td colspan='4' style='border-top-width: 0px;'>";
                str+="<div id='accordion";
                str+=gvo.oGameNo;
                str+="' class='collapse'>";
                str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                	str+="<span class='minVal'>";
                	str+=gvo.minPersonnel;
                   str+="</span>";
               	str+=" ~ ";
               	str+="<span class='maxVal'>";
               	str+=gvo.maxPersonnel;
               	str+="</span>";
               	str+=" 명</div>";
               	
               str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                	str+=gvo.materials;
               	str+="</div>";
                str+=gvo.content;
				 str+="</div>";
                str+="</td></tr>";
               $('#endgameprogram').before(str);
                
               
                var info="";
                info+= "<table class='table' style='font-size: x-large;'>";	
				info+="<thead>";
               info+="		<tr>";
               info+="			<th colspan='2'>프로그램 정보</th>";
               info+="		</tr>";
               info+="</thead>";
               
               info+="				<tbody>";
               info+="<tr>";
               info+="		<td width='150px'>게임 갯수</td>";
               info+="		<td>";
               info+=gamecount;
               info+="</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>예상 인원</td>";
               info+="		<td>";
               info+=min
               info+=" ~ ";
               info+=max
               info+="명</td>";
               info+="</tr>";
               info+="<tr>";
               info+="		<td>총 소요시간</td>";
               info+="		<td>";
               info+=totalTime;
               info+=" 분</td>";
               info+="</tr>";
               info+="				</tbody>";
                info+="</table>";
             $("#gameInfo").html(info);                	   
                
                $("#programcard6").addClass("disabledbutton");
            },
            error: function(data) {
                alert("error!");
            }
        });
	});

	
	//$("programNo option[value='2']").attr("selected", true);

	$("#updateGameProgramForm").submit(function() {
		//$("#title").val($("#programNo option:selected").text());
		//alert($(".myTable td:nth-child(15n-14)").text());
		//alert($(".setoGameNo").text());
        
		//var oGameNo = '';
		var sendoGameNoArr = new Array();
        for (var i = 0; i < $(".setoGameNo").length; i++) {
        	sendoGameNoArr.push( $(".setoGameNo").eq(i).html() );
        	//alert(oGameNoArr[i]);
        }
		fnAppendHidden(document.updateGameProgramForm, "programNo", '${requestScope.gpList[0].programNo }');
		for(var i=0; i<sendoGameNoArr.length; i++){
			fnAppendHidden(document.updateGameProgramForm, "oGameNoArr", sendoGameNoArr[i]);
		}
		
		return confirm("게임 프로그램을 수정하시겠습니까?");
	});
	$("#deleteGameProgramForm").submit(function() {
		//$("#title").val($("#programNo option:selected").text());
		//alert('${requestScope.gpList[0].programNo }');
		$("#deletePno").val('${requestScope.gpList[0].programNo }');
		
		return confirm("게임 프로그램을 삭제하시겠습니까?");
	});
});
//Form에 동적으로 Hidden값 생성
function fnAppendHidden(p_form, p_nm, p_val){
	 if(!p_form) return;
	 //Hidden 항목을 생성합니다.
	 var o_hidden = document.createElement("input");
	 o_hidden.type = "hidden";
	 o_hidden.name = p_nm;
	 o_hidden.value = p_val;
	 //폼에 히든항목을 붙입니다.
	 p_form.appendChild(o_hidden);
}
function deleteLine(obj) {
	//라인 삭제
    var tr = $(obj).parent().parent().parent();
	var trAccordion = $(obj).parent().parent().parent().next();

	//alert(tr.find('span.gameTime').text());			//게임시간
	//alert(trAccordion.find('span.minVal').text());	//최소인원
	//alert(trAccordion.find('span.maxVal').text());	//최대인원
	//alert("oGameNo:"+tr.find('span.oGameNo').text());	//게임번호
	oGameNoArr.splice( oGameNoArr.indexOf(tr.find('span.oGameNo').text()), 1 );
	//alert("oGameNoArr:"+oGameNoArr);
	gamecount--;
	//최대, 최소 구현.... 잘안된다
	//personnelArr.splice(personnelArr.indexOf(trAccordion.find('span.minVal').text()), 1);
	//personnelArr.splice(personnelArr.indexOf(trAccordion.find('span.maxVal').text()), 1);
	//alert(tr.find('span.gameTime').text());
	totalTime -= parseInt(tr.find('span.gameTime').text());
    max = Math.max.apply(null, personnelArr);
    min = Math.min.apply(null, personnelArr);
    //alert(personnelArr);
    //alert(min+"~"+max);
	 var info="";
     info+= "<table class='table' style='font-size: x-large;'>";	
	info+="<thead>";
    info+="		<tr>";
    info+="			<th colspan='2'>프로그램 정보</th>";
    info+="		</tr>";
    info+="</thead>";
    
    info+="				<tbody>";
    info+="<tr>";
    info+="		<td width='150px'>게임 갯수</td>";
    info+="		<td>";
    info+=gamecount;
    info+="</td>";
    info+="</tr>";
    info+="<tr>";
    info+="		<td>예상 인원</td>";
    info+="		<td>";
    info+=min
    info+=" ~ ";
    info+=max
    info+="명</td>";
    info+="</tr>";
    info+="<tr>";
    info+="		<td>총 소요시간</td>";
    info+="		<td>";
    info+=totalTime;
    info+=" 분</td>";
    info+="</tr>";
    info+="				</tbody>";
     info+="</table>";
  $("#gameInfo").html(info);              
	

	tr.remove();
	trAccordion.remove();	
}

</script>
