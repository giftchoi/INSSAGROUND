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
				<h1>MY GAME PROGRAM DETAIL</h1>
			</div>
			<br> <br>
			<div class="row">

				<div class="col-sm-12">
					<form
						action="${pageContext.request.contextPath}/editGameProgram.do"
						method="post" id="editGameProgramForm">
<sec:csrfInput/>
						<table id="gameprogramlist" class="myTable simpleTable">
							<thead>
								<tr>
									<th>프로그램명 :</th>
									<th colspan="2">
									<select id="programNo" name="programNo" style="background-color: #ff1a1a; width: 100%; text-align-last:center;" required="required">
												<option value="">**---프로그램을 선택하세요---**</option>
											<c:forEach items="${requestScope.myGameProgramList }" var="myGameProgram">
												<option value="${myGameProgram.programNo }">${myGameProgram.title }</option>
											</c:forEach>
									</select></th>
								</tr>
									
								<tr>
									<th>설명</th>
									<th colspan="2">
									
									<input type="text" id="programDetail" name="detail"
										style="width: 100%;" required="required" disabled="disabled">
									</th>
								</tr>
							</thead>
							<tbody class="myProgramtBody">

								<!-- 항목 들어갈데 -->


								<tr id="endgameprogram"></tr>
								<tr>
									<th colspan="3">
									<!-- 
									<i class="material-icons button delete">
											<input id="programReset" type="reset" value="delete"
											style="background-color: transparent; border: 0px transparent solid;">
									</i>
									 -->
									</th>
								</tr>
							</tbody>

						</table>
							<input type="hidden" id="title" name="title" value="">
							<input type="hidden" id="gameNoList" name="gameNoList" value="">
							<input type="hidden" id="gameNameList" name="gameNameList" value="">
							

					</form>
					<form
						action="${pageContext.request.contextPath}/deleteGameProgram.do"
						method="post" id="deleteGameProgramForm">
						<sec:csrfInput/>
						<input type="hidden" id="deletePno" name="deletePno">
					</form>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
 
						<div id="gameInfo">
						<!-- 프로그램 정보 자리 -->
						</div>

					</div>
					<div class="col-sm-4"></div>
				</div>

					<div class="btnArea">
						<button form="editGameProgramForm" class="btn btn-light btn-lg" 
							style="font-size: 24px;">
							편집 <i class="fa fa-pencil"></i>
						</button>
						
						<!-- 
						<button form="deleteGameProgramForm" class="btn btn-light btn-lg" 
							style="font-size: 24px;">
							삭제 <i class="material-icons">delete_sweep</i>
						</button>
						 -->
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


		
<script>

$(document).ready(function() {
	
	
	$('select[name=programNo]').change(function() {
		//alert($(this).val());
		$(".myTable td").remove();
		
		 if($("select[name=programNo]").val()==0){
	    	  $("#programDetail").val("");
	      }
		$.ajax({
             type: "get",
             url: "getGameProgramDetailByProgramNo.do",
             dataType:"json",
             data: {programNo : $(this).val()},
             success: function(gameProgramList) {
                 //$.trim() => 앞뒤 공백 제거
                 //alert(gameProgramList);
                 
                 var gamecount=0;
                 var min=1000;
                 var max=1;
                 var totalTime = 0;
                 $.each(gameProgramList, function(index,value){
                	 //alert(value.oGameNo);
                     var str="";
                     str+="<tr data-toggle='collapse' data-target='#accordion";
                     str+=index+1;
                     str+="' class='clickable'><td>";
                     //str+=value.oGameNo;
                     str+=index+1;
                     str+="</td><td>";
                     str+=value.title;
                     str+="</td><td>";
                     //str+="<i class='material-icons button'><button style='background-color:transparent;  border:0px transparent solid;' onclick='deleteLine(this);'>";
                     //str+="cancel</button></i>";
                     str+=value.gameTime;
                     str+="분</td></tr>";
                     str+="<tr><td colspan='3' style='border-top-width: 0px;'>";
                     str+="<div id='accordion";
                     str+=index+1;
                     str+="' class='collapse'>";
                     str+="<div style='text-align:right; font-size: 17px;'>인원 : ";
                     	str+=value.minPersonnel;
                    	str+=" ~ ";
                    	str+=value.maxPersonnel;
                    	str+=" 명</div>";
                    str+="<div style='text-align:right; font-size: 17px;'>준비물 : ";
                     	str+=value.materials;
                    	str+="</div>";
                     str+=value.content;
					 str+="</div>";
                     str+="</td></tr>";
                     $('#endgameprogram').before(str);
                	gamecount++;
                	if(value.minPersonnel<min)
                		min = value.minPersonnel;
                	if(value.maxPersonnel>max)
                		max = value.maxPersonnel;
                	totalTime += value.gameTime;
                     
                     $("#programDetail").val(value.detail);
                 });
                 
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
                info+="		<td>인원</td>";
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
                info+="분</td>";
                info+="</tr>";
                info+="				</tbody>";
                 info+="</table>";
                 
                	//alert($("select[name=programNo]").val());

                   if($("select[name=programNo]").val()!=0){
                  		$("#gameInfo").html(info);                	   
                   }else {
                		$("#gameInfo").html("");
                   }
             },
             error: function(data) {
                 alert("불러오기error!");
             }
         });
	});
	
	//$("programNo option[value='2']").attr("selected", true);
	
	$("#editGameProgramForm").submit(function() {

		return confirm("게임 프로그램을 편집하시겠습니까?");
	});

});

function deleteLine(obj) {
	//라인 삭제
    var tr = $(obj).parent().parent().parent();
	tr.remove();
}

</script>
