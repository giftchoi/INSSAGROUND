<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sido").change(function() {
			$.ajax({
				type:"get",
				url:"getSigungu.do",
				data:"sido="+$("#sido").val(),
				success:function(result){
					var sigungu = "<option>------</option>"
					for(var i=0;i<result.length;i++){
						sigungu += "<option value="+result[i].sigunguNo+">"+result[i].sigunguName+"</option>";
					}
					$("#sigungu").html(sigungu);
				}
			});// ajax
		});//change
		$("#hobbyCategoryNo").change(function() {
			$.ajax({
				type:"get",
				url:"findHobbyByHobbyCategoryNo.do",
				data:"hobbyCategoryNo="+$("#hobbyCategoryNo").val(),
				success:function(result){
					var hobby = "<option>------</option>"
					for(var i=0;i<result.length;i++){
						hobby += "<option value="+result[i].hobbyNo+">"+result[i].name+"</option>";
					}
					$("#hobby").html(hobby);
				}
			});// ajax
		});//change
		$("#hash").click(function() {
			var hh = $("#hashtag").text();
			var hashtag = "#";
			hashtag += $("#ht").val();
			$("#ht").val("");
			if(hh != ""){
				$("#hashtag").text(hh+hashtag);
			}else{
				$("#hashtag").text(hashtag);				
			}
		});//click
	}); //ready
</script>
<div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">모임 개설 신청</h1>
			<form action="groundApply.do" method="post">
				<sec:csrfInput/>
				<!-- <div class="input-container">
					<span id="profile-img"></span>
				</div> -->
				<div class="input-container">
					모임명<br>
					<input type="text"  name="groundName" maxlength="30" required="required" />
				</div>
				<div class="input-container">
					지역 
					<select name="sido"  id="sido">
						<option>-------</option>
						<c:forEach items="${sido}" var="sido">
						<option value="${sido.sidoNo}">${sido.sido}</option>
						</c:forEach>
					</select>		
							
					<select name="sigunguNo" id="sigungu">
													
					</select>
				</div>
				<div class="input-container">
						주요 취미
					<select name="hobbyCategoryNo" id="hobbyCategoryNo" >
							<option>-------</option>
					<c:forEach items="${hobbyCategory}" var="hobbyCategory">
						<option value="${hobbyCategory.hobbyCategoryNo}">${hobbyCategory.category}</option>
					</c:forEach>
					</select>		
							
					<select name="hobbyNo" id="hobby">
					
					</select>
				</div>
				
				<div class="input-container">
					최대인원 <input type="number" name="maxPersonnel">
				</div>

				<div class="input-container">
					모임 소개<br>
					<textarea name="introduction" rows="10" cols="70"></textarea>
				</div>
				
				<div class="input-container">
					해시태그
					<input type="hashtag"  name="" id="ht">
					<input type="button"  value="넣기" id="hash">
					<span id="hashtag"  class="hashtag"></span>
				</div>
				
				<div>
					<input type="submit"  value="개설 신청"><br>
				</div>
			</form>
		</div>
	</div>
</div>