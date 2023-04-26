<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath}/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('tr').click(function(){
				id = $(this).children(0).eq(0).text();
				location.href = '${conPath}/detail?id='+id;
			});
		});
	</script>
</head>
<body>
	<table>
		<tr>
			<th>ID</th><th>PW</th><th>이름</th><th>메일</th><th>생일</th><th>가입일</th><th>주소</th>
		</tr>
		<c:forEach var="member" items="${list }">
			<tr>
				<td>${member.id }</td>
				<td>${member.pw.replaceAll(".","*") }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
				<td><fmt:formatDate value="${member.birth }" pattern="yy/MM/dd(E)"/> </td>
				<td>${member.rdate }</td>
				<td>${member.address }</td>
			</tr>
		</c:forEach>
	</table>
	<div id="map" style="width:100%;height:400px;"></div>

	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f17825320e8c5e73cadec1b017e631bb&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35, 127), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	</script>
	<c:forEach var="dto" items="${list }">
		<script>
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${dto.address}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.name}(${dto.address})</div>',
		            removable : true
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
	</c:forEach>
</body>
</html>