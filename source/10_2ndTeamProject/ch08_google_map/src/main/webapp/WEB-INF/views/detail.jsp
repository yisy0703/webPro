<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<style>
		#google-map {
            width: 50%; height:200px;
            margin: 10px auto;
            padding: 0;
        }
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
			
		});
	</script>
</head>
<body>
	<table>
		<tr><th>아이디</th><td>${member.id }</td></tr>
		<tr><th>비밀번호</th><td>${member.pw }</td></tr>
		<tr><th>이름</th><td>${member.name }</td></tr>
		<tr><th>메일</th><td>${member.email }</td></tr>
		<tr><th>생일</th><td>${member.birth }</td></tr>
		<tr><th>가입일</th><td>${member.rdate }</td></tr>
		<tr><th>주소</th><td>${member.address }</td></tr>
	</table>
    <div id="google-map"></div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7eGssu0FtcF5lhMsaFuA_eFqVx6OKLa4&callback=initMap">
    </script>
    <script>
        function initMap() { 
            var map = new google.maps.Map(document.getElementById('google-map'));
            var geocoder = new google.maps.Geocoder();
            geocodeAddress(geocoder, map);
            function geocodeAddress(geocoder, resultMap) {
                geocoder.geocode({'address': '${member.address }'}, function(result, status) {
 
                    if (status === 'OK') {
                        resultMap.setCenter(result[0].geometry.location);
                        resultMap.setZoom(16);
                        var marker = new google.maps.Marker({
                            map: resultMap,
                            position: result[0].geometry.location
                        });
                    } else {
                        alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                    }
                });
            }
        }
    </script>
	<button onclick="location.href='${conPath}/'">목록</button>
</body>
</html>