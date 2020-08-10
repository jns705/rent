<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<script type="text/javascript">

//날짜에 따른 시간 변경 
//금일일시 현재시간 + 1
//시작날짜 마지막날짜가 같을 시 마지막시간을 시작시간 + 1로 맞춘다
function todayCheck(){
	var nowDate = $('#nowDate').val();
	var nowHour = Number($('#nowHour').val());
	//시작날짜가 현재 날짜일 시
	if(nowDate == $('#startDate').val()){
		 var str1  = '';
		 //현재시간+1부터 시작
	     for(i = nowHour+1; i < 22; i++ ){
		     if(i < 10) i = "0"+i;
		     str1 += '<option value="'+ i +'">'+ i +'시</option>';
	     }
	}else{
		var str1  = '';
		//아닐 시 6 ~ 23시 까지
	     for(i = 6; i < 23; i++ ){
		     if(i < 10) i = "0"+i;
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
		     if(i < 10) i = "0"+i;
	       str += '<option value="'+ i +'">'+ i +'시</option>';
   	}
	//아닐 시 06~23시로 바꾼다
  }else{
		var str  = '';
		//아닐 시 6 ~ 23시 까지
	     for(i = 6; i < 23; i++ ){
		     if(i < 10) i = "0"+i;
	    	 str += '<option value="'+ i +'">'+ i +'시</option>';
  	 }
	}
 $('#lHour').html(str);
	   
 changeDate();
}



$(document).ready(function () {
	changeDate();
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
       minDate: 0,           
       //maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
       onClose: function( selectedDate ) {    
           // 종료일(endDate) datepicker가 닫힐때
           // 시작일(sta	rtDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
           $("#startDate").datepicker( "option", "maxDate", selectedDate );
       }    

  });    
});

//대여시간 구하기
function changeDate() {
//시작날짜와 마지막 날짜를 가져온다
var sdt = new Date($('#startDate').val());
var edt = new Date($('#endDate').val());
//식별자
var stemp = -1;
//둘의날짜가 같은경우 stemp = 0
if(sdt == edt) stemp = 0;
//날짜의 차이를 구하여 stemp를 더한다
var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24))+stemp;
//값이 Invalid Date일 시(24시간 미만) 0일
if (dateDiff == 'Invalid Date') dateDiff = 0;

//시간 분을 가져온다
var lHour 	= Number($('#lHour').val());
var lMinute = Number($('#lMinute').val());
var sHour 	= Number($('#sHour').val());
var sMinute = Number($('#sMinute').val());
var temp = 0;
var minute = 0;
//분 합쳐서 60일경우 시간에 +1
//합쳐서 30인 경우는 분을 30
if(lMinute + sMinute == 60)
	temp = 1;
if(lMinute + sMinute == 30)
	minute = 30;

//대여 시간을 구한다
var hour = 24 - sHour + lHour + temp;

//대여시간이 24시간 이상일 경우 날짜에 1을 더한다
if(hour > 23){
	hour 	 -= 24;
	dateDiff += 1;
	}
//각자 값을 넣는다.
$('#ddd').html(dateDiff); $('#mmm').html(minute); $('#hhh').html(hour);
$('[name=rental_time]').val(dateDiff+'_'+hour+'_'+minute);
if(isNaN(dateDiff)){ $('#ddd').html('0');} 

}
</script>

