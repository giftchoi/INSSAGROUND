<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		$("#postBtn").click(function(){
			location.href="groundPostRegisterForm.do";
		});
	});
</script>
<h3>자유 게시판</h3>
<table class="myTable">
	<tr>
		<td colspan="3" style="text-align:right"><i id="postBtn"class="material-icons button edit">글쓰기</i></td>
	</tr>
			<tr>
			<th>글 제목</th><th>등록일시</th>
		</tr>
	<c:forEach items="${requestScope.listVO.list}" var="post" >
	<tr>
		<td><a href="groundPostDetail.do?postNo=${post.postNo }">${post.title }</a></td><td>${post.timePosted }</td>
	</tr>
	</c:forEach>
</table>