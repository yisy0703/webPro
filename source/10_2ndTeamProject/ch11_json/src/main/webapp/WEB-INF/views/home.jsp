<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$.ajax({
				url : '${conPath}/resources/ex.json',
				dataType : 'json',
				success : function(data){
					$.each(data, function(idx, item){
						
						$.ajax({
							url : '${conPath}/insert',
							type : 'post',
							data : {"id":item.id, "name":item.name, "price":item.price, "description":item.description},
							dataType : 'html',
							success : function(data){
								$('#result').html($('#result').html() + idx+"번째 " + data +'<br>');
							},
							error : function(code){
								alert(code.status + '/' + code.statusText);
							},
						});
					});// each
					
				}, // success
			});// ajax밖
		});
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<p id="result">
</body>
</html>