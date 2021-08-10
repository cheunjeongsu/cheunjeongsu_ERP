<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<!DOCTYPE html>
<html lang="uft-8">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>
    
    <!-- Custom fonts for this template-->
    <link href="${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	
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

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                                    </div>
                                   <form id="frmLogin" class="user" action="${path}/home/login" method="post">
                                        <div class="form-group">
                                            <input type="text" name="userid" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력해 주세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="passwd" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="패스워드를 입력해 주세요.">
                                        </div>
                                       
                                        <button type="button" id="btnLogin" class="btn btn-primary btn-user btn-block" >로그인</button>
                                        
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a type="button" id="btnJoin" href="register.html">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path}/resources/js/sb-admin-2.min.js"></script>

</body>

</html>