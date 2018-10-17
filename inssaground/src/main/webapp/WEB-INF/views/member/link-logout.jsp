<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function move_url(){
			document.logoutForm.submit();
		}
</script>
</head>
<body onload="move_url()">
<form name="logoutForm"
		action="${pageContext.request.contextPath}/logout.do" method="post"
		style="display: none">
		<sec:csrfInput />
</form>	
</body>
</html>