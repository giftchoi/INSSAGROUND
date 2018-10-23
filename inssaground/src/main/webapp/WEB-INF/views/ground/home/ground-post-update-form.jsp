<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
 
<script>
	
	$(document).ready(function() {
		
		$('#summernote').summernote({
			placeholder : '게시글 내용을 입력해주세요',
			lang : 'ko-KR',
			height : 400,
			width : 800,
			disableDragAndDrop : true,
			callbacks : {
				onImageUpload : function(files) {
					for(var i=0;i<files.length;i++){
						sendFiles(files[i],this);
						
					}
						
					
				},
				onMediaDelete : function($target, editor, $editable){
					var src = $target.attr("src");
					var index = src.lastIndexOf("/");
					var value  = src.substr(index+1);
					$("#postForm").find(":input[value='"+value+"']").remove();
					//alert(value);
				}
			}
		});
		//$('#summernote').summernote('justifyLeft');
		//$('#summernote').summernote('code', ${postVO.content});
		//alert("${postVO.content}");
		
		$("#updateBtn").click(function() {
			var markupStr = $('#summernote').summernote('code');
			$("#postForm").find(":input[name=content]").val(markupStr);
			//alert(	$("#postForm").find(":input[type=hidden]").val());
			$("#postForm").submit();

		});//click
	});

	function sendFiles(file, el) {
		var form = new FormData();
		form.append("picture", file);
		$.ajax({
			data : form,
			type : "post",
			url : "${pageContext.request.contextPath}/groundPostImgUpload.do",
			cache : false,
			contentType : false,
			processData : false,
			beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(data) { // 처리가 성공할 경우
				var imgNode = document.createElement("IMG");
				$(imgNode).prop(
						"src",
						"${pageContext.request.contextPath}/resources/image/"
								+ data);
				$(imgNode).css("width", "300px");
				$(imgNode).css("height", "300px");
				$(el).summernote('insertNode', imgNode);
				$("#postForm").append('<input type="hidden" name="pictureList" value="'+data+'">');
			}
		});
	}
</script>
<h3>게시글 작성</h3>
<br>
<form id="postForm" action="groundPostUpdate.do" method="post">
	<sec:csrfInput />
	<table>
		<tbody>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" required="required"
					size="50" maxlength="50" value="${postVO.title }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="summernote">${postVO.content }</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input id="updateBtn" type="button"
					value="수정"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="content" required="required">
	<input type="hidden"	name = "postNo" value="${postVO.postNo}">
	<c:forEach items="${postVO.pictureList }" var="pic">
		<input type="hidden" name="pictureList" value="${pic }">
	</c:forEach>
</form>