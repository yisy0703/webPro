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
<style>
	#content{width:700px;	margin:0 auto;}
 	#checkbox{margin-right:30px;}
	#registerInfo {
		width:150px;
		font-size: 0.9em;
		font-weight: 900;
		padding: 0 0.75em 0.75em 0.75em;
		text-align: center;
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
	.position{width:50px;}
</style>
</head>
<body>
	<c:set var="SUCCESS" value="1"></c:set>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<form action="${conPath }/group/register.do" method="post">
			<input type="hidden" name="method" value="register">
			<table>
				<tr>
					<th id="registerInfo">제목<b id="mandatory">*</b></th>
					<td><input type="text" autocomplete="off" name="gtitle" required="required" maxlength="80"></td>
				</tr>
				<tr>
					<th id="registerInfo">내용<b id="mandatory">*</b></th>
					<td><textarea rows="10" autocomplete="off" cols="10" name="gcontent" required="required"></textarea></td>
				</tr>
				<tr>
					<th rowspan="2" id="registerInfo">모집 구분<b id="mandatory">*</b></th>
					<td>
						<select name="gcharacter">
							<option value="S" selected="selected">스터디</option>						
							<option value="P">프로젝트</option>						
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
					<th id="registerInfo">모집 인원<b id="mandatory">*</b></th>
					<td>
						<input class="gpeople" type="number" autocomplete="off" min="2" name="gpeople" required="required" value=2>명
						<span id="peopleInfo">최소 2명부터 입력 가능</span>
					</td>
				</tr>
				<tr>
					<th id="registerInfo" class="exception" rowspan="2">사용 언어</th>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Python">Python</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Java">Java</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="JavaScript">JavaScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C++">C++</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="PHP">PHP</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Spring">Spring</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="REACT">REACT</label>
					</td>
				</tr>
				<tr>
					<td>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Node.js">Node.js</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="TypeScript">TypeScript</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="C">C</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Go">Go</label>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Shell">Shell</label><br>
						<label id="checkbox"><input type="checkbox" name="glanguage" value="Ruby">Ruby</label>
					</td>
				</tr>
				<tr><th id="registerInfo">그룹 시작일<b id="mandatory">*</b></th>
					<td><input type="text" id="sdate" autocomplete="off" class="sdate" name="gsdate" required="required" value="2023-05-02"></td>
				</tr>
				<tr><th id="registerInfo">그룹 완료일<b id="mandatory">*</b></th>
					<td><input type="text" id="edate" autocomplete="off" class="edate" name="gfdate" required="required"  value="2023-05-22"></td>
				</tr>
				<tr><th id="registerInfo">지역</th>
					<td><input type="text" autocomplete="off" name="gloc" value="서울"></td>
				</tr>
				<tr><td id="btnContainer" colspan="2">
					<input id="btn" type="submit" value="등록">
					<button id="btn" onclick="location='groupList.do?pageNum=1'">목록</button>
				</td></tr>
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
         monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
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
			if(number<2){
				alert("인원수를 확인해주세요");
				$(this).val('2');
			}
		})
		$(".gpeople").on("keyup",function(){
			let number = $(this).val();
			if(number<2){
				alert("인원수를 확인해주세요");
				$(this).val('2');
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

    $("select[name='gcharacter']").change(function(){
     	let selectedVal = $(this).val();
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
    $("form").on("submit", function(event) {
   	  let gcharacter = $("select[name='gcharacter']").val();
   	  if(gcharacter == 'P'){
   	    if(!$("#gdev-checkbox").prop("checked") && !$("#gdesign-checkbox").prop("checked") && !$("#gpm-checkbox").prop("checked")) {
   	      alert("한 가지 이상의 직군을 선택해야 합니다.");
   	      event.preventDefault();
   	    }
   	  }
   	});
	});
</script>
</html>