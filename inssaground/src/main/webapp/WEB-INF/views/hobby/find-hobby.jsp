<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#myProgress {
	position:relative;
	top:120px;
	left:5%;
	width: 90%;
	background-color: #ddd;
	border-radius: 20px;
}

#myBar {
	width: 0%;
	height: 30px;
	background-color: #ff1a1a;
	text-align: right;
	font-size: 20px;
	line-height: 30px;
	color: white;
	border-radius: 20px;
}

#progressPage{
	display:inline-block;
	width:100%;
}
div {
	font-family: 'Noto Sans KR','Nanum Gothic', sans-serif !important;
	font-size: 25px !important;
	font-weight: 400;
}
#feature{
	
	 text-decoration: underline;
	 font-size: 30px;
}
</style>
<script>
	var index=0;
	var fList;
	var width=0;
	$(document).ready(function(){
		var ffList = new Array;
		$("#startBtn").click(function(){
			$.ajax({
				type:"get",
				url:"getFeatureList.do",
				success: function(result){
					fList = result;	
					$("#startPage").css("display","none");
					$("#progressPage").css("display","block");
					//alert(fList[index].);
					///alert($("#feature").text());
					$("#feature").text(fList[index].name);
				}
			});//ajax
		});//button
		$("#yes" ).click(function() {
			var feature = $("#feature").text();
			//var feature =$("#feNo")
			ffList.push(feature);
			//alert(ffList);
			move();
			
		});
		$("#resultPage").click(function(){
			location.href="${pageContext.request.contextPath}/findHobbyResult.do?ffList="+ffList;
		});//click
	});//ready
	
	function move() {
		//alert(fList[++index].name);
		if(++index<20){
			$("#feature").text(fList[index].name);
		}else{
			$("#progressPage").css("display","none");
			$("#endPage").css("display","block");
		}
		var elem = document.getElementById("myBar");
		//var width=document.getElementById("progress");
		
		if(width>=100){
			//location.href="";
		}else{
		width += 5;
		
		elem.style.width = width + '%';
		elem.innerHTML = width * 1 + '%'; 
		}
		
	}

</script>
<div class="col-sm-12">
	<div class="row content">
		<div class="col-sm-8 offset-2">
			<div class="red-outline">
				<div id="startPage">
					<span style="font-size:30px;font-weight:400;">나만의 취미 찾기</span><br><br><br><br>
					<input class="btn btn-red" type="button" id="startBtn" value="시작">
				</div>
				<div id="progressPage" style="display:none">
					<h1>나는 <span id="feature"></span> 활동을 좋아한다</h1>
					<br><br><br><br><br> 
					<button  class="btn btn-red" id="yes">YES</button>&nbsp;&nbsp;<button onclick="move()" class="btn btn-red">NO</button>
					<div id="myProgress">
						<div id="myBar">0% </div>
					</div>
				</div>
				<div id="endPage" style="display:none">
					<h1>취미 찾기 성공</h1>
					<span class="fa fa-check-square fa-4x"></span><br><br><br><br><br> 
					<a class="btn btn-red" id=resultPage >결과확인</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%--
********************************************************************************************************

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 10%;
  height: 30px;
  background-color: #ff1a1a;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
<div class="col-sm-12">
<div id="startPage"class="card" style="border: 5px solid #ff1a1a;">
<br><br>
	<h2 style="font-weight: bolder; margin-top: 2rem; font-size: 3.5rem;">나에게 맞는 취미 찾기</h2>
	<div class="card-body" style="padding: 10rem;">
		<p class="card-text" style="font-size: 2.0rem;">취미 선호도 조사</p>
		<input type="button" id="startBtn" value="시작" > 			
	</div>
</div>
<div id="progressPage"class="card" style="display:none">
	<div class="card-body" style="padding: 10rem;">
		나는 <span class="card-text" style="font-size: 2.5rem;" id="feature">gg</span>활동을 좋아한다<br>
		<a href="#" class="card-link" style="font-size: 2.5rem;"><button  class="btn btn-red" id="yes">YES</button></a> <a
			href="#" class="card-link" style="font-size: 2.5rem;"><button onclick="move()" class="btn btn-red">NO</button></a>
	</div>
	
	<div id="myProgress">
		<div id="myBar">5%</div>
	</div>
</div>
<div id="endPage"class="card"style="display:none">
	<h2 style="font-weight: bolder; font-size: 3.5rem;">취미찾기 완료</h2>
	<div class="card-body" style="padding: 10rem;">
		<button id=resultPage >결과보러가기</button>
		 			
	</div>
</div>	
</div>


*********************************************************************************************영진 기능추가
 --%>

<%-- <div class="col-sm-12">
<div id="startPage"class="card">
	<h2 style="font-weight: bolder; font-size: 3.5rem;">나에게 맞는 취미 찾기</h2>
	<div class="card-body" style="padding: 10rem;">
	<c:forEach items="${requestScope.hvo}" var="featureVO">
		<p class="card-text" style="font-size: 2.0rem;">취미 선호도 조사</p>
	</c:forEach>	
		<input type="button" id="startBtn" value="시작"> 			
	</div>
</div>
<div id="progressPage"class="card" style="display:none">
	<div class="card-body" style="padding: 10rem;">
	<c:forEach items="${requestScope.hvo}" var="featureVO">
		나는 <span class="card-text" style="font-size: 2.5rem;" id="feature">gg</span>활동을 좋아한다<br>
	</c:forEach>	
		<a href="#" class="card-link" style="font-size: 2.5rem;"><button onclick="move()" class="btn btn-red">YES</button></a> <a
			href="#" class="card-link" style="font-size: 2.5rem;"><button onclick="move()" class="btn btn-red">NO</button></a>
	</div>
	
	<div id="myProgress">
		<div id="myBar">5%</div>
	</div>
</div>
<div id="endPage"class="card"style="display:none">
	<h2 style="font-weight: bolder; font-size: 3.5rem;">취미찾기 완료</h2>
	<div class="card-body" style="padding: 10rem;">
		<button onclick="location.href='${pageContext.request.contextPath}/findHobbyResult.do'" >결과보러가기</button>
		 			
	</div>
</div>	
</div> --%>