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
		//버튼 활성화
		//alert('${sessionScope.userid}');
		if ('${sessionScope.userid}' == '' ){
			$('#btnLogin').show();
			$('#btnLogout').hide();
			$('#userid').hide();
		}else{
			$('#btnLogin').hide();
			$('#btnLogout').show();
			$('#userid').show();
		}
		
		//로그인 버튼을 클릭했을때
		$('#btnLogin').click(function() {
			location.href = "${path}/home/login";
		});
		
		//로그아웃버튼을 클릭했을때
		$('#btnLogout').click(function() {
			if (confirm('로그아웃 하시겠습니까?')){
				location.href = "${path}/home/logout";
			} 
		});
		//userid를 클릭했을때
		$('#aUserid').click(function(e) {
			e.preventDefault(); //기본기능을 소멸
			location.href = "${path}/member/info";
		});
		
	});
</script>

<style type="text/css">
	#btnLogin{ 
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		font-size: 12px;
	} 
	#btnLogout{ 
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		font-size: 12px; 
	}

	#btnStyle{
		 border: 10px black;  
		 color: black; 
		 padding: 10px;
		 size: 12px; 
	 } 
	 #userid{
	 	color: white;
	 	font-size: 12px;
	 }
	 #navbarsExample03{
	 	font-size: 20px;
	 }
	 #main{
	 	font-size: 26px;
	 }
</style>

</head>
<body>
<header class="site-navbar py-3" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="${path}/home/main" class="text-white h2 mb-0">PhotoBoard</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li class="active"><a href="${path}/home/main">Home</a></li>
            
                <li><a href="${path}/board/">BoardList</a></li>
                <li><a href="${path}/member/list">MemberList</a></li>
              </ul>
            </nav>
          </div>

          <div class="col-6 col-xl-2 text-right" data-aos="fade-down">
            <div class="d-none d-xl-inline-block">
              
 				<div id="userid"><a href="" id="aUserid">${sessionScope.userid}</a> 님 반갑습니다.</div>
					<div id=btnStyle>
						<button id="btnLogin" >Login</button>
						<button id="btnLogout">Logout</button>
				</div>                
                
            </div>

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>
    
  
</body>
</html>