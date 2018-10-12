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
  <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <!-- css for register form -->
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
		<tiles:insertAttribute name="main"></tiles:insertAttribute>
	</div>
	<div class="row footer">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>

   </div>
</body>
</html>