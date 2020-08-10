<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<layoutTag:layout>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://localhost:8082/static/js/mainjs.js"></script>
<link href="http://localhost:8082/static/css/total.css" rel="stylesheet"type="text/css" />
<link href="http://localhost:8082/static/css/maincs.css" rel="stylesheet"type="text/css" />
<script type="text/javascript">
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
</script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>렌트의 즐거움! KS렌터카</title>
    <c:set var="URL" value="${pageContext.request.requestURL}" />
</head>
<body data-lang="ko" id="body">
<div id="fullpage">
    <div class="section fp-table" id="section-1"  style="background-image: url(http://localhost:8082/static/img/자동촤.jpg); background-size: cover;">
        <div class="fp-tableCell">
	<div id="content">
        <div class="content content-default content-original is-expanded" data-type="gate" style="height: 757px; margin-top: 0px;">
            <div class="content-wrapper">
                <div class="main-service">
                    <div class="main-service-wrapper">
                        <div class="container long">
                            <div class="heading">
                                <h2 class="title"  style=" margin: 100px; font-size:64px; color:white !important;">똑똑한 선택! 즐거운 여행!</h2>
                            </div>                           
                            <div class="shortcut rela">    
                            	<div class="white_div tesla-ovet-event" onclick="location.href='/rent/NewRentList'" >
                            		<ul class="list_ul" style="width: 178px; height: 308px;">
                            			<li style="margin:0px;">신차 다이렉트</li>
                            			<li style="margin-right:100px!important">바</li>
                            			<li style="margin:0px;">경제적인 신차구매</li>
                            			<li  style="margin-right: 20px; margin-left: 0px">더 좋은 차를 가지는<br>합리적인 방법!</li>
                            			<li class="imgsection" style="width:100px;"><img style="left:110px;" src="http://localhost:8082/static/img/img_car_icon.png"></li>
                            			<li class="arrowicon" style="top:-90px; left:-20px;">신차 견적 검색</li>
                            		</ul>
                            	</div>
                            	<!-- 200319 중고차상담신청 이벤트 -->   
                            	<div class="white_div used-over-event" onclick="location.href='/rent/rentList'" style="position: relative;">
                            		<ul class="list_ul">
                            			<li style="margin:0px;">중고차 장기</li>
                            			<li style="margin-right:100px!important">바</li>
                            			<li style="margin:0px;">믿을 수 있는 중고차렌트</li>
                            			<li  style="margin-right: 20px; margin-left: 0px">이젠 사지말고<br>가성비 솔렌터카로!</li>
                            			<li class="imgsection" style="width:100px;"><img style="left:110px;" src="http://localhost:8082/static/img/img_car_icon.png"></li>
                            			<li class="arrowicon" style="top:-90px; left:-20px;">중고차 견적 검색</li>
                            		</ul>    
            					<div class="event-mini-box used-event-long-box" onclick="javascript:goEvents('events');" style="position: absolute; margin-left:-380px;" > 
                           			<span><br>&nbsp;&nbsp;월간 렌터카<br>&nbsp;&nbsp;특가 이벤트</span>
                           		</div>          		
                            	</div> 
                            	                 	  
                				<!-- 200103 이벤트 -->   
      		
                            	<div class="white_div over-jeju" onclick="location.href='counseling/short_rent?sL=제주지점'"  style="position: relative;">
                            		<ul class="list_ul">
                            			<li style="margin:0px;">제주 단기</li>
                            			<li style="margin-right:100px!important">바</li>
                            			<li style="margin:0px;">바로 출발 서비스로</li>
                            			<li  style="margin-right: 40px; margin-left: 0px">기다림 없이!<br>빠른 렌터카 대여</li>
                            			<li class="imgsection" style="width:100px;"><img style="left:110px;" src="http://localhost:8082/static/img/img_short_icon.png"></li>
                            			<li class="arrowicon" style="top:-90px; left:-20px;">제주 빠른 예약</li>
                            		</ul>
                    			<div class="event-mini-box new-jeju-box" onclick="javascript:goEvent('event');"  style="position: absolute; margin-right:-385px;">
                           			<span><br>&nbsp;&nbsp;솔렌터카 최대<br>&nbsp;&nbsp;80% 할인!</span>
                           		</div>    
                            	</div>
                           		
                            	<div class="white_div over-event" onclick="location.href='/counseling/short_rent'"> 
                            		<ul class="list_ul">
                            			<li style="margin:0px;">내륙 단기</li>
                            			<li style="margin-right:100px!important">바</li>
                            			<li style="margin:0px;">제휴 할인 혜택으로</li>
                            			<li  style="margin-right: 40px; margin-left: 0px">더욱 가볍게!<br>빠른 실시간 예약</li>
                            			<li class="imgsection" style="width:100px;"><img  style="left:110px;"  src="http://localhost:8082/static/img/img_short_icon.png"></li>
                            			<li class="arrowicon" style="top:-90px; left:-20px;">내륙 빠른 예약</li>
                            		</ul>
                            	</div>
                            </div><!-- //shortcut -->
                        </div><!-- //container long -->                      
                    </div>
                </div>
            </div>
        </div>
    </div>
                            	<a id="a" href="/main#page2" ><span id="span"></span>단기렌트</a>
        </div>
    </div>
    <div class="section" id="section-2"  style="margin-bottom:50px; height:700px; background-image: url('http://localhost:8082/static/img/자동촤2.jpg'); background-repeat: no-repeat;  padding: 0px !important; margin: 0px  !important;">
    	<form action="/counseling/mainProc" method="get" name="proc">
				<div class="spot short type2">
					<div class="spot-wrapper">
						<div class="heading">
							<h2 class="tit" style="font-size:68px;">즐거운 여행의 시작</h2>
							<p class="descp" style="padding-top:10px; font-size:20px; color: black !important;">안전하고 즐거운 여행은 솔렌터카에서 시작됩니다.</p>
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
											<span class="select-box fl">
												<select  style="width:100px !important;" class="inputDate"   name="sLocation" id="sLocation" class="option01 option02 timeChange fast-reserve-select">
														<option>제주지점</option>
												</select>
												<b role="presentation" style="margin-top: -24px; margin-left: -35px;"></b>
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
											<span class="select-box fl">
												<select  style="width:100px !important;" class="inputDate"   name="lLocation" id="lLocation" class="option01 option02 timeChange fast-reserve-select">
														<option>제주지점</option>
												</select>
												<b role="presentation" style="margin-top: -24px; margin-left: -35px;"></b>
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
									<div class="helper" style="margin-top:15px;">
												<a href="/buy/memberCheckForm" >예약확인</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</form><br><br><br><br><br><br><br>
				<a id="a" href="/main#page3"  style="color:black; font-weight:800;"><span id="span" style=""></span>장기렌트</a>
    </div>
    <div class="section" id="section-3"  style="margin-bottom:50px; height:700px; background-image: url('http://localhost:8082/static/img/자동차1.jpg'); background-repeat: no-repeat; background-size: cover; padding: 0px !important; margin: 0px  !important;">
        <div class="spot long">
					<div class="spot-wrapper">
						<div class="heading">
							<h2 class="tit">똑똑한 선택 KS 장기렌터카</h2>
							<p class="descp">더 좋은 자동차를 갖는 최적의 장기렌터카 솔루션</p>
						</div>
					</div>
					<form name="frm" id="frm" action="" method="post">
					<div class="car-search" role="search" style="border:none;">
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
										<em class="title" style="width:500px; left:355px;">중고차 렌터카 검색</em>
									</label>
								</div>
							</div>
							
							<div class="panel is-selected search_input" style="border:none !important;"> <!-- 중고차 -->
								<div class="select-area fl" style=" padding-top: 20px; padding-left: 30px;">
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarMakerId" id="usedCarMakerId" class="option01 option02 inputDate" tabindex="-1" aria-hidden="true"  onchange="carKind();">
											<option value="">제조사 선택</option>
											<c:forEach items="${manufacturer}" var="manufacturer" varStatus="status">
												<option <c:if test="${ma != null and ma eq manufacturer.manufacturer}"> selected</c:if>>${manufacturer.manufacturer}</option>
											</c:forEach>
										</select>
			                        </span>
									</div>
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarSgmntTypeCd" id="usedCarSgmntTypeCd" class="option01 inputDate"   onchange="selectCar(); searchForm();"> 
											<option value="">차량 유형 선택</option>
										</select>
			                        </span>
									</div>
									<div class="select-col col-3">
					                    <span class="select-box">
											<select name="usedCartypeId" id="usedCartypeId" class="option01 inputDate"   onclick="searchForm();" >
												<option value="">차량 선택</option>
											</select>
					                    </span>
									</div>
								</div>
								<div class="btn-wrap fr">
									<a href="#" class="btn btn-color2 btnda" onclick="goList();">검색</a>
								</div>
							</div>	
							<!-- //190621 -->						
						</div>
					</div>
					</form>
					<!-- [S] 2018-01-25 변경 -->
				</div>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><a id="a" href="/main#page4"><span id="span" style=""></span>회사소개</a>
        </div>
	    <div class="section" id="section-4">
	    	<div class="container">
	    		<div class="a">
	    			<ul class="list">
	    			
	    				<li style="background-image:url(http://localhost:8082/static/img/fut.gif); background-size: 1000px 380px;">
		    				<h4>We Redesign Our Mobility Life</h4>
		    				<br>
		    				<p>매일매일의 Mobility Life를 보다 가치있게 Redesing 하는일,</p>
		    				<br>
							<p>미래를 준비하는 KS렌터카의 다음 미션입니다.</p>
						</li>
						
						<li id="e5" style="background-image:url(http://localhost:8082/static/img/KsAirLogo.png); background-size: 150px 150px;
						background-repeat:no-repeat; background-position: 60% 0%; ">
		    				<h4>"Smart Way"</h4>
		    				<br>
		    				<h3>고객을 위한 똑똑한 길잡이</h3>
		    				<br>
		    				<p>KS렌터카의 Visual Identiyu인 "SMART WAY"는 앞으로 나아가는 '길'의 모습을 형상화하였습니다.</p>
							<p>KS렌터카가 제안드리는 Smaert한 가격과 Total Car Care 프로그램이 역동적인 길 위에 얹어지고,</p>
		    				<p>끊임없는 도전과 열정의 Red 따뜻한 고객 사랑의 Orange Color를 더하여</p>
		    				<p>'고객 만족을 위한 똑똑한 길잡이'가 되기 위해 끊임없이 노력하는 KS렌터카의 의지를 표현하고 있습니다.</p>
		    				
						</li>
						
						<li style="background-image:url(http://localhost:8082/static/img/ATo.png); top:10px;">
						</li>
						
						<li>
							<div style="float:left; width: 1000px; height: 300px;"></div>
							<div class="Advertising" style="background-image:url(http://localhost:8082/static/img/Advertising1.gif);"></div>
							<div class="Advertising" style="background-image:url(http://localhost:8082/static/img/Advertising2.gif);"></div>
						</li>
	    			</ul>
	    		</div>
	    		
  				
	    		
	    		<div class="b">
	    			<button class="prev">이전</button>
	    			<button class="next">다음</button>
	    			<button onclick="black()">X</button>
	    		</div>
				
	    	</div>
		</div>
    
