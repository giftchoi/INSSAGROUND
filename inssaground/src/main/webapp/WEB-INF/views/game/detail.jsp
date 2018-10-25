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
	<c:choose>
		<c:when test="${requestScope.gameType eq 'custom'}">

<!-- 사용자게임 폼 -->
<table class="myTable simpleTable">
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
      <button type="button" class="btn btn-default btn-lg">
          <span class="glyphicon glyphicon-thumbs-up"></span> ${requestScope.gvo.recommendation }
       </button>
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
		<script type="text/javascript">
			$(document).ready(function() {
				$("#deleteCustomGameForm").submit(function() {
					return confirm("사용자 정의 게임을 삭제하시겠습니까?")	
				});
				$("#customGameUpdateForm").submit(function() {
					return confirm("사용자 정의 게임을 수정하시겠습니까?")
				});
			});
		</script>
        
      </td>
    </tr>
  </tbody>
</table>


		</c:when>
		<c:otherwise>


<!-- 공식게임 폼 -->
<table class="myTable">
  <thead>
    <tr>
      <th colspan="3">${requestScope.gvo.title }</th>
    </tr>
   <tr>
      <th></th>
      <th>　　　　　　　　　　　　　　</th>
      <th  style="font-weight: bolder;">관리자</th>
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
	<c:when test="${requestScope.gvo.cgNo eq 1}">
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
      <td></td>
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


		</c:otherwise>
	</c:choose>