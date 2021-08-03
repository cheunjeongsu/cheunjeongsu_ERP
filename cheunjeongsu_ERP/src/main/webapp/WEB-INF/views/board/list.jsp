<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body>
<%@ include file="../home/header.jsp" %>
	<div id="divBoardList">
		<h2>게시물 조회</h2>
		<form action="${path}/board/list">
			<select name="findkey" id="findkey">
				<option value="subject" ${page.findkey=='subject'?'selected':''}>제목</option>
				<option value="content" ${page.findkey=='content'?'selected':''}>내용</option>
				<option value="subcon" ${page.findkey=='subcon'?'selected':''}>제목+내용</option>
				<option value="userid" ${page.findkey=='userid'?'selected':''}>아이디</option>
			</select>
			<input type="text" name = "findvalue"  id="findvalue" maxlength="10"  value="${page.findvalue}">
			<input type="hidden" name="curPage" value="1">
			<button>조회</button>
		</form>
	</div>
	<table border="1">
		<tr>
			<th>번호</th>	
			<th>아이디</th>	
			<th>제목</th>	
			<th>내용</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>싫어요</th>
		</tr>
		<c:forEach var="board" items="${blist}">
		<tr>
			<td>${board.BNUM} </td>
			<td>${board.USERID} </td>
			<td><a href="${board.BNUM}" class="aSubject">${board.SUBJECT}(${board.RCNT})</a> </td>
			<td>${board.CONTENT} </td>
			<td>${board.READCNT} </td>
			<td>${board.LIKECNT} </td>
			<td>${board.DISLIKECNT} </td>
		</tr>
		</c:forEach>
	</table>
<%-- 	${page}  --%>
	<hr>
	<c:if test="${page.startPage != 1}">
		<a href="${page.startPage-1}" class="aList" >이전</a>
	</c:if>
	
	<c:forEach  var="i"  begin="${page.startPage}" end="${page.endPage}">
		<c:if test="${page.curPage==i}">
			<a href="${i}" class="aList" id="aCurPage">${i}</a>
		</c:if>
		<c:if test="${page.curPage!=i}">
			<a href="${i}" class="aList" >${i}</a>
		</c:if>
		
	</c:forEach>
	<c:if test="${page.totPage > page.endPage}">
		<a href="${page.endPage+1}" class="aList" >다음</a>
	</c:if>
	
	
	
</body>
</html>