</div>
<style>
.Advertising{
float:left;
width:500px ;
height: 300px;
background-size: 500px 300px;
}
#section-4{
    background-color: #fec401;
    background-image: url(http://localhost:8082/static/img/touch.png);
    background-position: 50% 100%;
    background-repeat: no-repeat;
    background-size:15.7%;
}
h4{
color: #FF0000;
font-size:50px;
top:10px;
}
h3 {
color: #2F4F4F;
font-size:30px;
}
li p {
font-size:35px;
color:#FF4500;
}
li#e5 p {
font-size:20px;
}
.b{
	position: relative;
    margin-left: 300px;
    width: 200px;
    height: 100px;
    top: -50px;
    right: -180px;
    color: black;
}
.a {
	position: relative;
    margin-left: 300px;
    width: 1000px;
    height: 300px;
    top: -60px;
    right: 200px;
  	overflow: hidden;
}
ul {
  list-style: none;
}
.a .list {
  width: 4000px;
  margin-left: -1000px;
}

.a .list:after {
  content: "";
  display: block;
  clear: both;
}

.a .list li {
  float: left;
  height: 300px;
  width: 3000px;
}
h2 {
  font-family: 'Arial';
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 3rem;
  line-height: 0.75;
}
div.sp {
position: relative;
margin-left:300px;
width:30px;
height: 30px;
top : 510px;
right: -460px;
overflow: hidden;
border-radius: 12px;
}
div.sp span {
  display: block;
}
div.sp span a#NRC {
position: relative;
color:black;
}

