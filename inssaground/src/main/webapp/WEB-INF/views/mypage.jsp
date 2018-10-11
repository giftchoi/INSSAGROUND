<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/mypage.css" >
<%-- <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/button.css" > --%>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$(".btn-pref .btn").click(function () {
	    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	    // $(".tab").addClass("active"); // instead of this do the below 
	    $(this).removeClass("btn-default").addClass("btn-primary");   
	});
	});
</script>
<div class="col-lg-12 col-sm-12">
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" alt="" src="">
        </div>
        <div class="useravatar">
            <img alt="" src="http://lorempixel.com/100/100/people/9/">
        </div>
        <div class="card-info"> <span class="card-title">회원 이름</span>
        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                <div class="hidden-xs">나의 Ground 보기</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                <div class="hidden-xs">나의 일정 보기</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">나의 프로그램 보기</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">내 정보 수정</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <div class="hidden-xs">탈퇴</div>
            </button>
        </div>
    </div>
        <div class="well">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
          <h3>This is tab 1</h3>
        </div>
        <div class="tab-pane fade in" id="tab2">
          <h3>This is tab 2</h3>
        </div>
        <div class="tab-pane fade in" id="tab3">
          <h3>This is tab 3</h3>
        </div>
      </div>
    </div>
    
    </div>
            
<!--     <div class="container">
	<div class="row">
        <div class="col-lg-3">
            <p><a href="#" class="btn btn-outlined btn-primary">Demo Primary Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-success">Demo Success Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-info">Demo Info Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-warning">Demo Warning Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-danger">Demo Danger Button</a></p>
        </div>
        <div class="col-lg-4">
            <p><a href="#" class="btn btn-outlined btn-block btn-primary">Demo Block Primary Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-block btn-success">Demo Block Success Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-block btn-info">Demo Block Info Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-block btn-warning">Demo Block Warning Button</a></p>
            <p><a href="#" class="btn btn-outlined btn-block btn-danger">Demo Block Danger Button</a></p>
        </div>
	</div>
</div> -->
</body>
</html>