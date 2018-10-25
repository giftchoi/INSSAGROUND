<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="col-sm-10 offset-1">
<table class="table simpleTable">
	<thead>
		<tr>
					<th style="font-size:25px;">${scheduleDetail.title}</th><th style="text-align:right;"><input type="button"
							class="btn btn-white" value="목록" onclick="location.href='groundScheduleList.do"></th>
		</tr>
	</thead>
	<tbody>
			<tr>
				<td style="text-align:left;">작성자 : ${scheduleDetail.insiderVO.memberVO.id }</td>
			</tr>
			<tr>
				<td style="text-align:left;">최대 정원 : ${scheduleDetail.maxPersonnel }</td>
			</tr>
			<tr>
				<td style="text-align:left;">시작 날짜 : ${scheduleDetail.startDate}   &nbsp;&nbsp;&nbsp;&nbsp;종료 날짜 : ${scheduleDetail.endDate }</td>
				
			</tr>
			<tr>
				<td style="text-align:left;">위치 : ${scheduleDetail.loc }</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="70" name="content" readonly="readonly">${scheduleDetail.content}</textarea> </td>
			</tr>
	</tbody>
</table>
</div>
<div class="col-sm-10 offset-1">

				<div id="map" style="width:90%;height:350px;"></div>
				<div style="margin-right:90px;">
				
				<sec:authentication property="principal" var="principal"/>
<c:choose>
<c:when test="${scheduleDetail.insiderVO.memberVO.id == principal.id}">

<div class="col-sm-12" align="center">
<table>
	<tr>
		<td>
	<form action="deleteGroundSchedule.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
		<input class="btn btn-red" type="submit" value="삭제">
	</form>
		</td>
		<td>
<form action="updateGroundScheduleForm.do">
	<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
	<input class="btn btn-red" type="submit" value="수정">
</form>
		</td>
</tr>
</table>
</div>

</c:when>

<c:otherwise>

			<c:choose>
			<c:when test="${participation==0}">
			
			<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td>
						<form action="scheduleParticipation.do" >
							<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
							<input class="btn btn-red" type="submit" value="참여">
						</form>
					</td>	
			</tr>
			</table>
			</div>
			</c:when>
			<c:otherwise>
			<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td>
						참여 중<br>
					</td>	
			</tr>
			</table>
			</div>
			</c:otherwise>
			</c:choose>
</c:otherwise>
</c:choose> 	
				
				<table>
	<thead>
		<tr>참여한 사람</tr>
	</thead>
	<tbody>
		<tr>
			<td>
		<c:forEach items="${scheduleParticipationMember}" var="list" varStatus="info">
			${info.count}. ${list.id} &nbsp;&nbsp;&nbsp;
		</c:forEach>
		</td>
		</tr>	
	</tbody>
</table>	
				
				
				
				
				
				
</div>
</div>

<div align="center">

</div>	




				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3cc29a99b5ee4b2a2512b8b0c05ea88&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
//
//var aa = Document.getElementById("address").innerHTML;
// 주소로 좌표를 검색합니다
geocoder.addressSearch('${scheduleDetail.loc}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });



        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>				



<!--       ------------------------------------------------------------------           -->
<%-- <div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">일정 상세</h1>
			<!-- <form method="post" action="registergroundschedule.do" id="regForm" enctype="multipart/form-data"> -->
				<sec:csrfInput/>
				<div class="input-container">
					제목<br>
					<input type="text"  maxlength="30"  readonly="readonly" name="title" value="${scheduleDetail.title}"/>
				</div>
				<div class="input-container">
					참여 인원 제한<br>
					<input type="number"  readonly="readonly" name="maxPersonnel" value="${scheduleDetail.maxPersonnel }"/>		
				</div>
				<div class="input-container">
					시작 날짜<br>
					<input type="text"  readonly="readonly" name="startDate" value="${scheduleDetail.startDate}"/>					
				</div>
				<div class="input-container">
					종료 날짜<br>
					<input type="text"  readonly="readonly" name="endDate" value="${scheduleDetail.endDate }"/>					
				</div>
				<div class="input-container">
					위치<br>
					<input type="text"  readonly="readonly" name="endDate" value="${scheduleDetail.loc }"/>					
				</div>
				
				<div class="input-container">
					내용<br>
					<textarea rows="10" cols="70" name="content" readonly="readonly">${scheduleDetail.content}</textarea> 
					
				</div>
				


<div id="map" style="width:100%;height:350px;"></div>
<table>
	<thead>
		<tr>참여 인원 아이디</tr>
	</thead>
	<tbody>
		<tr>
			<td>
		<c:forEach items="${scheduleParticipationMember}" var="list" varStatus="info">
			${info.count}. ${list.id}<br>
		</c:forEach>
		</td>
		</tr>	
	</tbody>
</table>
<sec:authentication property="principal" var="principal"/>
<c:choose>
<c:when test="${scheduleDetail.insiderVO.memberVO.id == principal.id}">

<div class="col-sm-12" align="center">
<table>
	<tr>
		<td>
	<form action="deleteGroundSchedule.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
		<input class="btn btn-red" type="submit" value="삭제">
	</form>
		</td>
		<td>
<form action="updateGroundScheduleForm.do">
	<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
	<input class="btn btn-red" type="submit" value="수정">
</form>
		</td>
</tr>
</table>
</div>

</c:when>

<c:otherwise>

			<c:choose>
			<c:when test="${participation==0}">
			
			<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td>
						<form action="scheduleParticipation.do" >
							<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
							<input class="btn btn-red" type="submit" value="참여">
						</form>
					</td>	
			</tr>
			</table>
			</div>
			</c:when>
			<c:otherwise>
			<div class="col-sm-12" align="center">
			<table>
				<tr>
					<td>
						이미 참여한 스케줄
					</td>	
			</tr>
			</table>
			</div>
			</c:otherwise>
			</c:choose>
</c:otherwise>
</c:choose>

<c:if test="${scheduleDetail.insiderVO.memberVO.id == principal.id}">
<div class="col-sm-12" align="center">
<table>
	<tr>
		<td>
	<form action="deleteGroundSchedule.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
		<input type="submit" value="삭제">
	</form>
		</td>
		<td>
<form action="updateGroundScheduleForm.do">
	<input type="hidden" name="scheduleNo" value="${scheduleDetail.scheduleNo}">
	<input type="submit" value="수정">
</form>
		</td>
</tr>
</table>
</div>
</c:if>
<c:if test="${scheduleDetail.insiderVO.memberVO.id != principal.id}">
<button>참가</button>
<button>불참</button>
</c:if>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3cc29a99b5ee4b2a2512b8b0c05ea88&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
//
//var aa = Document.getElementById("address").innerHTML;
// 주소로 좌표를 검색합니다
geocoder.addressSearch('${scheduleDetail.loc}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });



        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>				
				<div>
				
				</div>
			<!-- </form> -->
		</div>
	</div>
</div> --%>