<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/boarddetail.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="stateChange()">
<i class="fas fa-heart"></i>
<i class="far fa-heart"></i>
로그인아이디 : ${sessionScope.userid}
<%-- 	${boardMap} --%>
	<h2>상세조회</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<td>${boardMap.board.BNUM}</td>
			<th>작성자</th>
			<td>${boardMap.board.USERID} </td>
		</tr>
		<tr>
			<td  colspan="4"> 
				조회수 : ${boardMap.board.READCNT}
				<button id="btnLike">좋다</button> : <span id="likeCnt">${boardMap.board.LIKECNT}</span>
				<button id="btnDisLike">싫다</button> : <span id="disLikeCnt">${boardMap.board.DISLIKECNT}</span>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${boardMap.board.SUBJECT}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">
			<c:if test="${boardMap.board.REMOVEYN=='y'}">
				<textarea rows="5" cols="30" name="content" id="content" >삭제된 내용입니다.</textarea>
			</c:if>
			<c:if test="${boardMap.board.REMOVEYN!='y'}">
				<textarea rows="5" cols="30" name="content" id="content" >${boardMap.board.CONTENT}</textarea>
			</c:if>
			</td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3">
				<ol id="filelist">
					<c:forEach var="boardfile" items="${boardMap.bflist}">
						<li>${boardfile.filename} <button class="btnFileDownload" value="${boardfile.filename}"><i class="fas fa-download"></i></button></li>
					</c:forEach>
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
				<c:if test="${boardMap.board.USERID == sessionScope.userid}">
					<button id ="btnUpdateForm">수정폼</button>
					<button id="btnDelete">삭제</button>
				</c:if> 
				<button id="btnRepAdd">댓글</button>
				<button id="btnList">조회</button>
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
	
</body>
</html>