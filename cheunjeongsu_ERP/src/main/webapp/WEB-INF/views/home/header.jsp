<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 $(function(){
	 //버튼 활성화
	 alert('${sessionScope.userid}');
	 if('${sessionScope.userid}'==''){
		 $('#btnLogin').show();
		 $('#btnLogout').hide();
	 }else{
		 $('#btnLogin').hide();
		 $('#btnLogout').show();
	 }
	 
	 
	 //로그인 버튼
	 $('#btnLogin').click(function(){
	 	location.href = "${path}/home/login"
	 	});
	 
	 
	 //로그아웃
	 $('#btnLogout').click(function(){
	 	location.href = "${path}/home/logout"
	 	});
	 
	 
	 //userid를 클릭 했을 때
	 $('#aUserid').click(function(e){ //e는 이벤트
		 
		 e.preventDefault();//기본 기능 소멸(하이퍼링크에 걸린 걸 제거하고 다른 걸 실행)
			location.href = "${path}/member/info";
	 });
	 
 });
 

</script>

</head>
<body>
		<header>
		<div><h2>게시물 관리</h2></div>	
		<div id="userid"><a href="" id="aUserid">${sessionScope.userid}</a> 님 반갑습니다.</div>
		<button id="login">로그인</button>
		<button id="logout">로그아웃</button>
	</header>
	<nav>
		<a href="${path}/board/">게시물조회</a>
		<a href="${path}/board/add">게시물등록</a>
	</nav>
</body>
</html>