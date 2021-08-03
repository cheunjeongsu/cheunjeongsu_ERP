<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	 	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
		//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
		String inputYn = request.getParameter("inputYn"); 
		String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
		String addrDetail = request.getParameter("addrDetail"); 
		String zipNo = request.getParameter("zipNo"); 
		
		
%>
</head>
<script language="javascript">

function init(){
	var url = location.href;//내자신의 주소 : callback 주소
	var confmKey = "U01TX0FVVEgyMDIxMDcwNzE1MDMzODExMTM3NzM=";
	var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	var inputYn= "<%=inputYn%>";
	
	if(inputYn != "Y"){ //팝업 호출 시 실행
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		//document.form.action="https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>","<%=zipNo%>");
		window.close();
		}
}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		
	</form>
</body>
</html>