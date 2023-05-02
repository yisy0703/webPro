<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/main.css" rel="stylesheet">
  <style>
	#content{width:700px;	margin:0 auto;}
 	#checkbox{margin-right:30px;}
	#registerInfo {
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
	<form action="${conPath }/group/modify.do" method="post">
		<input type="hidden" name="method" value="modify">
		<input type="hidden" name="gid" value="${groupDetail.gid }">
		<input type="hidden" name="mid" value="${groupDetail.mid }">
			<table id="main">
				<tr>
					<th id="registerInfo" >제목<b id="mandatory">*</b></th>
					<td><input type="text" autocomplete="off" name="gtitle" required="required" value="${groupDetail.gtitle}"></td>
				</tr>
				<tr>
					<th id="registerInfo" >내용<b id="mandatory">*</b></th>
					<td><textarea rows="10" cols="10" autocomplete="off" name="gcontent" required="required">${groupDetail.gcontent}</textarea></td>
				</tr>
				<tr>
					<th id="registerInfo">모집 구분<b id="mandatory">*</b></th>
					<td>
						<select name="gcharacter" required="required">
							<option value="S" <c:if test="${groupDetail.gcharacter eq 'S'}">selected="selected"</c:if>>스터디</option>						
							<option value="P" <c:if test="${groupDetail.gcharacter eq 'P'}">selected="selected"</c:if>>프로젝트</option>						
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<span>
							<label id="checkbox"><input type="checkbox" class ="position" name="gdev" id="gdev-checkbox" value="Y" disabled="disabled">개발자</label>
							<label id="checkbox"><input type="checkbox" class ="position" name="gdesign" id="gdesign-checkbox" value="Y" disabled="disabled">디자이너</label>
							<label id="checkbox"><input type="checkbox" class ="position" name="gpm" id="gpm-checkbox" value="Y" disabled="disabled">기획자</label>
						</span>
					</td>
				</tr>
				<tr>
					<th id="registerInfo" >모집 인원<b id="mandatory">*</b></th>
					<td>
						<input type="number" autocomplete="off" name="gpeople" required="required" value="${groupDetail.gpeople}">명
						<span id="peopleInfo">최소 2명부터 입력 가능</span>
					</td>
				<tr>
					<th id="registerInfo"  class="exception" rowspan="2">사용 언어</th>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Python"
							<c:if test="${groupDetail.glanguage1 eq 'Python' or
														groupDetail.glanguage2 eq 'Python' or 
														groupDetail.glanguage3 eq 'Python'}"> checked="checked"</c:if>>Python</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Java"
							<c:if test="${groupDetail.glanguage1 eq 'Java' or
														groupDetail.glanguage2 eq 'Java' or 
														groupDetail.glanguage3 eq 'Java'}"> checked="checked"</c:if>>Java</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="JavaScript"
							<c:if test="${groupDetail.glanguage1 eq 'JavaScript' or
														groupDetail.glanguage2 eq 'JavaScript' or 
														groupDetail.glanguage3 eq 'JavaScript'}"> checked="checked"</c:if>>JavaScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C++"
							<c:if test="${groupDetail.glanguage1 eq 'C++' or
														groupDetail.glanguage2 eq 'C++' or 
														groupDetail.glanguage3 eq 'C++'}"> checked="checked"</c:if>>C++</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="PHP"
							<c:if test="${groupDetail.glanguage1 eq 'PHP' or
														groupDetail.glanguage2 eq 'PHP' or 
														groupDetail.glanguage3 eq 'PHP'}"> checked="checked"</c:if>>PHP</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Spring"
							<c:if test="${groupDetail.glanguage1 eq 'Spring' or
														groupDetail.glanguage2 eq 'Spring' or 
														groupDetail.glanguage3 eq 'Spring'}"> checked="checked"</c:if>>Spring</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="React"
							<c:if test="${groupDetail.glanguage1 eq 'React' or
														groupDetail.glanguage2 eq 'React' or 
														groupDetail.glanguage3 eq 'React'}"> checked="checked"</c:if>>React</label>
					</td>
				</tr>
				<tr>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="TypeScript"
							<c:if test="${groupDetail.glanguage1 eq 'TypeScript' or
														groupDetail.glanguage2 eq 'TypeScript' or 
														groupDetail.glanguage3 eq 'TypeScript'}"> checked="checked"</c:if>>TypeScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Node"
							<c:if test="${groupDetail.glanguage1 eq 'Node' or
														groupDetail.glanguage2 eq 'Node' or 
														groupDetail.glanguage3 eq 'Node'}"> checked="checked"</c:if>>Node.js</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C"
							<c:if test="${groupDetail.glanguage1 eq 'C' or
														groupDetail.glanguage2 eq 'C' or 
														groupDetail.glanguage3 eq 'C'}"> checked="checked"</c:if>>C</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Go"
							<c:if test="${groupDetail.glanguage1 eq 'Go' or
														groupDetail.glanguage2 eq 'Go' or 
														groupDetail.glanguage3 eq 'Go'}"> checked="checked"</c:if>>Go</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Shell"
							<c:if test="${groupDetail.glanguage1 eq 'Shell' or
														groupDetail.glanguage2 eq 'Shell' or 
														groupDetail.glanguage3 eq 'Shell'}"> checked="checked"</c:if>>Shell</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Ruby"
							<c:if test="${groupDetail.glanguage1 eq 'Ruby' or
														groupDetail.glanguage2 eq 'Ruby' or 
														groupDetail.glanguage3 eq 'Ruby'}"> checked="checked"</c:if>>Ruby</label>
					</td>
				</tr>
				<tr><th id="registerInfo" >그룹 시작일<b id="mandatory">*</b></th>
					<td><input type="text" id="sdate" class="sdate" autocomplete="off" name="gsdate" value="${groupDetail.gsdate}"></td>
				</tr>
				<tr><th id="registerInfo" >그룹 완료일<b id="mandatory">*</b></th>
					<td><input type="text" id="edate" class="edate" autocomplete="off" name="gfdate" value="${groupDetail.gfdate}"></td>
				</tr>
				<tr><th id="registerInfo" >지역</th>
					<td><input type="text" autocomplete="off" name="gloc" value="${groupDetail.gloc}"></td>
				</tr>
				<tr>
					<td id="btnContainer" colspan="2">
						<input id="btn" type="submit" value="등록">
						<button id="btn" onclick="location='list.do?pageNum=${param.pageNum}'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){       
    $( "#sdate,#edate" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true,
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
         dateFormat:'yy-mm-dd',
     });
    
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    $('#sdate').datepicker("option", "onClose", function (selectedDate){
        $("#edate").datepicker( "option", "minDate", selectedDate );
        });
    
    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#edate').datepicker("option", "onClose", function (selectedDate){
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
       });
	});
