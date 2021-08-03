<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript">

	//jquery안에 포함하면 안됨
	function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
				// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
				document.frmMemberJoin.addr1.value = roadAddrPart1;
				document.frmMemberJoin.addr2.value = addrDetail;
				document.frmMemberJoin.zip.value = zipNo;
				
				//$('#addr1').val(roadAddrPart1);
				//$('#addr2').val(addrDetail);
				//$('#zip').val(zipNo);
		}
		
		
		
	$(function () {
		//메시지 
		if ('${resultMap.msg}' != ''){
			alert('${resultMap.msg}');
		}

		function goPopup(){
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			//controller를 호출해서 주소팝업 띄우기
			var pop = window.open("${path}/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
			 
		}
		
		
		//주소찾기 버튼을 클릭했을때
		$('#goPopup').click(function() {
			goPopup(); //주소 팝업 띄우기
		})
		
		//가입버튼을 눌렀을때
		$('#btnJoin').click(function() {
			var userid = $('#userid').val();
			var passwd = $('#passwd').val();
			var email = $('#email').val();
			
			if (idCheckYn !='y'){
				alert('아이디를 체크해 주세요!');
				$('#idCheck').focus();
			}else if (userid==''){
				alert('아이디를 입력해 주세요!');
				$('#userid').focus();
			}else if (passwd==''){
				alert('비밀번호를 입력해 주세요!');
				$('#passwd').focus();
			}else if (email==''){
				alert('이메일을 입력해 주세요!');
				$('#email').focus();
			}else{
				$('#frmJoin').submit();
			}
				
			//아이디 체크
			$("#idCheck").click(function(e) {
				e.preventDefault();
				var userid = $('#userid').val();
				
				$.ajax({
					url:'${path}/member/idCheck/'+userid,
					type:'get',
					dataType:'json',
					success : function(data){
						console.log(data);
						//rcode값이 0일때
						$('#idCheckYn').val('y');
						alert(data.msg)
						
					},
					error:function(err){
						console.log(err);
						alert('실패');
					}
				});			
			});
			//아이디 변경하면 바뀜
			$('#userid').change(function() {
				alert();
				$('#idCheckYn').val('n');
			});
		
	});
	</script>
</head>
<body>
	<h2>회원가입</h2>
	<form name="frmMemberJoin" id="frmMemberJoin" action="${path}/member/join" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userid" id="userid">
					<input id="idCheckYn" type="hidden" value="n"><!-- 아이디체크여부 -->
					<button id="idCheck">아이디체크</button> 
				</td>	
	 		</tr>
	 		<tr>
	 			<th>비밀번호</th>
	 			<td><input type="password" name="passwd" id="passwd"></td>			
	 		</tr>	 		
	 		<tr>
	 			<th>e-mail</th>
	 			<td><input type="email" name="email" id="email"></td>			
	 		</tr>
	 		<tr>
	 			<th>우편번호</th>
	 			<td><input type="text" name="zip" id="zip" size="5"> <button type="button" id="goPopup">주소찾기</button></td>			
	 		</tr>
	 		<tr>
	 			<th>주소</th>
	 			<td><input type="text" name="addr1" id="addr1"></td>				
	 		</tr>
	 		<tr>
	 			<th>상세주소</th>
	 			<td><input type="text" name="addr2" id="addr2"></td>				
	 		</tr>
	 		<tr>
	 			<th>프로필사진</th>
	 			<td><input type="file" name="photofile" id="photofile"></td>				
	 		</tr>
	 		<tr>
	 			<th>자기소개</th>
	 			<td><textarea rows="7" cols="20"></textarea></td>
	 		</tr>
	 	</table>
	 <hr>
	 <button type="button" id="btnJoin">가입</button>
	 <button type="reset">최소</button>
	</form>
</body>
</html>