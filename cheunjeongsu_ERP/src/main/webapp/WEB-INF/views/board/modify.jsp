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
		//파일추가 버튼을 클릭했을때
		$('#btnFileAdd').click(function(e) {
			e.preventDefault(); //기본이벤트 제거
			$('#filelist').append('<li><input type="file" name="files" class="files"><button class="btnFileRemove">삭제</button></li>');
			
		});
		
		//파일삭제버튼을 클릭했을때
		//동적으로 생성된 버튼에 이벤트 달기
		$('#filelist').on('click','.btnFileRemove', function(e) {
			e.preventDefault();
			alert('삭제');
			$(this).parent().remove();
		});
		
		//수정버튼을 클릭했들때
		$('#btnUpdate').click(function(e) {
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
				$('#frmBoardModify').submit();
			}
			
		});
	});

</script>
</head>
<body>
	<h2>게시물 수정</h2>
	<form id="frmBoardModify" action="${path}/board/modify" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>번호</th>
			<td><input type="text" name="bnum" value="${boardMap.board.BNUM}" readonly> </td>
			<th>작성자</th>
			<td><input type="text" name="userid" value="${boardMap.board.USERID}" readonly></td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="subject" id="subject" value="${boardMap.board.SUBJECT}"> </td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
				<textarea rows="5" cols="20" name="content" id="content" >${boardMap.board.CONTENT}</textarea>
			</td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3">
				<c:forEach var="boardfile" items="${boardMap.bflist}">
					<li>${boardfile.filename}<input type="checkbox" name="fileDelete" value="${boardfile.fnum}">삭제</li>
				</c:forEach>
				<div><button id="btnFileAdd">파일추가</button> </div>
				<ol id="filelist">
					<li><input type="file" name="files" class="files"><button class="btnFileRemove">삭제</button></li>
				</ol>				
			</td>
		</tr>
		<tr>
			<td>등록일자</td>
			<td colspan="3"><fmt:formatDate value="${boardMap.board.REGDATE}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		</tr>
		<tr>
			<td>수정일자</td>
			<td colspan="3"><fmt:formatDate value="${boardMap.board.MODIFYDATE}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button id ="btnUpdate">수정</button>
			</td>
		</tr>
	</table>
	
</form>

</body>
</html>