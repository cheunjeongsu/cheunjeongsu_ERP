<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물조회</title>
<script type="text/javascript">

	$(function() {
		//하이퍼링크 페이지를 클릭했을때
		$('.aList').click(function(e) {
			
			e.preventDefault();
			var curPage = $(this).attr('href');
			var findkey = $('#findkey').val();
			var findvalue = $('#findvalue').val();
			location.href = '${path}/board/list?curPage='+curPage+'&findkey='+findkey+'&findvalue='+findvalue ;
		});
		
		//제목을 클릭했을때
		$('.aSubject').click(function(e) {
			e.preventDefault();

 			//로그인 후 사용가능
/* 			if ('${sessionScope.userid}' == ''){
				alert('로그인후 사용가능');
				location.href = '${path}/login';
				return ;
			}  */
			var bnum = $(this).attr('href');
			location.href = '${path}/board/detail?bnum='+bnum;
		});
	});

</script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<style type="text/css">
	#col-md-offset-3{
		font-size: 15px;
	}
	#contentadd{
		font-size: 15px;
		float: left;
	}
	
	#findkey{
		font-size: 13px;
	}
	#search{
		font-size: 13px;
	}
	#findvalue{
		font-size: 13px;
	}
	
	#beforePage{
		font-size: 20px;
		margin: 5px;
	}
	#aList1{
		font-size: 20px;
		margin: 5px;
	}
	#aList2{
		font-size: 20px;
		margin: 5px;
	}
	#nextPage{
		font-size: 20px;
		margin: 5px;
	}

</style>

</head>
<body>
<%@ include file="../home/header.jsp" %>
	<header>
		<h2>BoardList</h2>
	</header>
	
	<hr /> 
	<div id="divBoardList">
		
		<form action="${path}/board/list">
			<select name="findkey" id="findkey">
				<option value="subject" ${page.findkey=='subject'?'selected':''}>제목</option>
				<option value="content" ${page.findkey=='content'?'selected':''}>내용</option>
				<option value="subcon" ${page.findkey=='subcon'?'selected':''}>제목+내용</option>
				<option value="userid" ${page.findkey=='userid'?'selected':''}>아이디</option>
			</select>
			<input type="text" name = "findvalue"  id="findvalue" maxlength="20"  value="${page.findvalue}">
			<input type="hidden" name="curPage" value="1">
			<button id=search>Search</button> 	
		</form>		
	</div>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>썸네일</th>
			<th>제목</th>	
			<th>내용</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>싫어요</th>
		</tr>
		</thead>
		<c:forEach var="board" items="${blist}">
		<tr>
			<td><img alt="" src="${path}/uploadimg/${board.FILENAME}"> </td>
			<td><a href="${board.BNUM}" class="aSubject">${board.SUBJECT}(${board.RCNT})</a></td>
			<td>${board.CONTENT} </td>
			<td>${board.READCNT} </td>
			<td>${board.LIKECNT} </td>
			<td>${board.DISLIKECNT} </td>
		</tr>
		</c:forEach>
		
	</table>
	<hr>
	
		<form action="${path}/board/add" id="contentadd">
			<button>게시글추가</button>
		</form>
	
	${page} 
	<div class="col-md-offset-3">
		<ul class="pagination">
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
	</ul>	
	</div>

</body>
</html> --%>