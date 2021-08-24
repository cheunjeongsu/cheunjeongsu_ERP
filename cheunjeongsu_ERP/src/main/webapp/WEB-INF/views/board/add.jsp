<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 게시판 -->
  <title>Photosen &mdash; Colorlib Website Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/my/resources/fonts/icomoon/style.css">

  <link rel="stylesheet" href="/my/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/my/resources/css/magnific-popup.css">
  <link rel="stylesheet" href="/my/resources/css/jquery-ui.css">
  <link rel="stylesheet" href="/my/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/my/resources/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="/my/resources/css/lightgallery.min.css">    

  <link rel="stylesheet" href="/my/resources/css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="/my/resources/fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="/my/resources/css/swiper.css">

  <link rel="stylesheet" href="/my/resources/css/aos.css">

  <link rel="stylesheet" href="/my/resources/css/style.css">
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
		
		//취소 버튼 클릭 했을 때
		$('#btnBack').click(function(e){
			e.preventDefault();
			location.href ='${path}/board/list';	
		});
	});
	
	


</script>


</head>
<body>

	<%@ include file="../home/header.jsp" %>
<%-- <%@ include file="../home/header.jsp" %> --%>
	<div align="center">
	<h2>게시물 등록</h2>
	<form id="frmBoardAdd" action="${path}/board/add" method="post" enctype="multipart/form-data" >
		<table border = "1">
			<tr>
				<th>작성자ID</th>
				<td><input type="text" name="userid" id="userid" readonly value="${sessionScope.userid}"></td>			
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
					<button id ="btnBack">취소</button>
				</td>
			
			</tr>
		</table>	
	</form>
	</div>
	
 
  

  <script src="/my/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/my/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/my/resources/js/jquery-ui.js"></script>
  <script src="/my/resources/js/popper.min.js"></script>
  <script src="/my/resources/js/bootstrap.min.js"></script>
  <script src="/my/resources/js/owl.carousel.min.js"></script>
  <script src="/my/resources/js/jquery.stellar.min.js"></script>
  <script src="/my/resources/js/jquery.countdown.min.js"></script>
  <script src="/my/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/my/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="/my/resources/js/swiper.min.js"></script>
  <script src="/my/resources/js/aos.js"></script>

  <script src="/my/resources/js/picturefill.min.js"></script>
  <script src="/my/resources/js/lightgallery-all.min.js"></script>
  <script src="/my/resources/js/jquery.mousewheel.min.js"></script>

  <script src="/my/resources/js/main.js"></script>
  
  <script>
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>

</body>
</html>