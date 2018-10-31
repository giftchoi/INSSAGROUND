<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
 form{
 display:inline
 }

 pre {
    margin-top: 1rem;
    margin-bottom: 1rem;
}
</style>
<script type="text/javascript">
			$(document).ready(function() {
				$("#deleteCustomGameForm").submit(function() {
					return confirm("사용자 정의 게임을 삭제하시겠습니까?")	
				});
				$("#customGameUpdateForm").submit(function() {
					return confirm("사용자 정의 게임을 수정하시겠습니까?")
				});
			});
			
			function recommend(){

				if(confirm("해당 게임을 추천하시겠습니까?")){
				$.ajax({
						url: "${pageContext.request.contextPath}/insertRecommendation.do",
						type: "post",
						data: $("#insertRecommendation").serialize(),
						beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function(result){
							var count =$("#countSpan").text();
							if(count==result){
								alert("이미 추천한 게임입니다");
							}else{
								alert("해당 게임이 추천되었습니다");
								$("#countSpan").text(result);
							}
						}
					}); 
					
				}
			}
		</script>
	<c:choose>
		<c:when test="${requestScope.gameType eq 'custom'}">

<!-- 사용자게임 폼 -->
<div class="col-sm-8 offset-2">
<table class="table simpleTable">
  <thead>
    <tr>
      <th colspan="3">${requestScope.gvo.title }</th>
    </tr>
   <tr>
      <th>${requestScope.gvo.memberVO.id }</th>
      <th>　　　　　　　　　　　　　　</th>
      <th align="right" style="font-weight: bolder;">${requestScope.gvo.memberVO.name }</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>인원</td>
      <td colspan="2">${requestScope.gvo.minPersonnel } ~
							${requestScope.gvo.maxPersonnel } 명</td>
    </tr>
    <tr>
      <td>게임시간</td>
      <td colspan="2">${requestScope.gvo.gameTime } 분</td>
    </tr>
    <tr>
      <td>준비물</td>
      <td colspan="2">${requestScope.gvo.materials }</td>
    </tr>

				<c:choose>
					<c:when test="${requestScope.gvo.cgNo eq 1 }">
						<tr>
							<td>분류</td>
							<td colspan="2">실내 게임</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>분류</td>
							<td colspan="2">실외 게임</td>
						</tr>
					</c:otherwise>
				</c:choose>

    <tr>
	<td colspan="3">
		<pre>${requestScope.gvo.content}</pre>
    </td>
	</tr>
    <tr>
      <td>
    <%--   
      <button class="btn btn-default btn-lg" form="insertRecommendation" id="thumbBtn">
      <span class="glyphicon glyphicon-thumbs-up"></span> ${requestScope.gvo.recommendation }
      </button>
       --%>
      <form method="post" id="insertRecommendation">
      <sec:csrfInput/>
      <input type="hidden" name="cGameNo" value="${requestScope.gvo.cGameNo}">    
      <a href="javascript:void(0);" onclick="recommend();"><span class="glyphicon glyphicon-thumbs-up"></span></a>&nbsp;&nbsp;<span id="countSpan">${requestScope.count }</span>
      <%-- <input type="button" value="${requestScope.count }"  style="background-color:transparent;  border:0px transparent solid;"> --%>
      </form>
     
      
      </td>
      <td></td>
      <td>
						
				<form action="customGameUpdateForm.do" id="customGameUpdateForm"
					method="post">
					<sec:csrfInput />
					<input type="hidden" name="cGameNo"
						value="${requestScope.gvo.cGameNo}">
						<i class="material-icons button edit">
						<input type="submit" value="edit"  style="background-color:transparent;  border:0px transparent solid;">
						</i>
				</form>
				<form action="deleteCustomGame.do" id="deleteCustomGameForm"
					method="post">
					<sec:csrfInput />
					<input type="hidden" name="cGameNo"
						value="${requestScope.gvo.cGameNo}">
						
						<i class="material-icons button delete">
						<input type="submit" value="delete"  style="background-color:transparent;  border:0px transparent solid;">
						</i>
				</form>
		
        
      </td>
    </tr>
  </tbody>
</table>
	</div>

		</c:when>
		<c:otherwise>


<!-- 공식게임 폼 -->
<div class="col-sm-8 offset-2">
<table class="table simpleTable">
  <thead>
    <tr>
      <th style="font-size:25px;"colspan="2">${requestScope.gvo.title }</th>
    </tr>
  </thead>
  <tbody>
  <tr>
  	<td style="text-align:left;">작성자: 관리자</td>
  </tr>
    <tr>
      <td>인원</td>
      <td style="text-align:left;" >${requestScope.gvo.minPersonnel } ~
							${requestScope.gvo.maxPersonnel } 명</td>
    </tr>
    <tr>
      <td>게임시간</td>
      <td style="text-align:left;" >${requestScope.gvo.gameTime } 분</td>
    </tr>
    <tr>
      <td>준비물</td>
      <td style="text-align:left;">${requestScope.gvo.materials }</td>
    </tr>
<c:choose>
	<c:when test="${requestScope.gvo.cgNo eq 1}">
	<tr>
      <td>분류</td>
      <td style="text-align:left;">실내 게임</td>
    </tr>
	</c:when>
	<c:otherwise>
	<tr>
      <td>분류</td>
      <td style="text-align:left;" colspan="2">실외 게임</td>
    </tr>
    </c:otherwise>
</c:choose>
    

    <tr>
	<td colspan="2">
		<pre style="font-size:20px;">${requestScope.gvo.content}</pre>
    </td>
	</tr>

    <tr>
      <td></td>
      <td>
						
				<form action="officialGameUpdateForm.do" id="officialGameUpdateForm"
					method="post">
					<sec:csrfInput />
					<input type="hidden" name="oGameNo"
						value="${requestScope.gvo.oGameNo}">
						<i class="material-icons button edit">
						<input type="submit" value="edit"  style="background-color:transparent;  border:0px transparent solid;">
						</i>
				</form>
				<form action="deleteOfficialGame.do" id="deleteOfficialGameForm"
					method="post">
					<sec:csrfInput />
					<input type="hidden" name="oGameNo"
						value="${requestScope.gvo.oGameNo}">
						<i class="material-icons button delete">
						<input type="submit" value="delete"  style="background-color:transparent;  border:0px transparent solid;">
						</i>
				</form>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#deleteOfficialGameForm").submit(function() {
					return confirm("공식 게임을 삭제하시겠습니까?")	
				});
				$("#officialGameUpdateForm").submit(function() {
					return confirm("공식 게임을 수정하시겠습니까?")
				});
				
			});
		</script>
        
      </td>
    </tr>
  </tbody>
</table>
	</div>

		</c:otherwise>
	</c:choose>
