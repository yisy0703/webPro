<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<style>
	#content {
		width: 800px; height:350px;
		margin: 50px auto;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- jquery-ui 이용한 캘런더api -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
	  $("#datepicker").datepicker({
		  dateFormat : 'yy-mm-dd',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear : true,
			showOtherMonths : true,
			selectOtherMonths : false,
			yearSuffix : '년',
	  });
  } );
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
	

	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>