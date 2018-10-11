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
<div class="container">
  <div class="card"></div>
  <div class="card">
    <h1 class="title">회원가입</h1>
    <form>
      <div class="input-container">
      아이디<input type="text" required="required"/>
        <div class="bar"></div>
      </div>
      <div class="input-container">
     패스워드<input type="text" required="required"/>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        이름<input type="text" required="required"/>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        이메일<input type="text" required="required"/>
        <div class="bar"></div>
      </div><div class="rerun"><a href="">Rerun Pen</a></div>
      <div class="button-container">
        <button><span>회원가입</span></button>
      </div>
      <div class="footer"><a href="">이미 회원이신가요?</a></div>
    </form>
  </div>
</div>
</body>
</html>