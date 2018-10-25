<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function(){	
	
		
		$("#participateBtn").click(function(){
			//window.close();
			//window.open("home.do");
			//window.top.close();
/* 			window.open('','_self','');
			window.close(); */
			if(confirm("해당 모임에 참여 신청하시겠습니까?")){
				location.href="javascript:participate()";
			}

				//"participateGround.do?groundNo="+${groundVO.groundNo};
			//self.close();
		});//click
		$("#anonyPartBtn").click(function(){
			alert("로그인 후 이용가능합니다.");
			location.href="loginForm.do";
		});
	});	
	function participate(){
		$("#participateForm").submit();
	}
	function copyLink(gno){
		$("#hiddenDiv").show();
		$("#link").select();
		document.execCommand("copy");
		$("#hiddenDiv").hide();
	}
</script>
<div>
	<div class="row ground-bg-area">
		<div class="col-sm-12">
			<img
				src="${pageContext.request.contextPath}/resources/uploadImage/${requestScope.groundVO.groundImgVO.imgName}"
				width="100%" height="350">
		</div>
	</div>
	<div class="row ground-detail-content">
		<div class="col-sm-10 offset-1">
			<div class="row ground-detail-title">
				<div class="col-sm-12">
					<h3>${groundVO.groundName }</h3>
				</div>
			</div>
			<div class="row ground-detail-info">
				<div class="col-sm-12">
					<span class="info-span"><i class="fa fa-map-marker "></i>${groundVO.area }</span> <span
						class="info-span"><i class="fa fa-users"></i>${groundVO.participants}/${groundVO.maxPersonnel }명</span>
					<span class="info-span"><i class="fa fa-puzzle-piece"></i>${groundVO.hobby}</span>
				</div>
			</div>
			<div class="row ground-detail-hashtag">
				<div class="col-sm-12">
				<c:forEach items="${groundVO.tagList}" var="tag">
					<span class="hashtag">#${tag}</span>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 offset-9">
			<div id="hiddenDiv" style="display:none;">
				<input type="text" id="link" value="http://localhost:8888/inssaground/shome.do?groundNo=${groundVO.groundNo }">
			</div><br>
			<a id="kakao-link-btn" href="javascript:sendLink(${groundVO.groundNo})">
<img style="padding-bottom:10px; height:50px;" src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>&nbsp;&nbsp;&nbsp;<a style="padding-top:2px;color:black;" href="javascript:copyLink(${groundVO.groundNo})"><i class="fa fa-copy fa-3x"></i></a>
<script type='text/javascript'>

  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d62c1dc1956031902d088498c469f737');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink(gno) {
    	
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: '${groundVO.groundName}',
          description:'#${groundVO.hobby}',
          imageUrl: 'http://localhost:8888/inssaground/resources/uploadImage/${requestScope.groundVO.groundImgVO.imgName}',
          link: {
            webUrl: 'http://localhost:8888/inssaground/shome.do?groundNo='+gno
          }
        },
        social: {
          sharedCount: ${groundVO.participants}/${groundVO.maxPersonnel}명
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              webUrl: 'http://localhost:8888/inssaground/shome.do?groundNo='+gno
            }
          }
        ],
        serverCallbackArgs: '{"groundNo":"${groundVO.groundNo}"}' // 콜백 파라미터 설정
      });
    }
  //]]>
</script>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<pre>
				<h3>${groundVO.introduction }</h3>
			</pre>
		</div>

	</div>
	<div class="row">
		<div class="col-sm-12 btnArea">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication var="principal" property="principal" />
			<c:set var="isInssa" value="false" />
			<c:forEach items="${principal.groundNoList}" var="ground">
				<c:if test="${not isInssa }">
					<c:if test="${ground.GROUNDNO eq groundVO.groundNo }">
						<c:choose>
							<c:when test="${ground.STATUS eq 0}">
								<input class="btn btn-grey" type="button" value="참여 대기중">
							</c:when>
							<c:when test="${ground.STATUS eq 1}">
								<a class="btn btn-red"  href="ground-home.do?groundNo=${groundVO.groundNo}">모임 홈페이지</a>
							</c:when>
							<c:when test="${ground.STATUS eq 2}">
								<input class="btn btn-white" type="button" value="참여거절" disabled="disabled">
							</c:when>
							<c:when test="${ground.STATUS eq 3} ">
								<input class="btn btn-white" type="button" value="탈퇴완료" disabled="disabled">
							</c:when>
						</c:choose>
						<%-- <c:if test="${ground.STATUS eq 1}">
							<a class="btn btn-red"  href="ground-home.do?groundNo=${groundVO.groundNo}">모임 홈페이지</a>
						</c:if>
						< --%>
						<%-- 
						<c:if test="${ground.STATUS eq 0} ">
							<input class="btn btn-grey" type="button" value="참여 대기중">
						</c:if>
						
						<c:if test="${ground.STATUS eq 3} ">
							<input class="btn btn-white" type="button" value="탈퇴완료" disabled="disabled">
						</c:if>
						
						<c:if test="${ground.STATUS eq 2} ">
							<input class="btn btn-white" type="button" value="참여거절" disabled="disabled">
						</c:if>
 --%>
						<c:set var="isInssa" value="true"/>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${not isInssa}">
				<c:choose>
					<c:when test="${groundVO.participants< groundVO.maxPersonnel }">
						<input class="btn btn-red" id="participateBtn" type="button" value="참여신청">
					</c:when>
					<c:otherwise>
						<input class="btn" id="" type="button" value="정원초과" disabled="disabled">
					</c:otherwise>
				</c:choose>

			</c:if>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<input class="btn btn-red" id="anonyPartBtn"type="button" value="참여신청">
			</sec:authorize>
		</div>
	</div>
</div>
<form id="participateForm"method="post" action="participateGround.do">
	<sec:csrfInput/>
	<input type="hidden" name="groundNo" value="${groundVO.groundNo}">
</form>