<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  
<!DOCTYPE html>
<html>
<head>

  <title>Photosen &mdash; Colorlib Website Template</title>
  <script type="text/javascript">
	$(function() {

		//로그인버튼 클릭시
		$('#btnLogin').click(function() {
			var userid = $('#userid').val();
			var passwd = $('#passwd').val();
			if(userid==''){
				alert('아이디를 작성하세요');
				$('#userid').focus();
			}else if(passwd==''){
				alert('비밀번호를 작성하세요');
				$('#passwd').focus();
			}else{
				$('#frmMemberLogin').submit();
				
			}
			
		});
		//회원가입버튼을 클릭했을때
		$('#btnJoin').click(function() {
			location.href = '${path}/member/join';
		});
		
	});
</script>
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
  <div class="site-wrap">
    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    



    <header class="site-navbar py-3" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="${path}/home/main" class="text-white h2 mb-0">PhotoBoard</a></h1>
          </div>
         

		  
        </div>
      </div>
      
    </header>


	<form action="${path}/home/logincheck" name="frmMemberLogin" id="frmMemberLogin" method="post" enctype="multipart/form-data">
    <div class="site-section"  data-aos="fade">
      <div class="container">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
                <h2 class="site-section-heading text-center">LOGIN</h2>
              </div>
            </div>
          </div>
          

        </div>
        
        <div class="row">
          <div class="col-lg-8 mb-5">
           


              
	          <div id="logininfo1">
	             <div class="col-md-6 mb-3 mb-md-0">
	               <label class="text-white" for="userid"  >ID</label>
	               <input type="text" name="userid" id="userid" class="form-control">
	             </div>
	          </div> 
              
              <div id="logininfo2">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-white" for="passwd">PASSWORD</label>
                  <input type="password" name="passwd" id="passwd" class="form-control" >
                </div>
              </div>
			  
    	  	
    	  	  <div class="col-md-6 mb-3 mb-md-0">
                <button type="button" id="btnLogin" style="cursor:hand;">login</button>
                <button type="button" id="btnJoin" style="cursor:hand;">sign up</button>
              </div>
              
           
    	  </div>
     </div>
    </div>
    </div>
    </form>

    <div class="footer py-4">
      <div class="container-fluid text-center">
        <p>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </p>
      </div>
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