<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  
<!-- 핸들바 탬플릿 cdn추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<!-- 댓글리스트 템플릿 소스-->
<script id="replylist_template" type="text/x-handlebars-template">
{{#each .}}
	<hr>
	<table border="1" id="rep{{rnum}}">
		<tr>
			<th>
				{{#if yn}}
					{{rnum}}
				{{/if}}
			</th>
			<td rowspan="3"><textarea rows="5" cols="30" id="REPCONTENT{{rnum}}">{{content}}</textarea></td>
		</tr>
		<tr>
			<th>{{userid}}</th>
		</tr>
		<tr>
			<td><input type="hidden" class="state" id="state{{rnum}}"value="{{state}}">
				<button class="btnRepLike" id="btnRepLike{{rnum}}" value="{{rnum}}">{{#likeButton state}}{{/likeButton}}</button><span class="repLikeCnt" id="repLikeCnt{{rnum}}" >{{likecnt}}</span>
				<button class="btnRepDisLike" id="btnRepDisLike{{rnum}}" value="{{rnum}}">{{#disLikeButton state}}{{/disLikeButton}}</button><span class="repDisLikeCnt" id="repDisLikeCnt{{rnum}}">{{dislikecnt}}</span>
			</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td>{{regdate}}</td>
		</tr>
		<tr>
			<th>수정일자</th>
			<td>{{modifydate}}</td>
		</tr>
		<tr>
			<td colspan="4" align="right"> 
				<input type="hidden" class="rnum" value="{{rnum}}">
				<input type="hidden" class="reStep" value="{{restep}}">
				<input type="hidden" class="reLevel" value="{{relevel}}">
				{{#sessionCheck userid}}				
				{{/sessionCheck}}
				<button class="btnRepAdd">댓글</button>
			</td>
		</tr>
	</table>
{{/each}}
</script>
<script>
	//헬퍼 작성
	//세션id와 작성자 id가 같은지 체크(같을때만 버튼을 리턴)
	Handlebars.registerHelper('sessionCheck', function(userid){
		var loginuserid = '${sessionScope.userid}';
		if (loginuserid == userid){
			return '<button class ="btnRepUpdate" value="' + userid + '">수정</button> ' +
					'<button class="btnRepDelete" value="' + userid + '">삭제</button>';
		}
		return '';
	});
	//좋아요 버튼 제어
	Handlebars.registerHelper('likeButton', function(state){
		if (state == 1){ //좋아요 상태
			return like;
		}else{
			return likeNo;
		}
	});

	//싫어요 버튼 제어
	Handlebars.registerHelper('disLikeButton', function(state){
		if (state == 2){ //싫어요 상태
			return dislike;
		}else{
			return dislikeNo;
		}
	});

</script> 

<script type="text/javascript">
var loginUserid ='${sessionScope.userid}';
var state = '${boardMap.board.state}';
let like = '<i class="fas fa-thumbs-up"></i>'; //좋아요
let likeNo = '<i class="far fa-thumbs-up"></i>'; 
let dislike = '<i class="fas fa-thumbs-down"></i>'; //싫어요
let dislikeNo = '<i class="far fa-thumbs-down"></i>';


//좋아요 싫어요 버튼 제어
function stateChange() {
	
	if (state == '0'){ //조회
		$('#btnLike').html(likeNo);
		$('#btnDisLike').html(dislikeNo);
	}
	else if (state == '1') { //좋아요
		$('#btnLike').html(like);
		$('#btnDisLike').html(dislikeNo);
	}
	else if (state == '2') { //싫어요
		$('#btnLike').html(likeNo);
		$('#btnDisLike').html(dislike);
	};
	
}


$(function() {
	/* 게시물 처리 */
	
	//좋아요 버튼을 클릭했다면
	$('#btnLike').click(function() {
		if (state=='0') { //조회상태일때만 싫어요/좋아요 가능
			//좋아요 처리"C:/Users/Public/Desktop/IntelliJ IDEA Community Edition 2020.2.1 x64.lnk"
			var bnum = '${boardMap.board.bnum}';
			console.log(bnum);
			$.ajax({
				url:'${path}/board/like/'+bnum,
				type:'get',
				dataType:'text',
				success : function(data){
					state = '1'; //좋아요 상태
					stateChange(); //버튼상태 변경
					//좋아요 + 1
					$('#likeCnt').text(parseInt($('#likeCnt').text()) + 1); 
					
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});

		}else if (state == '1'){ //좋아요 상태일때
			//좋아요 취소 처리
			var bnum = '${boardMap.board.bnum}';
			console.log(bnum);
			$.ajax({
				url:'${path}/board/likeCancel/'+bnum,
				type:'get',
				dataType:'text',
				success : function(data){
					state = '0'; //조회 상태
					stateChange(); //버튼상태 변경
					//좋아요 - 1
					$('#likeCnt').text(parseInt($('#likeCnt').text()) - 1); 
					
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});
			
		}else if (state == '2'){ //싫어요 상태일때
			alert('싫어요 취소후 가능');
		}
		
	});
	
	//싫어요 버튼을 클릭했다면
	$('#btnDisLike').click(function() {
	
		if (state=='0') { //조회상태일때
			//싫어요 처리
			var bnum = '${boardMap.board.bnum}';
			console.log(bnum);
			$.ajax({
				url:'${path}/board/disLike/'+bnum,
				type:'get',
				dataType:'text',
				success : function(data){
					state = '2'; //싫어요 상태
					stateChange(); //버튼상태 변경
					//싫어요 + 1
					$('#disLikeCnt').text(parseInt($('#disLikeCnt').text()) + 1); 
					
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});

		}else if (state == '2'){ //싫어요 상태일때
			//싫어요 취소 처리
			var bnum = '${boardMap.board.bnum}';
			console.log(bnum);
			$.ajax({
				url:'${path}/board/disLikeCancel/'+bnum,
				type:'get',
				dataType:'text',
				success : function(data){
					state = '0'; //조회 상태
					stateChange(); //버튼상태 변경
					//싫어요 - 1
					$('#disLikeCnt').text(parseInt($('#disLikeCnt').text()) - 1); 
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});
			
		}else if (state == '1'){ //좋아요 상태일때
			alert('좋아요 취소후 가능');
		}
		
	});
	
	//원본글 삭제 버튼을 클릭했다면
	$('#btnDelete').click(function() {
		//권한 체크
		if ('${boardMap.board.userid}' != '${sessionScope.userid}'){
			alert('삭제권한이 없습니다.');
			return ;
		}
		//
		location.href = '${path}/board/delete?bnum=${boardMap.board.bnum}';
		
	});
	
	//원본글 수정폼으로이동 버튼을 클릭했다면
	$('#btnUpdateForm').click(function(){
		location.href = '${path}/board/modify?bnum=${boardMap.board.bnum}';
		
	});
	
	//파일다운로드 버튼을 클릭했다면
	$('.btnFileDownload').click(function(e) {
		e.preventDefault();
		var filename = $(this).val();
		//alert(filename);
		location.href = '${path}/board/filedownload?filename='+filename;
		
	});
	
	
	/* 댓글처리 */
	//댓글추가버튼을 클릭했을때
	$('#btnRepSave').click(function(){
		var bnum = ${boardMap.board.BNUM};
		var content = $('#repContent').val();
		var restep = $('#reStep').val();
		var relevel = $('#reLevel').val();

		//댓글추가 div를 처음위치로 이동
		$("#replyAdd").insertAfter('#rep0');
		$('#replyAdd').hide();
		$.ajax({
			url:'${path}/reply/', //restful하게 설계
			type:'post',   //method
			contentType:'application/json', //보낼 데이터 타입
			data:JSON.stringify({bnum,content,restep,relevel}), //보낼데이터
			dataType:'text', //받을 데이터 타입
			success:function(data){ //성공시 실행
				console.log(data);
				//댓글 리스트 조회
				replylist();
			},
			error:function(err){ //실패시 실행
				console.log(err);
				alert('실패');
			}
			
		});
		
	});
	
	//댓글리스트 조회
	function replylist() {
		var bnum = ${boardMap.board.BNUM};
		$.ajax({
			url:'${path}/reply/list/'+bnum,
			type:'get',   //method
			dataType:'json', //받을 데이터 타입
			success:function(data){ //성공시 실행
				console.log(data);
				//댓글 리스트 탬플릿을 이용해서 추가
				var source = $('#replylist_template').html();
				var template = Handlebars.compile(source);
				$('#replyList').html(template(data));	
			},
			error:function(err){ //실패시 실행
				console.log(err);
				alert('실패');
			}
		});
		

	};
	
	//댓글추가 이동
	function replymove(reStep, reLevel, eleId){
		$("#replyAdd").show();
		//댓글 초기화
		$('#reStep').val(reStep);
		$('#reLevel').val(reLevel);
		$('#repContent').val('');
		//댓글 추가 이동
		$("#replyAdd").insertAfter(eleId);
	}
	
	//댓글의 댓글버튼을 클릭했을때 
	//동적으로 생성된 엘리먼트에 이벤트 달기
	$('#replyList').on('click', '.btnRepAdd', function(){
		var reStep = $(this).parent().find('.reStep').val();
		var reLevel = $(this).parent().find('.reLevel').val();
		var rnum = $(this).parent().find('.rnum').val();
		//alert(rnum);
		//alert(reStep);
		//alert(reLevel);
		$('#reStep').val(reStep);
		$('#reLevel').val(reLevel);

		//댓글 추가 이동
		replymove(reStep, reLevel, '#rep'+rnum);
		
		
	});
	
	//원본의 댓글을 클릭했을때
	$('#btnRepAdd').click(function(){
		replymove(0, 0, '#rep0');
	});
	
	//댓글의 수정 버튼을 클릭했을때
	$('#replyList').on('click', '.btnRepUpdate', function(){
		//권한체크
		if ($(this).val() != '${sessionScope.userid}'){
			alert('수정권한이 없습니다.');
			return ;
		}
		var rnum = $(this).parent().find('.rnum').val();
		var content = $('#repContent' + rnum ).val();
/* 			alert(rnum);
		alert(content);
*/			
		$.ajax({
			url:'${path}/reply/'+rnum, //restful하게 설계
			type:'put',   //수정 method
			contentType:'application/json', //보낼 데이터 타입
			data:JSON.stringify({rnum,content}), //보낼데이터
			dataType:'text', //받을 데이터 타입
			success:function(data){ //성공시 실행
				console.log(data);
				alert(data);
			},
			error:function(err){ //실패시 실행
				console.log(err);
				alert('실패');
			}
			
		});
		
	});

	//댓글의 취소 버튼을 클릭했을때
	$('#btnRepReset').click(function() {
		$('#replyAdd').hide();
	});
	
	//댓글 삭제 버튼을 클릭했을때
	$('#replyList').on('click', '.btnRepDelete', function(){
		//권한체크
		if ($(this).val() != '${sessionScope.userid}'){
			alert('삭제권한이 없습니다.');
			return ;
		}

		var rnum = $(this).parent().find('.rnum').val();
		
		$.ajax({
			url:'${path}/reply/'+rnum, //restful하게 설계
			type:'delete',   //삭제 method
			dataType:'text', //받을 데이터 타입
			success:function(data){ //성공시 실행
				console.log(data);
				alert(data);
				replylist();
				
			},
			error:function(err){ //실패시 실행
				console.log(err);
				alert('실패');
			}
			
		});

	});

	//댓글의 좋아요 버튼을 클릭했을때
	$('#replyList').on('click', '.btnRepLike', function(){
		var rnum = $(this).val();
		var state = $('#state'+rnum).val();
		//alert(state);
			
		if (state=='0') { //조회상태일때만 싫어요/좋아요 가능
			$.ajax({
				url:'${path}/reply/like/'+rnum,
				type:'get',
				dataType:'text',
				success : function(data){
					$('#state'+rnum).val(1); //좋아요 상태
					$('#btnRepLike'+rnum).html(like);
					//좋아요 + 1
					$('#repLikeCnt'+rnum).text(parseInt($('#repLikeCnt'+rnum).text()) + 1); 
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});

		}else if (state == '1'){ //좋아요 상태일때
			//좋아요 취소 처리
			$.ajax({
				url:'${path}/reply/likeCancel/'+rnum,
				type:'get',
				dataType:'text',
				success : function(data){
					$('#state'+rnum).val(0); //조회 상태
					$('#btnRepLike'+rnum).html(likeNo);
					//좋아요 - 1
					$('#repLikeCnt'+rnum).text(parseInt($('#repLikeCnt'+rnum).text()) - 1); 
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});
			
		}else if (state == '2'){ //싫어요 상태일때
			alert('싫어요 취소후 가능');
		}
		
	});
	//댓글의 싫어요 버튼을 클릭했을때
	$('#replyList').on('click', '.btnRepDisLike', function(){
		var rnum = $(this).val();
		var state = $('#state'+rnum).val();
		//alert(state);
			
		if (state=='0') { //조회상태일때만 싫어요 가능
			$.ajax({
				url:'${path}/reply/disLike/'+rnum,
				type:'get',
				dataType:'text',
				success : function(data){
					$('#state'+rnum).val(2); //싫어요 상태
					$('#btnRepDisLike'+rnum).html(dislike);
					//싫어요 +1
					$('#repDisLikeCnt'+rnum).text(parseInt($('#repDisLikeCnt'+rnum).text()) + 1); 
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});

		}else if (state == '2'){ //싫어요 상태일때
			//싫어요 취소 처리
			$.ajax({
				url:'${path}/reply/disLikeCancel/'+rnum,
				type:'get',
				dataType:'text',
				success : function(data){
					$('#state'+rnum).val(0); //조회 상태
					$('#btnRepDisLike'+rnum).html(dislikeNo);
					// 싫어요 - 1
					$('#repDisLikeCnt'+rnum).text(parseInt($('#repDisLikeCnt'+rnum).text()) - 1); 
				},
				error:function(err){
					console.log(err);
					alert('실패');
				}
			});
			
		}else if (state == '1'){ //좋아요 상태일때
			alert('좋아요 취소후 가능');
		}
		
		
		
	});
	
	//조회폼 버튼을 클릭했을때
	$('#btnList').click(function() {
		location.href ='${path}/board/list';
		
	});
	
	//댓글리스트 조회
	replylist();
	


});



</script>
