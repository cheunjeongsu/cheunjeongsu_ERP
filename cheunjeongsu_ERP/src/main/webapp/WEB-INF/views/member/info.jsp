<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보</h2>
		<table>
			<tr>
				<th>아이디</th>
				<td>${member.userid}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.email}</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>${member.zip}</td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td>${member.addr1}</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>${member.addr2}
					
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><img alt="사진" src="${path}/uploadimg/${member.filename}" width="100"></td>
			</tr>
			<tr>
				<th>개인소개</th>
				<td><textarea rows="5" cols="21">${member.memo}</textarea>  </td>
			</tr>
			<tr>
				<td><button type="button" id="">수정</button> </td>
			</tr>
			
		</table>
	
</body>
</html>