div.sp span.light {
  position: relative;
  display: inline-block;
}
div.sp span.light:before {
  position: absolute;
  left: 0;
  top: -10%;
  width: 100%;
  height: 120%;
  background: white;
  -webkit-filter: blur(10px);
          filter: blur(10px);
  content: "";
  opacity: 0;
  -webkit-animation: flash .5s ease-out alternate infinite;
          animation: flash .5s ease-out alternate infinite;
}
@-webkit-keyframes flash {
  to {
    opacity: 1;
  }
}

@keyframes flash {
  to {
    opacity: 1;
  }
}
@-webkit-keyframes flashText {
  to {
    opacity: 0.15;
  }
}
@keyframes flashText {
  to {
    opacity: 0.15;
  }
}
</style>
<ul id="menu">
    <li class="menu-active menu-wordpress">
        <ul class="submenu plugins">
            <li>
                <a class="plugins-theme" href="https://alvarotrigo.com/fullPage/utils/wordpress.html">
                    <i></i>
                    Theme
                </a>
            </li>
            <li>
                <a class="plugins-plugin" href="https://alvarotrigo.com/fullPage/wordpress-plugin-gutenberg/">
                    <i></i>
                    Plugin Gutenberg
                </a>
            </li>
            <li>
                <a class="plugins-plugin" href="https://alvarotrigo.com/fullPage/wordpress-plugin-elementor/">
                    <i></i>
                    Plugin Elementor
                </a>
            </li>
        </ul>
    </li>
    <li>
    </li>
    <li id="menu-line"></li>
