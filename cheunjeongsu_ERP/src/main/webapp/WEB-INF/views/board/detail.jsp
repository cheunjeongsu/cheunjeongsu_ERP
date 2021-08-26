<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/boarddetail.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
  

</head>
<body onload="stateChange()">
	<%@ include file="../home/header.jsp" %>

    <div class="site-section"  data-aos="fade">
      <div class="container-fluid">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
              <!-- 제목 -->
                <h2 class="site-section-heading text-center">${boardMap.board.subject}</h2>
              </div>
            </div>
          </div>

        </div>
        
       <!--  이미지 -->
        <div class="row mb-5">
       	 <div class="col-md-7">
       		<c:forEach var="boardfile" items="${boardMap.bflist}">
				<a><img src="${path}/uploadimg/${boardfile.filename}" alt="Images" class="img-fluid"></a>
			</c:forEach>
            
          </div>
          <div class="col-md-4 ml-auto">
          	<!-- 유저아이디 -->
            <h3 class="text-white">작성자[${boardMap.board.userid}]</h3>
           		<p>조회수 : ${boardMap.board.readcnt}</p>
           		<p>
           		<button id="btnLike">좋아</button> : <span id="likeCnt">${boardMap.board.likecnt}</span>
				<button id="btnDisLike">싫어</button> : <span id="disLikeCnt">${boardMap.board.dislikecnt}</span></p>
				
    <table>
         <tr>
			<th>내용</th>
			<td colspan="3">
				<c:if test="${boardMap.board.removeyn=='y'}">
					<textarea rows="5" cols="30" name="content" id="content" >삭제된 내용입니다.</textarea>
				</c:if>
				<c:if test="${boardMap.board.removeyn!='y'}">
					<textarea rows="5" cols="30" name="content" id="content" >${boardMap.board.content}</textarea>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>등록일자</td>
			<td colspan="3">${boardMap.board.regdate}</td>
		</tr>
		<tr>
			<td>수정일자</td>
			<td colspan="3">${boardMap.board.modifydate}</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<c:if test="${boardMap.board.userid == sessionScope.userid}">
					<button id="btnUpdateForm">수정하기</button>
					<button id="btnDelete">글삭제</button>
				</c:if> 
				<button id="btnRepAdd">댓글</button>
				<button id="btnList">목록</button>
			</td>
		</tr>
	</table>
	
	<hr id="rep0">
	
	<div id="replyAdd" hidden>
		<input type="hidden" id="reStep" value="0">
		<input type="hidden" id="reLevel" value="0">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="repUserid" readonly value="${sessionScope.userid}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="22" id="repContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center"> 
					<button id ="btnRepSave">추가</button>
					<button id ="btnRepReset">취소</button>
				</td>
			</tr>
		</table>
	
	</div>
	
	<!-- 댓글리스트 -->
	<h3>댓글 목록</h3>
	<div id="replyList"></div>
	
           
          </div>
        </div>

		
		<!-- 바텀화면 -->
        <div class="row site-section">
          <div class="col-md-6 col-lg-6 col-xl-4 text-center mb-5">
            <img src="${path}/uploadimg/${boardfile.filename}" alt="Image" class="img-fluid w-50 rounded-circle mb-4">
            <h2 class="text-black font-weight-light mb-4">Jean Smith</h2>
            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur ab quas facilis obcaecati non ea, est odit repellat distinctio incidunt, quia aliquam eveniet quod deleniti impedit sapiente atque tenetur porro?</p>
            <p>
             <!--  <a href="#" class="pl-0 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-facebook"></span></a> -->
            </p>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-4 text-center mb-5">
            <img src="${path}/uploadimg/${boardfile.filename}" alt="Image" class="img-fluid w-50 rounded-circle mb-4">
            <h2 class="text-black font-weight-light mb-4">Claire Smith</h2>
            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur ab quas facilis obcaecati non ea, est odit repellat distinctio incidunt, quia aliquam eveniet quod deleniti impedit sapiente atque tenetur porro?</p>
            <p>
           <!--    <a href="#" class="pl-0 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-facebook"></span></a>
            </p> -->
          </div>
          <div class="col-md-6 col-lg-6 col-xl-4 text-center mb-5">
            <img src="${path}/uploadimg/${boardfile.filename}" alt="Image" class="img-fluid w-50 rounded-circle mb-4">
            <h2 class="text-black font-weight-light mb-4">John Smith</h2>
            <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur ab quas facilis obcaecati non ea, est odit repellat distinctio incidunt, quia aliquam eveniet quod deleniti impedit sapiente atque tenetur porro?</p>
            <p>
            <!--   <a href="#" class="pl-0 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-facebook"></span></a> -->
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="footer py-4">
      <div class="container-fluid text-center">
        <p>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </p>
      </div>
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