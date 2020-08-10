/**
 * 
 */
//윈도우 크기 바뀔 때 마다
$(document).ready(function(){
    $(window).resize(resizeContents);
    resizeContents();
});

function resizeContents() {
	var height = $(window).height();
	var width = $(window).width();
    $("#section-1").height(height);$("#section-1").width(width);
    $("#section-2").height(height);$("#section-2").width(width);
    $("#section-3").height(height);$("#section-3").width(width);
    $('#section-1').css("background-size", width+"px "+ height + "px");
    $('#section-2').css("background-size", width+"px "+ height + "px");
    $('#section-3').css("background-size", width+"px "+ height + "px");
}




//메인 호버
$('.white_div').hover(function() {
	$(this).addClass("hover-border");
	}, function(){
		$(this).removeClass("hover-border");
});
 $(function(){
	$(".white_div").hover(function(){
		$(this).addClass("hover-border");
	}, function(){
		$(this).removeClass("hover-border");
	});
	
	// 200528 추가
	$(".tesla-ovet-event").hover(function(){
		$(".tesla-event-box").show();
	}, function(){
		$(".tesla-event-box").hide();
	});
	
	$(".over-event").hover(function(){
		$(".event-long-box").show();
	}, function(){
		$(".event-long-box").hide();
	});
	
	$(".used-over-event").hover(function(){
		$(".used-event-long-box").show();
	}, function(){
		$(".used-event-long-box").hide();
	});

	$(".over-jeju").hover(function(){
		$(".new-jeju-box").show();
	}, function(){
		$(".new-jeju-box").hide();
	});	

	$(".tesla-event-box").hover(function(){
		$(this).show();
		$(".tesla-ovet-event").addClass("hover-border");
	}, function(){
		$(this).hide();
		$(".tesla-ovet-event").removeClass("hover-border");
	});
	
	$(".used-event-long-box").hover(function(){
		$(this).show();
		$(".used-over-event").addClass("hover-border");
	}, function(){
		$(this).hide();
		$(".used-over-event").removeClass("hover-border");
	});

	$(".event-long-box").hover(function(){
		$(this).show();
		$(".over-event").addClass("hover-border");
	}, function(){
		$(this).hide();
		$(".over-event").removeClass("hover-border");
	});

	$(".new-jeju-box").hover(function(){
		$(this).show();
		$(".over-jeju").addClass("hover-border");
	}, function(){
		$(this).hide();
		$(".over-jeju").removeClass("hover-border");
	});

});
 
 
 
 //단기 달력 및 스크립트
 
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
	$('.awaw').attr('style','color:black !important text-decoration: none;')
	$('.aa1').attr('style','color:black !important; left: auto; right: 0px; text-decoration: none;')
	$('.aa2').attr('style','color:black !important; left: 60px; width: 100px; text-decoration: none;')
	
}});

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




//장기 스크립트
//차량 유형 선택
function carKind(){
	var manufacturer = $('#usedCarMakerId').val();
	$.ajax({
		url		: '/rent/carKind',
		data	: {'manufacturer' : manufacturer},
		type	: 'post',
		dataType : 'json',
		success : function(data){
			var str = '<option value="">차량 유형 선택</option>';
			$.each(data.map, function(key, value){
				str += '<option>'+ value.car_kind + '</option>';
			});
			$('#usedCarSgmntTypeCd').html(str);
			$('#usedCartypeId').html('<option value="">차량 선택</option>')
		},
		error : function(data){alert("carKind오류");}
	});
}

//제조사 선택
function selectCar() {
	var car_kind 	 = $('#usedCarSgmntTypeCd').val();
	var manufacturer = $('#usedCarMakerId').val();
	$.ajax({
		url		: '/rent/selectCar',
		data	: {'car_kind' : car_kind, 'manufacturer' : manufacturer},
		type	: 'post',
		success : function(data){
			var str = '<option value="">차량 선택</option>';
			$.each(data.map, function(key, value){
				str += '<option>'+ value.car_name + '</option>';
			});
			$('#usedCartypeId').html(str);
		}
	});
}


//메인 기타 프로세스


//리스트로 가는 url
function goList(){
	var manufacturer 	= $('[name=usedCarMakerId]').val();
	var carKind 		= $('[name=usedCarSgmntTypeCd]').val();
	var carName 		= $('[name=usedCartypeId]').val();
	location.href="/rent/rentList?manufacturer="+manufacturer+"&carKind="+carKind+"&carName="+carName+"";
}

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
		$('.awaw').attr('style','color:black !important text-decoration: none;')
		$('.aa1').attr('style','color:black !important; left: auto; right: 0px; text-decoration: none;')
		$('.aa2').attr('style','color:black !important; left: 60px; width: 100px; text-decoration: none;')
		
	}});


