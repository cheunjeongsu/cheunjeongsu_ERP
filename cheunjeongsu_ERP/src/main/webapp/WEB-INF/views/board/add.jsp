<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//파일 추가 버튼을 클릭했을때
		$('#btnFileAdd').click(function(e) {
			e.preventDefault(); //기본이벤트 제거
			$('#filelist').append('<li><input type="file" name="files" class="files"><button class="btnFileRemove">삭제</button></li>');
			
		});
		
		//파일삭제버튼을 클릭했을때
		//동적으로 생성된 버튼에 이벤트 달기
		$('#filelist').on('click','.btnFileRemove', function(e) {
			e.preventDefault();
			$(this).parent().remove();
	
		
		//저장버튼 클릭했을 때
		$('#btnSave').click(function(e){
			e.preventDefault();
			if ($('#userid').val() ==''){
				alert('로그인을 해주세요!');
			}else if ($('#subject').val() ==''){
				alert('제목을 입력해 주세요');
				$('#subject').focus();
			}else if ($('#content').val() ==''){
				alert('내용을 입력해 주세요');
				$('#content').focus();
			}else{
				$('#frmBoardAdd').submit();
			}
			
		});
		
		
		
		});
	});
	
	


</script>


</head>
<body>
<%-- <%@ include file="../home/header.jsp" %> --%>
	<h2>게시물 등록</h2>
	<form id="frmBoardAdd" action="${path}/board/add" method="post" enctype="multipart/form-data" >
		<table border = "1">
			<tr>
				<th>작성자ID</th>
				<td><input type="text" name="userid" id="userid" readonly value="bulgom"></td>			
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject"></td> 			
			</tr>
				
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="20" name="content" id="content"></textarea></td>
			</tr>
			
			<tr>
				<th>파일</th>
				<td>
					<div><button id="btnFileAdd">파일추가</button></div>
					<div id="filelist">
						<li><input type="file" name="files" class="files"><button class="btnFileRemove">삭제</button></li>
					</div>
					
				</td>			
			</tr>		
			<tr>
				<td colspan="2" align="center">
					<button id ="btnSave">저장</button>
					<button type="reset">취소</button>
				</td>
			
			</tr>
		</table>
	
	</form>
	

</body>
</html>