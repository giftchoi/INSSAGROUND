<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";
		var checkEmailOK=false;
		$("#regBtn").submit(function(){			
			if($("#regForm :input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=password]").val().trim()==""){
				alert("패스워드를 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=name]").val().trim()==""){
				alert("이름을 입력하세요");				
				return false;
			}
			if($("#regForm :input[name=email]").val().trim()==""){
				alert("이메일을 입력하세요");				
				return false;
			}	
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}
			if(checkEmailOK==false){
				alert("이메일 인증을 완료하세요");
				return false;
			}
		}); // submit
		$("#regForm :input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("id는 4자이상 10자 이하").css(
						"color","red");
				checkResultId="";
				return;
			}
			// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",				
				data:"id="+id,	
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("color","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"color","blue");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
		
		$("#regForm :input[name=passwordOk]").keyup(function() {
			var pw=$("#regForm :input[name=password]").val().trim();
			var pwCheck=$(this).val().trim();
			if(pw==pwCheck){
				$("#pwCheckView").html("비밀번호 일치").css("color","blue");
			}else{
				$("#pwCheckView").html("비밀번호 불일치").css("color","red");
			}
		});//keyup
		
		$("#sendEmail").click(function(){
			var email=$("#regForm :input[name=email]").val().trim();
			if(email==""){
				alert("이메일을 입력하세요");				
				return;
			}else{
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/sendEmailAjax.do",				
					data:"email="+email,	
					success:function(){					
						var input="<input style='border: 1px solid #f1f1f1;'type='text' name='inputKey' id='inputKey'>&nbsp;<a id='checkKeyBtn'class='btn btn-grey'>인증번호 확인</a>";
						$("#sendEmailKey").html(input); 
					}//callback			
				});
			}
		}); // click
		$("#sendEmailKey").on("click","#checkKeyBtn",function(){
			var inputKey =$("#checkKeyBtn").prev().val();
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/checkEmailKey.do",				
				data:"inputKey="+inputKey+"&email="+$("#sendEmailKey").prev().val(),	
				success:function(data){	
					if(data=="fail"){
						alert("인증번호가 일치하지 않습니다.");
						inputKey="";
						}else{						
							$("#sendEmailKey").html("인증 완료").css("color","blue");	
							checkEmailOK=true;
						}			
				}//callback			
			});
		}); // on
	});//ready
</script>
<div class="col-sm-12 main-content">
	<div class="card-container wide">
		<div class="form-card">
			<h1 class="title">회원가입</h1>
			<form method="post" action="registerMember.do" id="regForm" enctype="multipart/form-data">
				<sec:csrfInput/>
				<div class="input-container">
					프로필 사진<input type="file" name="picture" required="required">
				</div>
				<div class="input-container">
					아이디<br>
					<input type="text"  maxlength="30" required="required" name="id" id="memberId"/>
					<span class="right-space" id="idCheckView"></span>
				</div>
				<div class="input-container">
					이름<br>
					<input type="text" maxlength="15" required="required" name="name"/>
					<span class="right-space"id=""></span>					
				</div>
				<div class="input-container">
					패스워드<br>
					<input type="password" maxlength="30" required="required" name="password"/>
					<span class="right-space" id=""></span>
				</div>
				<div class="input-container">
					패스워드 확인<br>
					<input type="password"maxlength="30"  required="required" name="passwordOk"/>
					<span class="right-space" id="pwCheckView"></span>
				</div>
				<div class="input-container">
					이메일<br>
					<input style="size:50px;width:70%;"type="email" maxlength="30" required="required" name="email"/> 
					<span class="right-space" id="sendEmailKey">
					<!-- 	<input type="button" id="sendEmail" class="btn btn-grey" value="인증번호 받기"> -->
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="sendEmail" class="btn btn-grey">인증번호 받기</a>
					</span>
				</div>
				<div>
				<input type="submit" class="btn btn-red" value="회원가입" id="regBtn"><br>
				</div>
			</form>
		</div>
	</div>
</div>
