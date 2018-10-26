<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/animate/animate.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/vendor/noui/nouislider.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/css/util.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/game/write/css/main.css">
<!--===============================================================================================-->



<div class="container-contact100">
   <div class="wrap-contact100">
      <form class="contact100-form" action="${pageContext.request.contextPath}/writeOfficialGame.do" method="post" id="write_form">
         <sec:csrfInput/>
         <span class="contact100-form-title" style="font-size: x-large; font-weight: bolder;">공식 게임 작성하기</span>

         <div class="wrap-input100 bg1">
            <span class="label-input100" style="font-size: medium;">제목</span> <input
               class="input100" type="text" name="title" required="required"
               placeholder="제목을 입력하세요">
         </div>

         <div class="wrap-input100 bg1">
            <span class="label-input100" style="font-size: medium;">준비물</span> <input
               class="input100" type="text" name="materials" required="required"
               placeholder="준비물을 입력하세요">
         </div>
         
         <div class="wrap-input100 bg1">
            <span class="label-input100" style="font-size: medium;">게임시간</span> <input
               class="input100" type="number" name="gameTime" required="required"
               placeholder="게임시간을 입력하세요">
         </div>
         
         <div class="wrap-input100 bg1 rs1-wrap-input100">
            <span class="label-input100" style="font-size: medium;">최소인원</span> <input class="input100"
               type="number" name="minPersonnel" required="required" >
         </div>

         <div class="wrap-input100 bg1 rs1-wrap-input100">
            <span class="label-input100" style="font-size: medium;">최대인원</span> <input class="input100"
               type="number" name="maxPersonnel" required="required">
         </div>

            <div class="wrap-contact100-form-radio">
               <span class="label-input100" style="font-size: large;">장소구분</span>

               <div class="contact100-form-radio m-t-15">
                  <input class="input-radio100" id="radio1" type="radio"
                     name="cgNo" value="1" checked="checked">
                  <label class="label-radio100" for="radio1">실내 </label>
               </div>

               <div class="contact100-form-radio">
                  <input class="input-radio100" id="radio2" type="radio"
                     name="cgNo" value="2">
                  <label class="label-radio100" for="radio2">실외 </label>
               </div>
            </div>


         <div class="wrap-input100 bg0 rs1-alert-validate">
            <span class="label-input100" style="font-size: medium;">게임 내용</span>
            <textarea class="input100" name="content" required="required"
               placeholder="게임 내용을 입력해주세요"></textarea>
         </div>

         <div class="container-contact100-form-btn">
            <button class="contact100-form-btn">
               <span> 등록하기 <i class="fa fa-long-arrow-right m-l-7"
                  aria-hidden="true"></i>
               </span>
            </button>
         </div>
      </form>
   </div>
</div>



<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/bootstrap/js/popper.js"></script>
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/bootstrap/js/bootstrap.min.js"></script>

<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/daterangepicker/moment.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/vendor/countdowntime/countdowntime.js"></script>

<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath }/resources/css/game/write/js/main.js"></script>
