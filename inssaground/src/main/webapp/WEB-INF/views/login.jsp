<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/resources/register.css" >
<title>Insert title here</title>
</head>
<body>
<!-- <div class="pen-title">
  <h1>로그인</h1>
</div> -->

<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">Login</h1>
    <form>
      <div class="input-container">
        아이디<input type="text" required="required"/>
        <div class="bar"></div>
      </div>
      <div class="input-container">
       패스워드 <input type="password" required="required"/>
        <div class="bar"></div>
      </div>
      <div class="button-container">
        <button><span>로그인</span></button>
      </div>
      <div class="footer"><a href="#">JOIN US</a></div>
      <div class="footer"><a href="#">Forgot your id?</a></div>
       <div class="footer"><a href="#">Forgot your password?</a></div>
    </form>
  </div>
</div>
</body>
</html>