<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-sm-8 offset-2">
	<table class="table simpleTable" style="border:none;">
		<thead>
				<tr >
			<th>${groundVO.groundName}</th>
			<th style="text-align:right;"><input type="button"
							class="btn btn-white" value="목록"  onclick="location.href='readyApplyGround.do'"></th>
		</tr>
		</thead>	
		<tbody>
			<tr class="center">
				<td rowspan="2"><img
					src="${pageContext.request.contextPath}/resources/uploadImage/${groundVO.groundImgVO.imgName}"
					width="300" height="300"></td>
					<td >
					<div class="row ground-detail-info">
						<div class="col-sm-12">
							지역 : <span class="info-span">${groundVO.area}</span><br> 최대
							인원 : <span class="info-span">${groundVO.maxPersonnel}</span><br>
							취미 : <span class="info-span">${groundVO.hobby}</span><br>
							모임장 : <span class="info-span">${groundVO.master}</span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="row ground-detail-hashtag">
						<div class="col-sm-12">
							<c:forEach items="${groundVO.tagList}" var="tag">
								<span class="hashtag">#${tag} </span>
							</c:forEach>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
								<pre>${groundVO.introduction}</pre>
				</td>
			</tr>
						<tr>
				<td colspan="2">
										<form action="acceptGroundApply.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
		<input type="hidden" name="master" value="${groundVO.master}">
		<input class="btn btn-red" id="acceptBtn" type="submit" value="승인">
		</form>
		<form action="rejectGroundApply.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
		<input class="btn btn-red" id="rejectBtn" type="submit" value="거절">
		</form>				</td>
			</tr>
		</tbody>

	</table>
</div>





<%-- <div>
	<div class="row ground-detail-content">
		<div class="col-sm-4">
			<img
				src="${pageContext.request.contextPath}/resources/uploadImage/${groundVO.groundImgVO.imgName}"
				width="300" height="300">
		</div>
		<div class="col-sm-8">
			<div class="row ground-detail-title">
				<div class="col-sm-12">
					<h3>${groundVO.groundName}</h3>
				</div>
			</div>
			<div class="row ground-detail-info">
				<div class="col-sm-12">
					지역 :<span class="info-span"> ${groundVO.area}</span>
					최대 인원 :<span class="info-span"> ${groundVO.maxPersonnel}</span><br>
					취미 :<span class="info-span"> ${groundVO.hobby}</span><br>
					모임장 :<span class="info-span"> ${groundVO.master}</span>
				</div>
			</div>
			<br><br><br><br>
			<div class="row ground-detail-hashtag">
				<div class="col-sm-12">
					<c:forEach items="${groundVO.tagList}" var="tag">
					<span class="hashtag">#${tag} </span> 
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<pre>
				${groundVO.introduction}
			</pre>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12 btnArea">
		<table><tbody><tr><td>
		<form action="acceptGroundApply.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
		<input type="hidden" name="master" value="${groundVO.master}">
		<input class="btn btn-red" id="acceptBtn" type="submit" value="승인">
		</form></td><td>
		<form action="rejectGroundApply.do" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
		<input class="btn btn-red" id="rejectBtn" type="submit" value="거절">
		</form>
		</td></tr>
			</tbody></table>
		</div>
	</div>
</div> --%>