<script type="text/javascript">
	//숫자에 콤마를 찍는 정규식
   function numberFormat(inputNumber) {
   	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }

   //차량 가격
   function carPrice(car_name, rent_id, price, index){

		$('.tab-content').css('border', '1px solid #ddd');
		$('.spamM').css('display','none');
		
	   if(rent_id != null) $('#rent_id').val(rent_id);
	   //차가격이 없을 시 컨트롤러에서 가져온다
       if(price == null) price = $('#realPrice').html();
       //날짜를 가져오되 0일 시 계산을 위해 1로 바꾼다
       var ddd = Number($('#ddd').html()); if(ddd==0) ddd = 1;
       var hhh = Number($('#hhh').html()); if(hhh==0) hhh = 1;
       var mmm = Number($('#mmm').html()); if(mmm==0) mmm = 1;
       //시간에 따른 가격을 구한다.
       var time = (price/30 * ddd) + (price/30/24 * hhh) + (price/30/24/72 * mmm);
       //컨트롤러에서 가져온 시간을 realPrice에 넣는다
       $('#realPrice').html(price);
       //계산한 값을 보여준다 세자리 이하 내림
       $('#rentPayment').html(numberFormat(Math.ceil(time/1000)*1000));
       $('#rateAmt').html(numberFormat(Math.ceil(time/1000)*1000));
       //모든 글씨의 선택CSS를 제거한다
       $('[name=carI]').removeClass('cl-point1 wg-bold');
       //해당 글씨에 CSS(class값)를 넣는다.
       $('.'+index).addClass('cl-point1 wg-bold');
       //퀵하단 메뉴에 값을 넣는다
       var email = "";
       if($('#email1').val() != "") email = "@"+ $('#email1').val();
       
	   if($('#startDate').val() != '대여일 선택')
       $('#s_date_end').html($('#startDate').val()+" "+ $('[name=sHour]').val() + "시 " + $('[name=sMinute]').val() + "분");
	   if($('#endDate').val() != '반납일 선택')
       $('#e_date_end').html($('#endDate').val()+" "+ $('[name=lHour]').val() + "시 " + $('[name=lMinute]').val() + "분");
	   $('#sel2_che').html($('#location').val());
	   $('#sel2_che2').html($('[name=end_location]').val());
	   $('#modelNm').html(car_name);
	   $('#reservNm').html($('[name=name]').val());
	   $('#reservHp').html($('[name=tel]').val());
	   $('#reservBirth').html($('#birth').val());
	   $('#reservEmail').html($('#emailId').val()+email);
	   
   }
   //시작 시 로딩
   selectCar();

   //차량선택 메뉴 ajax
   function selectCar(){
		$.ajax({
			url  	: '${path}/counseling/short_rentDetail',
			type 	: 'get',
			data	: $('[name=insertForm]').serialize(),
			success : function(data){
				var str = "";
				str += '<div class="header-group">'+
		                 '<h3 id="sCar">차량 선택 <p>예약완료된 차량은 선택이 불가합니다.</p></h3></div>'+
		                 '<div class="article-content">'+
		                     '<div class="rent-car-select" id="alert-cartype">'+
		                        	'<div class="tab-menu v2"><ul><li class="c0 col-7';
		                 if($('#kindCar').val() == '차량 선택' || $('#kindCar').val() == "") str += ' selected ';
		                 str += '" ><a onclick="selectMenu(0);">전체</a></li>';
				$.each(data.carKind, function(key, value){
					str += '<li class="c'+ (key+1) +' col-7';
		                  if($('#kindCar').val() == value ) str += ' selected ';
					str += '"><a onclick="selectMenu('+ (key+1) +');">'+ value +'</a></li>';
				});
				str += '</ul></div>';
		
				str += '<div id="car-type0" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a0, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ', \'a' + key +'\');" name="carI" class="a'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type1" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a1, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ', \'b' + key +'\')" name="carI"  class="b'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type2" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a2, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ', \'c' + key +'\')" name="carI"  class="c'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type3" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a3, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ',  \'d' + key +'\')" name="carI"  class="d'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type4" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a4, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ', \'e' + key +'\')" name="carI"  class="e'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type5" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a5, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ',  \'f' + key +'\')" name="carI"  class="f'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
				str += '<div id="car-type6" class="tab-content bg-line1" ><ul class="carList openPop">';
				$.each(data.a6, function(key, value){
					str += '<li><a href="javascript:void(0);"';
					if(value.situation != '예약가능') str += ' class="cl-thin"> ';	
					else str += ' onclick="carPrice(\''+ value.car_name +'\','+ value.rent_id + ','+ value.price + ',  \'g' + key +'\')" name="carI"  class="g'+key+'">';					
					str += value.car_name+'</a></li>';
				});
				str += '</ul></div>';
				
		
				$('#selectCar').html(str);
				
				carPrice();
			}
		});
    }
</script>



<script type="text/javascript">
//모두 동의 체크박스
function checkBox(){
	//체크박스가 전부 체크일 시 체크박스를 풀고 아닐시 선택으로 바꾼다
	if($("input:checkbox[name=is_check]:checked").length == 5)
	$("input[name=is_check]:checkbox").attr("checked", false);
	else
	$("input[name=is_check]:checkbox").prop("checked", true);
}

