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
    </div>
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

</script>
<script type="text/javascript">!function(i,a){"use strict";var e,t,n,s=fp_utils.$,o=fp_utils.after,l=fp_utils.hasClass,u=fp_utils.addClass,r=fp_utils.toggleClass,c=fp_utils.removeClass,f=fp_utils.siblings,d=fp_utils.preventDefault,p=".language",h=s("#menu-line")[0],g=s(".menu-active").offsetWidth,v=0,m=40,L="active";function E(){m=2*parseFloat(getComputedStyle(fp_utils.$(".menu-active a")[0]).paddingLeft)}function y(){var e,t,n,i,a;e="GET",t="https://alvarotrigo.com/fullPage/routes/github-api.php",n=null,i=function(e){var n=JSON.parse(e);Object.keys(n).forEach(function(e){var t=s('[data-github="'+e+'"] h4')[0];t&&(t.innerHTML=n[e])})},(a=new XMLHttpRequest).open(e,t,!0),a.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8"),a.send(n),a.onreadystatechange=function(){4===a.readyState&&(200===a.status?i(a.responseText):console.log("Error: "+a.status))}}function w(e){switch(e.keyCode){case 27:l(s(".examples")[0],L)&&T()}}function b(){l(this,"left")?fullpage_api.moveSlideLeft():fullpage_api.moveSlideRight()}function _(){var e,t,n;e="https://alvarotrigo.com/fullPage/dist/non-critical.min.css?v=2",t=a.document.createElement("link"),a.document.styleSheets,t.rel="stylesheet",t.href=e,o(s("#stylesheet-critical")[0],t),s(".github-stars")[0].setAttribute("src","https://ghbtns.com/github-btn.html?user=alvarotrigo&repo=fullpage.js&type=star&count=true&size=large"),(n=decodeURIComponent(a.location.hash.substr(1))).length&&s("."+n,i).length&&fp_utils.trigger(s(".show-examples")[0],"click"),y()}function k(){clearTimeout(e),e=setTimeout(x,350)}function x(){if(g=s(".menu-active")[0].offsetWidth,a.innerWidth<=900){E();var e=s("#menu a")[0];R.call(e),v=e.offsetLeft}else 900<a.innerWidth&&(E(),R.call(s("#menu a")[0]),v=0)}function T(){clearTimeout(t),t=setTimeout(function(){S(".examples"),fullpage_api.setAllowScrolling(!0)},300)}function C(e){S(".examples"),fullpage_api.setAllowScrolling(!1)}function S(e){r(s(e)[0],L)}function A(e){void 0!==e&&(d(e),(e||a.event).stopPropagation()),S(p)}function W(e){c(s(p)[0],L)}function R(){var e=this.parentNode;D(e.offsetLeft,e.offsetWidth)}function j(){D(v,g)}function D(e,t){h.style.left=e+m/2+"px",h.style.width=t-m+"px"}function H(e){d(e);var t=this.getAttribute("href").substr(1);u(this,L),c(f(this),L);var n=s('[data-tab="'+t+'"]')[0];u(n,L),c(f(n),L)}E(),h.style.width=g-m+"px",h.style.left="20px","en"!==(!(n=navigator.language||navigator.userLanguage)||n.indexOf("-")<0?n:n.split("-")[0])&&A(),k(),s(".menu-active a")[0].addEventListener("click",function(e){e.preventDefault()}),s("#menu li a").forEach(function(e){e.addEventListener("mouseover",R),e.addEventListener("mouseout",j)}),a.addEventListener("resize",k),a.addEventListener("load",_),s(".shell-tab").forEach(function(e){e.addEventListener("click",H)}),s(".language-current")[0].addEventListener("click",A),s("html")[0].addEventListener("click",W),s(".info-close")[0].addEventListener("touchstart",T),s(".info-close")[0].addEventListener("click",T),s(".show-examples")[0].addEventListener("click",C),i.addEventListener("keydown",w),s(".my-arrow").forEach(function(e){e.addEventListener("click",b)}),function(){function e(){dataLayer.push(arguments)}a.dataLayer=a.dataLayer||[],e("js",new Date),e("config","UA-94005074-1"),e("config","AW-1012934304")}()}(document,window);</script>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94005074-1"></script>



</body>

</layoutTag:layout>
</html>
