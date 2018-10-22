<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles framework 선언부 --%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>
     <tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
 </title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR" rel="stylesheet">
 
  <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- css for register form -->
  
  <!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->


		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/linearicons.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">				
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css">							
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css">				
			<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"> --%>
  
<style type="text/css">

/* 	.footer{
		background-color:black;
		border-bottom:1px solid #dddddd;
		box-shadow:3px 4px 5px 0 #ececec;
		height:100px;
	} */
</style>
</head>
<body>
<div id="container">
	<div class="row header">
		<!-- Tiles header 영역 -->
   		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	<div class="row main">
	<div class="col-sm-2">
		<tiles:insertAttribute name="left"></tiles:insertAttribute>
	</div>
	<div class="col-sm-7">
		<tiles:insertAttribute name="main"></tiles:insertAttribute>
	</div>
		<div class="col-sm-3">
		<tiles:insertAttribute name="right"></tiles:insertAttribute>
	</div>
	</div>
	<div class="row footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
	
   </div>
</body>
</html>