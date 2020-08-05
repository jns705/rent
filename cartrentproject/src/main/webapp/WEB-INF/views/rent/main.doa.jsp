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
<body style="max-width: 9999px;">
<form action="/counseling/mainProc" method="get" name="proc">
				<div class="spot short type2 main" style="margin-bottom:50px; height:700px; background-image: url('http://localhost:8082/static/img/자동차1.jpg'); background-repeat: no-repeat;">
<script type="text/javascript">
//윈도우 크기 바뀔 때 마다
$(document).ready(function(){
    $(window).resize(resizeContents);
    resizeContents();
});

function resizeContents() {
    $(".main").height($(window).height());$("#section-1").width($(window).width());
    $('.main').css("background-size", $(window).width()+50+"px "+ $(window).height() + "px");
}
</script>
<div class="spot long">
					<div class="spot-wrapper">
						<div class="heading">
							<h2 class="tit">똑똑한 선택 SK 장기렌터카</h2>
							<p class="descp">더 좋은 자동차를 갖는 최적의 장기렌터카 솔루션</p>
						</div>
					</div>
					<!-- [S] 2018-01-25 변경 -->
					<!-- 임시오픈을 위한 주석처리 -->
					<form name="frm" id="frm" action="" method="post">
					<div class="car-search" role="search">
						<input type="hidden" name="tabId" id="tabId" value="NEWCAR">
						<input type="hidden" name="prodId" id="prodId" value="000048">
						<input type="hidden" name="carMakerId" id="carMakerId" value="">
						<input type="hidden" name="carSgmntTypeCd" id="carSgmntTypeCd" value="">
						<input type="hidden" name="cartypeId" id="cartypeId" value="">
						<div class="car-search__wrapper clearfix" style="background:white; height:100px;">
							<div class="option-radio">
								<div class="item" onclick="location.href='/rent/NewRentList'">
									<label>
										<input type="radio" name="carSearchType" title="신차 렌터카 검색"  class="sr-only">
										<em class="title" style="width:500px;">신차 렌터카 검색</em>
									</label>
								</div>
								<div class="item">
									<label>
										<input type="radio" name="carSearchType" title="중고차 렌터카 검색"  checked class="sr-only">
										<em class="title" style="width:500px; margin-left:355;">중고차 렌터카 검색</em>
									</label>
								</div>
							</div>
							
							<style>
							.inputDate{
	font-size:15px !important;
	width: 90% !important;
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
    
    .btnda{
    height: 40px !important;
    width: 130 !important;
    margin-top: 15 !important;
    line-height:2	 !important;
    }
</style>
							<div class="panel is-selected search_input" style="border:none;"> <!-- 중고차 -->
								<div class="select-area fl" style=" padding-top: 20; padding-left: 30;">
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarMakerId" id="usedCarMakerId" class="option01 option02 inputDate" tabindex="-1" aria-hidden="true">
											<option value="">제조사 선택</option>
											
												<option value="HD">현대자동차</option>
											
												<option value="KI">기아자동차</option>
											
												<option value="DW">GM대우자동차</option>
											
												<option value="SM">르노/삼성자동차</option>
											
												<option value="BM">BMW</option>
											
												<option value="DT">도요타</option>
											
												<option value="BE">벤츠</option>
											
										</select>
			                        </span>
									</div>
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarSgmntTypeCd" id="usedCarSgmntTypeCd" class="option01 inputDate" disabled="" tabindex="-1" aria-hidden="true">
											<option value="">차량 유형 선택</option>
												
										</select>
			                        </span>
									</div>
									<div class="select-col col-3">
					                    <span class="select-box">
											<select name="usedCartypeId" id="usedCartypeId" class="option01 inputDate" disabled="" tabindex="-1" aria-hidden="true">
												<option value="">차량 선택</option>
												
											</select>
					                    </span>
									</div>
								</div>
								<div class="btn-wrap fr">
									<a href="#" class="btn btn-color2 btnda" onclick="goUsedSelectSubmit();">검색</a>
								</div>
							</div>	
							<!-- //190621 -->						
						</div>
					</div>
					</form>
					<!-- [S] 2018-01-25 변경 -->
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
                     $("#endDate").focus();
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
  		$('.awaw').attr('style','color:black !important; text-decoration: none;' )
  		$('.aa1').attr('style','color:black !important; left: auto; right: 0px; text-decoration: none;')
  		$('.aa2').attr('style','color:black !important; left: 60px; width: 100px; text-decoration: none;')

  	}else{
  		$('#menuHeader11').css('background-color','transparent');
  		$('#menuHeader12').css('background-color','transparent');
  		$('#menuHeader12').css('background-color','transparent');
  		$('.plh').addClass('hidden');
  		$('.awaw').attr('style','color:white !important text-decoration: none;')
  		$('.aa1').attr('style','color:white !important; left: auto; right: 0px; text-decoration: none;')
  		$('.aa2').attr('style','color:white !important; left: 60px; width: 100px; text-decoration: none;')
  		
  	}});

</script>


</layoutTag:layout>