<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript">

$(function() {
	//메시지 
	if ('${resultMap.msg}' != ''){
		alert('${resultMap.msg}');
	}
	
	$(function(){
		//로그인 버튼을 클릭
		$('#btnLogin').click(function(){
			if ($('#userid').val()==''){
				alert('아이디를 입력해주세요');
				$('#userid').focus();
			}else if($('#passwd').val()==''){
				alert('비밀번호를 입력해주세요');
				$('#passwd').focus();
			}else{
				$('#frmLogin').submit();
			}
			
			
		});

		//회원가입버튼을 클릭했을때
		$('#btnJoin').click(function(e) {
			e.preventDefault();
			location.href = '${path}/member/join';
		});
		
		
	});	

});

</script>

</head>
<body>

	<h2>로그인</h2>
	<form id="frmLogin" action="${path}/home/login" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid"></td>
		</tr>
		<tr>
		 <th>비밀번호</th>
		 <td><input type="password" name="passwd"></td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
			<button type="button" id="btnLogin">로그인</button>
			<a href="${apiURL}"><img height="25" src="${path}/resources/images/btnNaver.png"></a>
			
			<button type="reset">최소</button>
			<button type="button" id="btnJoin">회원가입</button>
		</td>
		</tr>
		
		
	
	</table>
</form>
</body>
</html>