//풀페이지 스크립트

new fullpage('#fullpage', {
    anchors: ['page1', 'page2', 'page3', 'page4'],
    navigationTooltips: ['main', '단기렌트', '장기렌트', '회사소개'],
    css3: true,
    scrollingSpeed: 1000,
    navigation: true,
    slidesNavigation: true,
    responsiveHeight: 330,
    dragAndMove: true,
    dragAndMoveKey: 'YWx2YXJvdHJpZ28uY29tX0EyMlpISmhaMEZ1WkUxdmRtVT0wWUc=',
    controlArrows: false
});
!function(i,a){"use strict";var e,t,n,s=fp_utils.$,o=fp_utils.after,l=fp_utils.hasClass,u=fp_utils.addClass,r=fp_utils.toggleClass,c=fp_utils.removeClass,f=fp_utils.siblings,d=fp_utils.preventDefault,p=".language",h=s("#menu-line")[0],g=s(".menu-active").offsetWidth,v=0,m=40,L="active";function E(){m=2*parseFloat(getComputedStyle(fp_utils.$(".menu-active a")[0]).paddingLeft)}function y(){var e,t,n,i,a;e="GET",t="https://alvarotrigo.com/fullPage/routes/github-api.php",n=null,i=function(e){var n=JSON.parse(e);Object.keys(n).forEach(function(e){var t=s('[data-github="'+e+'"] h4')[0];t&&(t.innerHTML=n[e])})},(a=new XMLHttpRequest).open(e,t,!0),a.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8"),a.send(n),a.onreadystatechange=function(){4===a.readyState&&(200===a.status?i(a.responseText):console.log("Error: "+a.status))}}function w(e){switch(e.keyCode){case 27:l(s(".examples")[0],L)&&T()}}function b(){l(this,"left")?fullpage_api.moveSlideLeft():fullpage_api.moveSlideRight()}function _(){var e,t,n;e="https://alvarotrigo.com/fullPage/dist/non-critical.min.css?v=2",t=a.document.createElement("link"),a.document.styleSheets,t.rel="stylesheet",t.href=e,o(s("#stylesheet-critical")[0],t),s(".github-stars")[0].setAttribute("src","https://ghbtns.com/github-btn.html?user=alvarotrigo&repo=fullpage.js&type=star&count=true&size=large"),(n=decodeURIComponent(a.location.hash.substr(1))).length&&s("."+n,i).length&&fp_utils.trigger(s(".show-examples")[0],"click"),y()}function k(){clearTimeout(e),e=setTimeout(x,350)}function x(){if(g=s(".menu-active")[0].offsetWidth,a.innerWidth<=900){E();var e=s("#menu a")[0];R.call(e),v=e.offsetLeft}else 900<a.innerWidth&&(E(),R.call(s("#menu a")[0]),v=0)}function T(){clearTimeout(t),t=setTimeout(function(){S(".examples"),fullpage_api.setAllowScrolling(!0)},300)}function C(e){S(".examples"),fullpage_api.setAllowScrolling(!1)}function S(e){r(s(e)[0],L)}function A(e){void 0!==e&&(d(e),(e||a.event).stopPropagation()),S(p)}function W(e){c(s(p)[0],L)}function R(){var e=this.parentNode;D(e.offsetLeft,e.offsetWidth)}function j(){D(v,g)}function D(e,t){h.style.left=e+m/2+"px",h.style.width=t-m+"px"}function H(e){d(e);var t=this.getAttribute("href").substr(1);u(this,L),c(f(this),L);var n=s('[data-tab="'+t+'"]')[0];u(n,L),c(f(n),L)}E(),h.style.width=g-m+"px",h.style.left="20px","en"!==(!(n=navigator.language||navigator.userLanguage)||n.indexOf("-")<0?n:n.split("-")[0])&&A(),k(),s(".menu-active a")[0].addEventListener("click",function(e){e.preventDefault()}),s("#menu li a").forEach(function(e){e.addEventListener("mouseover",R),e.addEventListener("mouseout",j)}),a.addEventListener("resize",k),a.addEventListener("load",_),s(".shell-tab").forEach(function(e){e.addEventListener("click",H)}),s(".language-current")[0].addEventListener("click",A),s("html")[0].addEventListener("click",W),s(".info-close")[0].addEventListener("touchstart",T),s(".info-close")[0].addEventListener("click",T),s(".show-examples")[0].addEventListener("click",C),i.addEventListener("keydown",w),s(".my-arrow").forEach(function(e){e.addEventListener("click",b)}),function(){function e(){dataLayer.push(arguments)}a.dataLayer=a.dataLayer||[],e("js",new Date),e("config","UA-94005074-1"),e("config","AW-1012934304")}()}(document,window);




