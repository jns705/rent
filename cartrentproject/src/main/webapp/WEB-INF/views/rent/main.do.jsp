<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='HH' var="nowHour"/>
<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
<body>
<form action="/counseling/mainProc" method="get" name="proc">
				<div class="spot short type2" style="margin-bottom:50px; height:700px; background-image: url('http://localhost:8082/static/img/자동촤.gif')">
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
											<input onclick="jeju();" type="radio" checked id="jejuQuickReserve" name="quickReserveType" title="제주" value="jeju"   class="sr-only">
											<span class="text">제주</span>
										</label>
									</div>
									<div class="item">
										<label class="label">
											<input onclick="jeju();" type="radio" id="inlandQuickReserve" name="quickReserveType" value="inland" class="sr-only">
											<span class="text">내륙</span>
										</label>
									</div>
									<div class="item">
										<a href="/rent/rentList" class="anchor">중고차</a>
									</div>
								</div>
								
								<style>
.inputDate{
	font-size:15px !important;
	width: 100%;
    height: 42px;
    padding: 10px 20px;
    border:none;
    border-bottom: 1px solid #ddd;
    border-radius: 0;
    background-color: #fff;
    font-size: 14px;
    font-family: NanumBarunGothic;
    box-sizing: border-box;
    color: #333;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    outline: 0;
    transition: background .2s linear 0s,box-shadow .2s linear 0s;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    
    
    background-image: url(/resources/img/spr-common.png);
    background-repeat: no-repeat;
    }
    
    .select-box b{
    background-image: url(http://localhost:8082/static/img/spr-common.png);
    width: 13px;
    height: 7px;
    background-repeat: no-repeat;
    margin-left:-130px;
    margin-top:17px;
    background-position: -1331px -1205px;
    -webkit-background-size: 1347px 1290px;
    background-size: 1347px 1290px;
    text-indent: 1000%;
    white-space: nowrap;
    overflow: hidden;
    position: absolute;
    
    }
</style>

								<div class="fast-reserve-content">
									<div class="option">
										<div class="option-row clearfix">
											<span id="sDateSpan" class="fl" >
												<input class="inputDate" readonly type="text" id="startDate" name="startDate" value="대여일 선택" onchange="changeDate(); changeHour(); todayCheck();">
											</span>
											<span class="select-box fl">
												<select class="inputDate"   name="sHour" id="sHour" class="option01 option02 hour fast-reserve-select" onchange="changeDate(); changeHour();">
												<c:forEach begin="06" end="22" varStatus="status">
													<option value="${status.index}">${status.index} 시 </option>
												</c:forEach>
												</select>
												<b role="presentation"></b>
											</span>
											<span class="select-box fl">
												<select class="inputDate"   name="sMinute" id="sMinute" class="option01 option02 timeChange fast-reserve-select" onchange="changeDate();">
													<option value="00">00 분 </option>
													<option value="30">30 분 </option>
												</select>
												<b role="presentation"></b>
											</span>
											<span class="select-box fl" style="width:100px;">
												<select class="inputDate"   name="sLocation" id="sLocation" class="option01 option02 timeChange fast-reserve-select">
														<option>제주지점</option>
												</select>
												<b role="presentation"></b>
											</span>
										</div>
										<div class="option-row clearfix">
											<span id="lDateSpan" class="fl">
												<input class="inputDate"   readonly type="text" id="endDate" name="endDate" value="반납일 선택" onchange="changeDate();  changeHour();">
											</span>
											<span  class="select-box fl">
												<select class="inputDate"   name="lHour" id="lHour" class="option01 option02 hour fast-reserve-select"  onchange="changeDate();">
												<c:forEach begin="06" end="22" varStatus="status">
													<option value="${status.index}">${status.index} 시</option>
												</c:forEach>
												</select>
												<b role="presentation"></b>
											</span>
											<span class="select-box fl">
												<select class="inputDate"   name="lMinute" id="lMinute" class="option01 option02 timeChange fast-reserve-select" onchange="changeDate();">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
												<b role="presentation"></b>
											</span>
											<span class="select-box fl" style="width:100px;">
												<select class="inputDate"   name="lLocation" id="lLocation" class="option01 option02 timeChange fast-reserve-select">
														<option>제주지점</option>
												</select>
												<b role="presentation"></b>
											</span>
											</div>
										<div class="option-row clearfix">
											<span class="select-box select-box-car fl">
												<select class="inputDate"   id="carTab" name=carKind class="option01 option02 fast-reserve-car-select" onchange="submitable()">
													<c:forEach items="${carKind}" var="carKind">
														<option>${carKind}</option>
													</c:forEach>
												</select>
												<b role="presentation" style="margin-left: -30px;"></b>
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
										<a id="btn_quick" href="#" onclick="proc.submit();" class="btn btn-color1 btn-large">빠른예약</a>
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
</form>
</body>
</html>

<script type="text/javascript">
function jeju(){
	if($('#jejuQuickReserve').prop("checked")){
		$('#sLocation').html('<option>제주지점</option>');
		$('#lLocation').html('<option>제주지점</option>');
	}else if($('#inlandQuickReserve').prop("checked")){
		var str = '<option>서울지점</option><option>인천지점</option><option>대구지점</option><option>부산지점</option>'
		$('#sLocation').html(str);
		$('#lLocation').html(str);
	}
}
</script>
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
                 minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
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
                 //maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
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



    function todayCheck(){
    	var nowDate = '${nowDate}'
    	var nowHour = Number('${nowHour}');
    	//시작날짜가 현재 날짜일 시
    	if(nowDate == $('#startDate').val()){
    		 var str1  = '';
    		 //현재시간+1부터 시작
    	     for(i = nowHour+1; i < 22; i++ ){
    		     str1 += '<option value="'+ i +'">'+ i +'시</option>';
    	     }
    	}else{
    		var str1  = '';
    		//아닐 시 6 ~ 23시 까지
    	     for(i = 6; i < 23; i++ ){
    	    	 str1 += '<option value="'+ i +'">'+ i +'시</option>';
        	 }
    	}
        $('#sHour').html(str1);
        changeHour();
    }
    function changeHour(){
    	//시작날짜와 마지막 날짜가 같을 시
       	if($('#startDate').val() == $('#endDate').val()){
       	   	//마지막 시간을 시작시간+1로 바꾼다
    	   	var hour = Number($('#sHour').val())+1;
    	   	var str  = '';
    	   	for(i = hour; i < 23; i++ ){
    	       str += '<option value="'+ i +'">'+ i +'시</option>';
         	}
    	//아닐 시 06~23시로 바꾼다
        }else{
    		var str  = '';
    		//아닐 시 6 ~ 23시 까지
    	     for(i = 6; i < 23; i++ ){
    	    	 str += '<option value="'+ i +'">'+ i +'시</option>';
        	 }
    	}
       $('#lHour').html(str);
    	   
       changeDate();
    }


  $(document).scrollTop();
//스크롤에 따른 css
  $(window).scroll(function () {
  	var scrollValue = $(document).scrollTop();
  	//스크롤이 맨위에 있을 시
  	if(scrollValue != 0){
  		$('#menuHeader11').css('background-color','white');
  		$('#menuHeader12').css('background-color','white');
  		$('.plh').removeClass('hidden');
  		$('.awaw').attr('style','color:black !important')
  		$('.aa1').attr('style','color:black !important; left: auto; right: 0px; ')
  		$('.aa2').attr('style','color:black !important; left: 60px; width: 100px;')

  	}else{
  		$('#menuHeader11').css('background-color','transparent');
  		$('#menuHeader12').css('background-color','transparent');
  		$('#menuHeader12').css('background-color','transparent');
  		$('.plh').addClass('hidden');
  		$('.awaw').attr('style','color:white !important')
  		$('.aa1').attr('style','color:white !important; left: auto; right: 0px; ')
  		$('.aa2').attr('style','color:white !important; left: 60px; width: 100px;')
  		
  	}});

</script>


</layoutTag:layout>