</script>
<script>
	$(document).ready(function(){
		$("input[name='glanguage']").on("click",function(){
			let count = $("input:checked[name='glanguage']").length;
			if(count>3){
				$(this).prop("checked",false);
				alert("3개까지만 선택 할 수 있습니다.");
			}
		})
		$(".gpeople").on("change",function(){
			let number = $(this).val();
			let curpeople = ${groupDetail.gcurpeople};
			if(number<2){
				alert("인원수를 확인해주세요");
				if(number<curpeople){
					$(this).val(curpeople);
				}else{
					$(this).val('2');
				}
			}else if(number<curpeople){
				alert("모집인원이 현재 인원보다 적습니다");
				$(this).val(curpeople);
			}
		})
		$(".gpeople").on("keyup",function(){
			let number = $(this).val();
			let curpeople = ${groupDetail.gcurpeople};
			if(number<2){
				alert("인원수를 확인해주세요");
				$(this).val('2');
			}else if(number<curpeople){
				alert("모집인원이 현재 인원보다 적습니다");
				$(this).val(curpeople);
			}
		})
	  let gdevCheckbox = document.getElementById("gdev-checkbox");
	  let gdesignCheckbox = document.getElementById("gdesign-checkbox");
	  let gpmCheckbox = document.getElementById("gpm-checkbox");
	
	  let gdevInput = document.getElementsByName("gdev")[0];
	  let gdesignInput = document.getElementsByName("gdesign")[0];
	  let gpmInput = document.getElementsByName("gpm")[0];
	
	  gdevCheckbox.addEventListener("change", function() {
	    if (this.checked) {
	      gdevInput.value = "Y";
	    } else {
	      gdevInput.value = "N";
	    }
	  });
	
	  gdesignCheckbox.addEventListener("change", function() {
	    if (this.checked) {
	      gdesignInput.value = "Y";
	    } else {
	      gdesignInput.value = "N";
	    }
	  });
	
	  gpmCheckbox.addEventListener("change", function() {
	    if (this.checked) {
	      gpmInput.value = "Y";
	    } else {
	      gpmInput.value = "N";
	    }
	  });
	  $("form").on("submit", function(event) {
		  if(!$("#gdev-checkbox").prop("checked") && !$("#gdesign-checkbox").prop("checked") && !$("#gpm-checkbox").prop("checked")) {
		    alert("한 가지 이상의 직군을 선택해야 합니다.");
		    event.preventDefault();
		  }
		});
    $("select[name='gcharacter']").change(function(){
        var selectedVal = $(this).val();
	  	  let gdevCheckbox = document.getElementById("gdev-checkbox");
			  let gdesignCheckbox = document.getElementById("gdesign-checkbox");
			  let gpmCheckbox = document.getElementById("gpm-checkbox");
        if(selectedVal === 'P'){
          $('.position').prop('disabled', false);
        } else {
          $('.position').prop('disabled', true);
          $('.position').prop('checked', false)
        }
    });
	});
</script>
</html>