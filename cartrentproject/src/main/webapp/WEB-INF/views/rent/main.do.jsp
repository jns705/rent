<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>단기 렌터카</title>
</head>
<body>

				<div class="spot short type2">
					<div class="spot-wrapper">
						<div class="heading">
							<h2 class="tit">즐거운 여행의 시작</h2>
							<p class="descp">안전하고 즐거운 여행은 솔렌터카에서 시작됩니다.</p>
						</div>
						
						<div class="fast-reserve">
							<div class="fast-reserve-wrap">
								<div class="fast-reserve-tab">
									<div class="item">
										<label class="label">
											<input type="radio" id="jejuQuickReserve" name="quickReserveType" title="제주" value="jeju" checked class="sr-only">
											<span class="text">제주</span>
										</label>
									</div>
									<div class="item">
										<label class="label">
											<input type="radio" id="inlandQuickReserve" name="quickReserveType" value="inland" class="sr-only">
											<span class="text">내륙</span>
										</label>
									</div>
									<div class="item">
										<a href="/rent/long/direct/sub_main_integration.do?tabId=USEDCAR&searchProdList=000003,000023&startIndex=1&endIndex=10&orderbyColumnNm=STD_RENT_AMT_ASC" class="anchor">중고차</a>
									</div>
								</div>
								<div class="fast-reserve-content">
									<div class="option">
										<div class="option-row clearfix">
											<span id="sDateSpan" class="fl" >
												<input type="text" id="startDate" value="대여일 선택" onchange="changeDate();">
											</span>
											<span class="select-box fl">
												<select name="sHour" id="sHour" class="option01 option02 hour fast-reserve-select" onchange="changeDate();">
												<c:forEach begin="06" end="22" varStatus="status">
													<option value="${status.index}">${status.index} 시</option>
												</c:forEach>
												</select>
											</span>
											<span class="select-box fl">
												<select name="sMinute" id="sMinute" class="option01 option02 timeChange fast-reserve-select" onchange="changeDate();">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
											<span class="select-box fl">
												<select name="" id="" class="option01 option02 timeChange fast-reserve-select">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
										</div>
										<div class="option-row clearfix">
											<span id="lDateSpan" class="fl">
												<input type="text" id="endDate" value="반납일 선택" onchange="changeDate();">
											</span>
											<span  class="select-box fl">
												<select name="lHour" id="lHour" class="option01 option02 hour fast-reserve-select"  onchange="changeDate();">
												<c:forEach begin="06" end="22" varStatus="status">
													<option value="${status.index}">${status.index} 시</option>
												</c:forEach>
												</select>
											</span>
											<span class="select-box fl">
												<select name="lMinute" id="lMinute" class="option01 option02 timeChange fast-reserve-select" onchange="changeDate();">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
											<span class="select-box fl">
												<select name="" id="" class="option01 option02 timeChange fast-reserve-select">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
											</div>
										<div class="option-row clearfix">
											<span class="select-box select-box-car fl">
												<select id="carTab" name=carTab class="option01 option02 fast-reserve-car-select" onchange="submitable()">
													<option value="">차량 선택</option>
													<option value="1">소형</option>
													<option value="2">중형</option>
													<option value="3">대형</option>
													<option value="4">승합차</option>
													<option value="5">SUV</option>
													<option value="6">수입/전기차</option>
												</select>
											</span>
										</div>
									</div>
									<div class="time-area">
										<strong class="title">총 대여시간</strong>
										<p class="time">
											<span id="ddd">0</span>일
											<span id="hhh">0</span>시간
											<span id="mmm">0</span>분
										</p>
									</div>
									<div class="btn-box">
										<!-- 대여/반납 기간, 지점 선택 완료 시 disable 삭제 부탁 드립니다. -->
										<a id="btn_quick" href="javascript:void(0);" class="btn btn-color1 btn-large" onclick="go_resv(this)">빠른예약</a>
									</div>
									<div class="helper">
										<span class="tooltip">
											실시간 예약
											<a href="#modal-reward-system" class="btn-modal btn-tooltip">확인</a>
										</span>
										
											
												<a href="/rent/rentcar/short_rent_reservation_confirm.do" class="btn-reserve-confirm">예약확인</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(sta	rtDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
    
    function changeDate() {
        if($('#startDate').val() != '대여일 선택' && $('#endDate').val() != '반납일 선택'){
    	var sdt = new Date($('#startDate').val());
    	var edt = new Date($('#endDate').val());
    	var stemp = -1;
    	if(sdt == edt) stemp = 0;
    	var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24))+stemp;
    	if (dateDiff == 'Invalid Date') dateDiff = 0;

    	var lHour 	= Number($('#lHour').val());
    	var lMinute = Number($('#lMinute').val());
    	var sHour 	= Number($('#sHour').val());
    	var sMinute = Number($('#sMinute').val());
    	var temp = 0;
		var minute = 0;
    	if(lMinute + sMinute == 60)
        	temp = 1;
    	if(lMinute + sMinute == 30)
        	minute = 30;
    	var hour = 24 - sHour + lHour + temp;
		
    	if(hour > 23){
        	hour 	 -= 24;
        	dateDiff += 1;
       	}
    	$('#ddd').html(dateDiff);
    	$('#mmm').html(minute);
    	$('#hhh').html(hour);
       }
    }



    $('#sHour').change(function(){
        if($('#startDate').val() == $('#endDate').val()){
        var hour = Number($('#sHour').val())+1;
        var str  = '';
        for(i = hour; i < 23; i++ ){
            str += '<option value="'+ i +'">'+ i +'시</option>';
        }
        $('#lHour').html(str);
        }
    });
</script>


</layoutTag:layout>