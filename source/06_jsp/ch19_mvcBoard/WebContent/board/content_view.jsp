<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table>
		<caption>상세보기</caption>
		<tr><th>글번호</th><td>${contentBoard.bid }</td></tr>
		<tr><th>제목</th><td>${contentBoard.btitle }</td></tr>
		<tr><th>작성자</th><td>${contentBoard.bname }</td></tr>
		<tr><th>본문</th><td><pre>${contentBoard.bcontent }</pre></td></tr>
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${contentBoard.bdate }" pattern="yy/MM/dd(E) HH:mm:ss:SS"/>
			</td>
		</tr>
		<tr><th>조회수</th><td>${contentBoard.bhit }</td></tr>
		<tr><th>IP</th><td>${contentBoard.bip }</td></tr>
		<tr>
			<td colspan="2">
				<button onclick="location.href='${conPath}/modifyView.do?bid=${param.bid }&pageNum=${param.pageNum }'">
					수정
				</button>
				<button onclick="location.href='${conPath}/delete.do?bid=${param.bid }&pageNum=${param.pageNum }'">
					삭제
				</button>
				<button onclick="location.href='${conPath}/replyView.do?bid=${param.bid}&pageNum=${param.pageNum }'">
					답변
				</button>
				<button onclick="location.href='${conPath}/list.do?pageNum=${param.pageNum }'">목록</button>
			</td>
		</tr>
	</table>
</body>
</html>








