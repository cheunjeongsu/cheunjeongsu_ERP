<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
 -->

 <%-- <script src="${pageContext.request.contextPath}/resources/common/js/jquery-3.3.1.min.js" ></script> --%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- Bootstrap theme -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"> --%>

<!-- common CSS -->
<%-- <link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >
 --%>
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
	<!--메뉴바 추가 부분-->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <a id="main" class="navbar-brand" href="#">공유게시판</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>



  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${path}/home/main">홈<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${path}/board/">게시판</a>
      </li>
    <!--   <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown03">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->      
    </ul>
     <div id="userid"><a href="" id="aUserid">${sessionScope.userid}</a> 님 반갑습니다.</div>
		<div id=btnStyle>
			<button id="btnLogin" >로그인</button>
			<button id="btnLogout">로그아웃</button>
		</div>
  </div>
</nav>
</body>
</html>