</ul>

<div class="language">
</div>

<script type="text/javascript" src="https://alvarotrigo.com/fullPage/dist/fullpage.dragAndMove2.limited.min.js?v11"></script>
<script type="text/javascript" src="https://alvarotrigo.com/fullPage/fullpage.extensions.min.js"></script>
<script type="text/javascript">
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


        $(document).ready(function() {
            
        	  $('.next').click(function() {
        	    $('.list').stop().animate({
        	      'margin-left': '-2000px'
        	    }, function() {
        	      $('.list li:first-child').appendTo('.list');
        	      $('.list').css({
        	        'margin-left': '-1000px'
        	      });
        	    });
        	  });
        	  
        	  $('.prev').click(function() {
        	    $('.list').stop().animate({
        	      'margin-left': '0px'
        	    }, function() {
        	      $('.list li:last-child').prependTo('.list');
        	      $('.list').css({
        	        'margin-left': '-1000px'
        	      });
        	    });
        	  });

          	   var auto = setInterval(function(){
          	   		$('.list').stop().animate({'margin-left':'-2000px'},function(){
          	   			$('.list li:first-child').appendTo('.list');
          	            $('.list').css({'margin-left':'-1000px'});
          	       });
          	   },4000);

          	   /* 마우스 올렸을때 캐러셀 자동 멈춤 */
          	   $('.list').mouseenter(function(){
          	        clearInterval(auto);  
          	   });
          	   
          	   /* 마우스 내렸을때 캐러셀 자동 다시실행 */
          	   $('.list').mouseleave(function(){
          	        auto = setInterval(function(){
          	         		$('.list').stop().animate({'margin-left':'0px'},function(){
          	         			$('.list li:first-child').appendTo('.list');
          	           $('.list').css({'margin-left':'-1000px'});
          	        });
          	    },4000);
          	   });

        	  
        	});