function boxCheck(){
//다른 5개의 체크박스가 모두 선택됬을 시 모두동의 체크박스를 체크 아닐 시 반대
	if($("input:checkbox[name=is_check]:checked").length == 5)
		$("input[id='term-check-all']:checkbox").attr("checked", true);
	else
		$("input[id='term-check-all']:checkbox").attr("checked", false);
}


//이용약관 CSS
function btnSlide(id){
	//모든 약관을 숨긴다
	for(i=1; i < 7; i++){$('#a'+i).slideUp();}
	//약관이 숨겨져있을 경우 보여준다 아닐 시 반대
    if		($('#'+id).is(":visible")) $('#'+id).slideUp();
    else  	$('#'+id).slideDown();
}    
</script>




<script type="text/javascript">
//주소를 가져오기 위한 검색
function daumZipCode(){
	new daum.Postcode({	
		oncomplete : function(data){
		//팝업에서 검색한 결과 항목을 클릭하였을 경우 실행할 코드를 작성하는 부분이다.

		//각주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = '';		//최종 주소
        var	extraAddr = '';		//조합형 주소 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if(data.userSelectedType == 'R'){	//도로명 주소를 선택할 경우
			fullAddr = data.roadAddress;
        } else {							//지번 주소를 선택한 경우
			fullAddr = data.jibunAddress;
        }

		//사용자가 선택한 주소가 도로명 타입일 때 조합한다.
		if(data.userSelectedType == 'R'){
			//법정동명이 있을 경우 추가한다.
			if(data.bname != ''){
				extraAddr += data.bname;
			}
			//건물명이 있을 경우 추가한다.
			if(data.buildingName != ''){
				extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
			}
			//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			fullAddr += (extraAddr != '' ? ' (' + extraAddr + ')' : '' );
		}

		//우편번호와 주소정보를 해당 필드에 넣는다.
		document.getElementById('zipcode').value 	= data.zonecode;	//5자리 새 우편 번호
		document.getElementById('address').value 	= fullAddr;		//주소

		//커서를 상세주소 입력 필드로 이동한다.
		document.getElementById('addressDetail').focus();

		}
  	}).open();
	
	
}
</script>

<script type="text/javascript">
function topaa() {
	$('html, body').animate({scrollTop : 0}, 400);
	return false;
}


$(window).scroll(function() {
	if ($(this).scrollTop() > 400) $('#aaaaaa').fadeIn();
	else $('#aaaaaa').fadeOut();
});




//footerSHeight값 이상일시 class를 바꾼다
$(window).scroll(function () {
    var windowHeight = $(window).height();				// Viewport Height
    var documentHeight = $(document).height();			// Viewport Height
    var footerHeight = $('#footers').height();
    var footerSHeight = documentHeight - windowHeight - 274;
	var scrollValue = $(document).scrollTop();
	console.log('스크롤'+scrollValue + ' 푸터' + footerSHeight + ' 도큐' + documentHeight + ' 윈도우' +  windowHeight + ' ' );
	if(scrollValue > footerSHeight){
		$('.ticker-info').addClass("off");
		$('.quick-top').attr('style','position:absolute');
		$('#aaaaaa').css('margin-top','110px');
	}else{
		$('.ticker-info').removeClass("off");
		$('.quick-top').attr('style','position:fixed');
		$('#aaaaaa').css('margin-top','');
	}
});




//차량 선택 시 CSS, class 값 변경	
function selectMenu(data){
	for(i=0; i < 7; i++){
		$('#car-type'+i).css("display","none");
		$('.c'+i).removeClass("selected");
	}
	$('#car-type'+data).css("display","block");
	$('.c'+data).addClass("selected");
}

//하단 퀵메뉴 CSS
function tickerHead(){
	if($('#tH').html() == '<br><span class="glyphicon glyphicon-menu-up glyphicons"></span><br>더보기'){
		$('.ticker-info').animate({bottom: '0px'}, 500, 'swing');
		$('#tH').html('<br><span class="glyphicon glyphicon-menu-down glyphicons"></span><br>닫기');
	} else{
		$('.ticker-info').animate({bottom: '-545px'}, 500, 'swing');
		$('#tH').html('<br><span class="glyphicon glyphicon-menu-up glyphicons"></span><br>더보기');
	}
}

