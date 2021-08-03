<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/includeFile.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>

 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=epdayvn9jw"></script>

<script>
$(function() {
	var x=37.4847794;
	var y=126.9301180;
	
	var mapOptions = {
		    center: new naver.maps.LatLng(x, y),
		    zoom: 13
		};

		var map = new naver.maps.Map('map', mapOptions);
		
		var marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(x, y),
				map: map
			
		});
	
});
</script>
</head>
<body>
	<div id="map" style="width:100%;height:400px;"></div>
</body>
</html>


