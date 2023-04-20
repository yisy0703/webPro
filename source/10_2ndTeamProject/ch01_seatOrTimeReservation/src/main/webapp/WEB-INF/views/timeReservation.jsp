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
	<style>
    input[type=submit] {
      background-image: url('${conPath}/img/reservation.png');
      background-size: 100%;
      width: 100px;
      height: 70px;
      background-color: white;
    }
  </style>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	  
	</script>
  <script>
  $( function() {
	  var timeList = ${timeList};
    $("#datepicker").datepicker({
      dateFormat: "yy-mm-dd",
      changeMonth: true, // 월을 바꿀 셀렉트박스 생성
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
        '7월', '8월', '9월', '10월', '11월', '12월'],
      changeYear: true, // 년을 바꿀 셀렉트 박스 생성
      yearSuffix: '년',
      showOtherMonths: true,
      showMonthAfterYear: true,
      minDate: 0, // 지난 날은 select 불가
      onSelect: function (dateText, inst) {
        // 날짜를 선택할 경우 수행 콜백함수. 
        // 선택한 날짜는 dateText로
        $('.reservedDate').val(dateText);
        for (var i = 6; i <= 23; i++) {
          $('#' + i).attr('disabled', false);
          $('#' + i).css('color', '#000000');
        }
        $('.result').html(dateText);
        $('.reservedTime').val('');
        // 선택한 날짜가 오늘인지 확인
        var today = new Date(); //2022-08-08
        var year = today.getFullYear(); // 2021
        var month = today.getMonth() + 1; // 2 -> '02'
        if (month < 10) {
          month = '0' + month;
        }
        var day = today.getDate(); // 1 -> '01'
        if (day < 10) {
          day = '0' + day; // '01'
        }
        todayString = year + '-' + month + '-' + day;
        if (dateText == todayString) {
          for (var i = 6; i <= today.getHours()+1; i++) {
           //$('#' + i).attr('disabled', 'disabled');
            $('#' + i).attr('disabled', true);
            $('#' + i).css('color', '#cccccc');
          }
        }
				// 예약된 시간은 disabled
        $(timeList).each(function(idx, item){
        	if(item.rdate == dateText){
        		for (var i = 6; i <= 23; i++) {
        	  	if(item.rtime == i){
        	  		$('#' + i).attr('disabled', 'disabled');
        				$('#' + i).css('color', '#cccccc');
        	  	}
        	  }
        	}
  	  });
      }
    });
  } );
  </script>
  <script>
    $(function () {
      $('#am input').click(function () {
        $('.reservedTime').val($('.reservedTime').val() +
          '오전' + $(this).attr('class') + '시 ');
        
        $('.result').append('오전' + $(this).attr('class') + '시 ');
        $(this).attr('disabled', 'disabled');
        $(this).css('color', 'red');
        $('input[name="reservedTimes"]').val($('input[name="reservedTimes"]').val() + $(this).attr('id') + ' ');
      });

      $('#pm input').click(function () {
        $('.reservedTime').val($('.reservedTime').val() +
          '오후' + $(this).attr('class') + '시 ');
        $('.result').append('오후' + $(this).attr('class') + '시 ');
        $(this).attr('disabled', 'disabled');
        $(this).css('color', 'red');
        $('input[name="reservedTimes"]').val($('input[name="reservedTimes"]').val() + $(this).attr('id') + ' ');
      });
    })
  </script>
</head>
<body>
	예약된 시간 리스트 : ${timeList}<br><br>
	<c:if test="${param.reservationResult eq 'true' }">
		<script>alert('예약완료');</script>
	</c:if>
<br>
  <div id="datepicker"></div>
  <form action="${conPath }/timeReservation.do" method="post">
    <p><b>Date:</b><input type="text" name="rdate" 
                          class="reservedDate"/></p>
    <p><b>시간선택</b></p>
    <table>
      <tr>
        <td id="am">
          <span style="display:block">오전</span>
          <input type="button" id="6" class="6" value="6시" />
          <input type="button" id="7" class="7" value="7시" />
          <input type="button" id="8" class="8" value="8시" />
          <input type="button" id="9" class="9" value="9시" />
          <input type="button" id="10" class="10" value="10시" />
          <input type="button" id="11" class="11" value="11시" />          
        </td>
      </tr>
      <tr>
        <td id="pm">
          <span style="display:block">오후</span>
          <input type="button" id="12" class="12" value="12시" />
          <input type="button" id="13" class="1" value="1시" />
          <input type="button" id="14" class="2" value="2시" />
          <input type="button" id="15" class="3" value="3시" />
          <input type="button" id="16" class="4" value="4시" />
          <input type="button" id="17" class="5" value="5시" />
          <input type="button" id="18" class="6" value="6시" />
          <input type="button" id="19" class="7" value="7시" />
          <input type="button" id="20" class="8" value="8시" />
          <input type="button" id="21" class="9" value="9시" />
          <input type="button" id="22" class="10" value="10시" />
          <input type="button" id="23" class="11" value="11시" />
        </td>
      </tr>
    </table>
    <p>
      <b>Time:</b>
      <input type="text" name="reservedTime" class="reservedTime"
             size="50" />
      <input type="text" name="reservedTimes">
    </p>
    <p><b>예약결과 : </b><span class="result"></span></p>
    <p><input type="submit" value=""/></p>
  </form>

</body>
</html>