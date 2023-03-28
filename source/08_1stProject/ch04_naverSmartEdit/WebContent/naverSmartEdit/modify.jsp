<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<link href="${conPath }/se2/css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${conPath }/se2/js/service/HuskyEZCreator.js" charset="utf-8" ></script>
	<script>
		$(document).ready(function(){
			$('form').submit(function(){
				oEditors.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
				
			});
		});
	</script>
</head>
<body>
	<form action="${conPath }/naverSmartEditModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="${param.bno }">
		<input type="hidden" name="dbBfile" value="${dto.bfile }">
		<table>
			<caption>${param.bno }번 글수정</caption>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="btitle" required="required" value="${dto.btitle }"></td>
			</tr>
			<tr>
				<th>글본문</th>
				<td>
					<textarea rows="5" name="bcontent" id="bcontent">${dto.bcontent }</textarea>
					<script id="smartEditor" type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "bcontent",
							 sSkinURI: "${conPath }/se2/SmartEditor2Skin.html",
							 fCreator: "createSEditor2",
							 htParams : { 
							    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
							        bUseToolbar : true, 
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseVerticalResizer : false, 
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseModeChanger : false 
							    }
							});
						</script>	
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="bfile">
					첨부파일명 : 
					<c:if test="${empty dto.bfile }">첨부파일없음</c:if>
					<c:if test="${not empty dto.bfile }">
						<a href="${conPath }/naverSmartEditUp/${dto.bfile}">
							${dto.bfile }						
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정">
					<input type="button" value="목록" onclick="location.href='${conPath }/naverSmartEditList.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>