$(document).click(function(e){
	if($('#tH').html() == '<br><span class="glyphicon glyphicon-menu-down glyphicons"></span><br>닫기'){
		    if( !$('#tinfo').has(e.target).length ){
				$('.ticker-info').animate({bottom: '-545px'}, 500, 'swing');
				$('#tH').html('<br><span class="glyphicon glyphicon-menu-up glyphicons"></span><br>더보기');
		    }	
	}
});


//이메일 선택 시 메일 값을 넣는다
function emailInput(){
	$('#email1').val($('#email2').val());
}
</script>



<script type="text/javascript">
//유효성 검사
function checkForm(){
	var ck = true;
if($('#startDate').val() == '대여일 선택' || $('#startDate').val() == ''){
	$('#startDate').focus();
	ck = false;
	return false;
}if($('#endDate').val() == '반납일 선택' || $('#endDate').val() == ''){
	$('#endDate').focus();
	ck = false;
	return false;
}
var offset = $("#selectCar").offset();

if($('#modelNm').html()==''){
	$('.tab-content').css('border', '1px solid #f68121');
	$('.spamM').css('display','block');
	ck = false;

}
if(ck==false){
	$('html, body').animate({scrollTop : offset.top-110}, 400);
	return false;
}
if($('[name=name]').val().length < 4){
	$('[name=name]').css('border-color','#f68121');
	$('[name=birthday]').css('border-left','1px solid #f68121');
	$('#span-name').html('이름은 세자리 이상 입력해주세요');
	ck = false;
}
if(!$('[name=name]').val()){
	$('[name=name]').css('border-color','#f68121');
	$('[name=birthday]').css('border-left','1px solid #f68121');
	ck = false;
}



if($('[name=birthday]').val().length != 8){
	$('[name=birthday]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	$('#span-birth').html('생년월일은 여덟자리를 입력해주세요');
	ck = false;
}
if(!$('[name=birthday]').val()){
	$('[name=birthday]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	ck = false;
}


if($('[name=tel]').val().length < 10){
	$('[name=tel]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	$('#span-mobile').html('전화번호는 9자리 이상 입력해주세요');
	ck = false;
}
if(!$('[name=tel]').val()){
	$('[name=tel]').css('border-color','#f68121');
	ck = false;
}

if(!$('[name=emailId]').val()){
	$('[name=emailId]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	ck = false;
}
if($('[name=emailId]').val().length < 5){
	$('[name=emailId]').css('border-color','#f68121');
	$('[name=emailId]').css('border-left','1px solid #f68121');
	$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	ck = false;
}

if(!$('[name=domain]').val()){
	$('[name=domain]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	ck = false;
}
if($('[name=domain]').val().length < 5){
	$('[name=domain]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	ck = false;
}




if(!$('[name=addressDetail]').val()){
	$('[name=addressDetail]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	ck = false;
}if($('[name=addressDetail]').val().length < 5){
	$('[name=addressDetail]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	$('#span-address').html('주소는 5자리 이상 입력해주세요');
	ck = false;
}

if(!$('[name=address]').val()){
	$('[name=address]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	ck = false;
}if($('[name=address]').val().length < 5){
	$('[name=address]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	$('#span-address').html('주소를 입력해주세요');
	ck = false;
}
if(ck==false){
	$('html, body').animate({scrollTop : offset.top+300}, 400);
	return false;
}

$('.spamS').css('font-size','14px');

if(ck){
	if($('input:checkbox[id=term-check-all]').is(':checked'))
	insertForm.submit();
	else{
		alert("모든 항목에 동의를 하셔야 회원가입이 가능합니다.");
	    var offset = $("#allcheck").offset();
	    $('html, body').animate({scrollTop : offset.top-200}, 400);
		$('#sp').css('color','#f68121');
	}
}
}

//이름 검사(정규식)
function isNameCheck(input) {
	var var_normalize 	= /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;  //정규식
	if(var_normalize.test(input))	return false;
	else						 	return true;
}//End - function isNameCheck(inputVal)

//숫자정규식
function isNameCheckNum(input){	
	var checkNum = /^[0-9]*$/;
	if(!checkNum.test(input))return true;
	else false;
}
//영어숫자정규식
function engCheck(input){	
	var checkNum = /^[a-zA-Z0-9]*$/;
	if(!checkNum.test(input))return true;
	else false;
}


function idCheck(){
	if(!isNameCheck($('[name=name]').val())){
		$('[name=name]').val( $('[name=name]').val().substring(0,$('[name=name]').val().length-1));
	}
	if($('[name=name]').val().length < 4){
		$('[name=name]').css('border-color','#f68121');
		$('[name=birthday]').css('border-left','1px solid #f68121');
		$('#span-name').html('이름은 세자리 이상 입력해주세요');
	}else{
		$('[name=name]').css('border-color','#ddd');
		if($('[name=birthday]').css('border-top') != '1px solid rgb(246, 129, 33)')
		$('[name=birthday]').css('border-left','1px solid #ddd');
		$('#span-name').html('');
	}
}
function birthCheck(){
	if(isNameCheckNum($('[name=birthday]').val())){
		$('[name=birthday]').val( $('[name=birthday]').val().substring(0,$('[name=birthday]').val().length-1));
	}if($('[name=birthday]').val().length != 8){
		$('[name=birthday]').css('border-color','#f68121');
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-birth').html('생년월일은 여덟자리를 입력해주세요');
	}else{
		$('[name=birthday]').css('border-color','#ddd');
		if($('[name=name]').css('border-top') != '1px solid rgb(246, 129, 33)')
			$('[name=birthday]').css('border-left','1px solid #ddd');
		else $('[name=birthday]').css('border-left','1px solid #f68121');


		if($('[name=tel]').css('border-top') != '1px solid rgb(246, 129, 33)')
			$('[name=tel]').css('border-left','1px solid #ddd');
		else $('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-birth').html('');
	}
}

function telCheck(){
	if(isNameCheckNum($('[name=tel]').val()) || $('[name=tel]').val().substring(0,1) != 0){
		$('[name=tel]').val( $('[name=tel]').val().substring(0,$('[name=tel]').val().length-1));
	}
	if($('[name=tel]').val().length < 10){
		$('[name=tel]').css('border-color','#f68121');
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-mobile').html('전화번호는 9자리 이상 입력해주세요');
	}else{
		$('[name=tel]').css('border-color','#ddd');
		if($('[name=birthday]').css('border-top') != '1px solid rgb(246, 129, 33)')
		$('[name=tel]').css('border-left','1px solid #ddd');
		else  
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-mobile').html('');
	}
}

function emailCheck(){
	if(engCheck($('[name=emailId]').val())){
		$('[name=emailId]').val( $('[name=emailId]').val().substring(0,$('[name=emailId]').val().length-1));
	}
	if($('[name=emailId]').val().length < 5){
		$('[name=emailId]').css('border-color','#f68121');
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	}else{
			$('[name=emailId]').css('border-color','#ddd');
			if($('[name=domain]').css('border-top') != '1px solid rgb(246, 129, 33)')
		$('[name=domain]').css('border-left','1px solid #ddd');
		$('#span-email').html('');
	}
}

function emailCheck1(){
	if(engCheck($('[name=domain]').val())){
		$('[name=domain]').val( $('[name=domain]').val().substring(0,$('[name=domain]').val().length-1));
	}
	if($('[name=domain]').val().length < 5){
		$('[name=domain]').css('border-color','#f68121');
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	}else{
		$('[name=domain]').css('border-color','#ddd');
		if($('[name=emailId]').css('border-top') == '1px solid rgb(246, 129, 33)')
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('');
	}
}
function addressCheck(){

	if($('[name=addressDetail]').val().length < 5){
		$('[name=addressDetail]').css('border-color','#f68121');
		$('[name=addressDetail]').css('border-left','1px solid #f68121');
		$('#span-address').html('상세주소는 5자리 이상 입력해주세요');
	}else{
		$('[name=addressDetail]').css('border-color','#ddd');
		if($('[name=address]').css('border-top') == '1px solid rgb(246, 129, 33)')
		$('[name=addressDetail]').css('border-left','1px solid #f68121');
		$('#span-address').html('');
	}

	if($('[name=address]').val()){
		$('[name=address]').css('border-color','#ddd');
		if($('[name=addressDetail]').css('border-top') != '1px solid rgb(246, 129, 33)')
		$('[name=addressDetail]').css('border-left','1px solid #ddd');
	}
	
}


</script>