function black() {
	var str ='';
	str +='<div class="sp">';
	str +='<span class="light"><a href="${path}/rent/NewRentList" id="NRC">　　ㅋㅋㅋ</a></span>';
	str +='</div>';
	$('#section-4').css('background-color','black');
	$('#section-4').html(str);
}
</script>
<script type="text/javascript">!function(i,a){"use strict";var e,t,n,s=fp_utils.$,o=fp_utils.after,l=fp_utils.hasClass,u=fp_utils.addClass,r=fp_utils.toggleClass,c=fp_utils.removeClass,f=fp_utils.siblings,d=fp_utils.preventDefault,p=".language",h=s("#menu-line")[0],g=s(".menu-active").offsetWidth,v=0,m=40,L="active";function E(){m=2*parseFloat(getComputedStyle(fp_utils.$(".menu-active a")[0]).paddingLeft)}function y(){var e,t,n,i,a;e="GET",t="https://alvarotrigo.com/fullPage/routes/github-api.php",n=null,i=function(e){var n=JSON.parse(e);Object.keys(n).forEach(function(e){var t=s('[data-github="'+e+'"] h4')[0];t&&(t.innerHTML=n[e])})},(a=new XMLHttpRequest).open(e,t,!0),a.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8"),a.send(n),a.onreadystatechange=function(){4===a.readyState&&(200===a.status?i(a.responseText):console.log("Error: "+a.status))}}function w(e){switch(e.keyCode){case 27:l(s(".examples")[0],L)&&T()}}function b(){l(this,"left")?fullpage_api.moveSlideLeft():fullpage_api.moveSlideRight()}function _(){var e,t,n;e="https://alvarotrigo.com/fullPage/dist/non-critical.min.css?v=2",t=a.document.createElement("link"),a.document.styleSheets,t.rel="stylesheet",t.href=e,o(s("#stylesheet-critical")[0],t),s(".github-stars")[0].setAttribute("src","https://ghbtns.com/github-btn.html?user=alvarotrigo&repo=fullpage.js&type=star&count=true&size=large"),(n=decodeURIComponent(a.location.hash.substr(1))).length&&s("."+n,i).length&&fp_utils.trigger(s(".show-examples")[0],"click"),y()}function k(){clearTimeout(e),e=setTimeout(x,350)}function x(){if(g=s(".menu-active")[0].offsetWidth,a.innerWidth<=900){E();var e=s("#menu a")[0];R.call(e),v=e.offsetLeft}else 900<a.innerWidth&&(E(),R.call(s("#menu a")[0]),v=0)}function T(){clearTimeout(t),t=setTimeout(function(){S(".examples"),fullpage_api.setAllowScrolling(!0)},300)}function C(e){S(".examples"),fullpage_api.setAllowScrolling(!1)}function S(e){r(s(e)[0],L)}function A(e){void 0!==e&&(d(e),(e||a.event).stopPropagation()),S(p)}function W(e){c(s(p)[0],L)}function R(){var e=this.parentNode;D(e.offsetLeft,e.offsetWidth)}function j(){D(v,g)}function D(e,t){h.style.left=e+m/2+"px",h.style.width=t-m+"px"}function H(e){d(e);var t=this.getAttribute("href").substr(1);u(this,L),c(f(this),L);var n=s('[data-tab="'+t+'"]')[0];u(n,L),c(f(n),L)}E(),h.style.width=g-m+"px",h.style.left="20px","en"!==(!(n=navigator.language||navigator.userLanguage)||n.indexOf("-")<0?n:n.split("-")[0])&&A(),k(),s(".menu-active a")[0].addEventListener("click",function(e){e.preventDefault()}),s("#menu li a").forEach(function(e){e.addEventListener("mouseover",R),e.addEventListener("mouseout",j)}),a.addEventListener("resize",k),a.addEventListener("load",_),s(".shell-tab").forEach(function(e){e.addEventListener("click",H)}),s(".language-current")[0].addEventListener("click",A),s("html")[0].addEventListener("click",W),s(".info-close")[0].addEventListener("touchstart",T),s(".info-close")[0].addEventListener("click",T),s(".show-examples")[0].addEventListener("click",C),i.addEventListener("keydown",w),s(".my-arrow").forEach(function(e){e.addEventListener("click",b)}),function(){function e(){dataLayer.push(arguments)}a.dataLayer=a.dataLayer||[],e("js",new Date),e("config","UA-94005074-1"),e("config","AW-1012934304")}()}(document,window);</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94005074-1"></script>



</body>

</layoutTag:layout>
</html>
