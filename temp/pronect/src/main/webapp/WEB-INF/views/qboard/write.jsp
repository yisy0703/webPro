<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
  <style>
	#content{width:1000px;	margin:0 auto;}
 	#checkbox{margin-right:30px;}
	#info {
		width:150px;
		font-size: 0.9em;
		font-weight: 900;
		padding: 0 0.75em 0.75em 0.75em;
		text-align: center;
		vertical-align: middle;
	}
	.exception{
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font-family: 'NanumSquareNeo-Variable';
		vertical-align: middle;
	}
	.back{
		width : 30px;
		text-align: left;
	}
	textarea{resize : none;}
	#btnContainer{text-align:center;}
	#btn{ margin:0 10px 0 10px;}
	#peopleInfo{color:#B6B8C0; font-size:0.8em; margin-left:30px;}
	#mandatory { color:red;}
  </style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<a href="javascript:history.back()"><img class = "back" src="${conPath}/images/back.png"></a>
		<div>
			<form action="${conPath }/fboard/write.do" method="post" enctype="multipart/form-data">		
				<input type="hidden" name="mid" value="${member.mid }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="schItem" value="${param.schItem }">
				<input type="hidden" name="schWord" value="${param.schWord }">
				<table>
					<caption>글 작성</caption>
					<tr><th id="info">제목</th><td><input type="text" name="qtitle" required="required"></td></tr>
					<tr><th id="info">본문</th><td><textarea rows="5" cols="20" name="qcontent"></textarea></td></tr>
					<tr><th id="info">첨부파일</th><td><input type="file" name="tempQfile"></td></tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="글쓰기" class="btn">
							<input type="reset" value="초기화" class="btn">
							<input type="button" value="목록" onclick="location='${conPath}/qboard/list.do?pageNum=${param.pageNum }&schItem=${param.schItem}&schWord=${param.schWord}'" class="btn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>

















