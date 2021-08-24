<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  
<!DOCTYPE html>
<html>
<head>
	<title>리스트</title>
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
<body>
<%@ include file="../home/header.jsp" %>
	<div class="site-section"  data-aos="fade">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-7">
		            <div class="row mb-5">
		              <div class="col-12 ">
		                <h2 class="site-section-heading text-center">MemberList</h2>
		                	<div id="searchaddbtn" align="center">
		                		<div id="divBoardList">		
									<form action="${path}/board/list">
										<select name="findkey" id="findkey">
											<option value="userid" ${page.findkey=='userid'?'selected':''}>아이디</option>
										</select>
										<input type="text" name = "findvalue"  id="findvalue" maxlength="20"  value="${page.findvalue}">
										<input type="hidden" name="curPage" value="1">
										<button id=search>검색</button> 	
									</form>
								<table border="1">
									<tr>
										<td>아이디</td>
										<td>비밀번호</td>
										<td>이메일</td>
										<td>회원관리</td>
									</tr>
									<c:forEach var="member" items="${list}">
									<tr>
										<td>${member.userid}</td>
										<td>${member.passwd}</td>
										<td>${member.email}</td>
										<td>
											<button>수정</button>
											<button>삭제</button>
										</td>
									</tr>
										
									
									</c:forEach>
								
								</table>
									
									<!-- 페이지번호 -->
							  	
								<form action="${path}/board/add">
									<c:if test="${page.startPage != 1}">
										<a href="${page.startPage-1}" class="aList" id="beforePage">이전</a>
									</c:if>
									<c:forEach  var="i"  begin="${page.startPage}" end="${page.endPage}">
										<c:if test="${page.curPage==i}">
											<a href="${i}" class="aList" id="aList1">${i}</a>
										</c:if>
										<c:if test="${page.curPage!=i}">
											<a href="${i}" class="aList" id="aList2">${i}</a>
										</c:if>
										
									</c:forEach>
									<c:if test="${page.totPage > page.endPage}">
										<a href="${page.endPage+1}" class="aList" id="nextPage">다음</a>
									</c:if>
									</form>		
								</div>                		
		                	</div>
		              </div>
		            </div>
		          </div>
        </div>
        
           
        <div class="row" >
  
  
	 	<!-- 이미지 나타내기 -->
	<c:forEach var="board" items="${blist}">     
		<div id="imgfile" class="col-sm-6 col-md-4 col-l g-3 col-xl-3 item" 
			data-src="${path}/uploadimg/${board.FILENAME}">			
	           <a href="${board.BNUM}" class="aSubject"><img src="${path}/uploadimg/${board.FILENAME}" id="img-thumbnail" alt="IMage" class="img-fluid"></a>
	        </div>             
	</c:forEach>	
	
	     </div>
	     </div>
	   </div>
 
  
  
  
	
	
<!-- footer -->
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