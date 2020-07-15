<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>

<!DOCTYPE html>

 

















<html lang="ko"><!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="p3p" content='CP="CAO DSP AND SO " policyref="/w3c/p3p.xml"' >
    <!--  SNS -->
    <meta property="og:title" content="SK렌터카"/>
    <meta property="og:type" content="website"/>
    <meta property="og:image" content="https://www.skcarrental.com/resources/img/logo_sns.jpg"/>
    <meta property="og:url" content="https://www.skcarrental.com"/>
    <meta property="og:description" content="여기를 눌러 링크를 확인하세요."/>
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="SK렌터카" />
    <meta name="twitter:url" content="https://www.skcarrental.com" />
    <meta name="twitter:image" content="https://www.skcarrental.com/resources/img/logo_sns.jpg"/>
    <meta name="twitter:description" content="여기를 눌러 링크를 확인하세요." />
    <!--  SNS//end -->
    <title>SK렌터카</title>
    <!-- favicon --> 
    <link rel="shortcut icon" href="/resources/favicon/favicon.ico">
    <link rel="icon" href="/resources/favicon/favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/favicon/favicon-16x16.png">
    <!-- favicon//end -->
    <link rel="stylesheet" href="/resources/css/style.css?v=2"/>
    <!-- 댓글기능 css-->
    <link rel="stylesheet" href="/resources/css2/comment.css"/>
    <script src="/resources/js/modernizr-2.8.3-respond-1.4.2.min.js" type="text/javascript"></script>
    
    <script src="/resources/js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="/resources/js/jquery-ui.1.11.1.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.number.min.js" type="text/javascript"></script>
    <script src="/resources/js/common.js?v=3" type="text/javascript"></script>
    <script src="/resources/js/plugin.js" type="text/javascript"></script>
    <script src="/resources/js/fontfaceobserver.js" type="text/javascript"></script>
    <script src="/resources/js/weblog_login.js" type="text/javascript"></script>
    <script src="/resources/js/weblog.js" type="text/javascript"></script>
    
    
    
    
    <!-- Global site tag (gtag.js) - Google AdWords: 804926746 -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=AW-804926746"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'AW-804926746');
	</script>
	<!-- Event snippet for Sk장기렌터카 유입 conversion page
	In your html page, add the snippet and call gtag_report_conversion when someone clicks on the chosen link or button. -->
	<script>
	function gtag_report_conversion(url) {
/*
	  var callback = function () {
	    if (typeof(url) != 'undefined') {
	      window.location = url;
	    }
	  }; 
	  gtag('event', 'conversion', {
	      'send_to': 'AW-804926746/8VZHCPnXrIIBEJrq6P8C',
	      'transaction_id': '',
	      'event_callback': callback
	  });
	  return false;
*/
	}
	</script>
    
</head>


	
		
	
	


	
	
		
	
	


<body id="main" class=" type-reverse">
<!-- skip -->
<div class="skipNav">
    <menu>
        <li><a href="#content">본문 바로가기</a></li>
        <li><a href="#gnb">메뉴 바로가기</a></li>
        <li><a href="#footer">하단 바로가기</a></li>
    </menu>
</div>
<!-- //skip -->



	
	
		
	


<div id="loading" class="off">
    <div class="car"></div>
</div>


<div id="submain-div" class="wrapper has-promotion">


<!-- 관록추가 -->
<script type="text/javascript">
	/* 단기 계약(개인) 리스트 가기 */
	function goShortContract(){
		showloading();
		location.href = "/rent/myrnt/prsn/short_list.do";
	}
	
	/* 단기 계약(법인) 리스트 가기 */
	function goCorShortContract(){
		showloading();
		location.href = "/rent/myrnt/corp/short_list.do";
	}
	
</script>


<header id="menuHeader" >
	<div class="header-wrapper">
		<h1 id="menuHeaderLogoH1">
			<a href="/rent/index_intro.do" >SK렌터카</a>
		</h1>		
		<nav id="util">
			<ul>
				<li>
				
					<a href="/rent/login/main.do">로그인</a>
				
				
				</li>
				
				
				
				
				<li>
					<a href="/rent/prmt/evnt/evnt_list.do">이벤트</a>
				</li>
				<!-- 200318 주석처리
				<li>
					<a id="P070401" href="/rent/long/membership/html/membership_information.do">멤버십</a>
				</li>
				--->
				<li>
					<a href="/rent/custcnte/notice/notice_list.do">고객센터</a>
				</li>
			</ul>
		</nav>
		<nav class="gnb" tabindex="0">
			<h2 class="sr-only ">메인 메뉴</h2>
			<div class="gnb-wrapper">
				<ul class="gnb-listbox">
					<li class="gnb-listitem gnb-listitem-long">
					
						<a href="/rent/long/main.do" class="gnb-anchor">장기렌터카</a>
					
					
						<div class="gnb-depth-listbox-wrapper">
							<ul class="gnb-depth-listbox">
								<li class="gnb-depth-listitem gnb-depth-listitem-often">
									<a href="/rent/long/direct/sub_main_integration.do?tabId=NEWCAR" class="gnb-depth-anchor">
										<strong class="gnb-depth-anchor-tit">SK장기렌터카<br>다이렉트</strong>
										<p class="gnb-depth-anchor-descp">개인 장기렌터카를<br>다이렉트로 초이스!</p>
										<span class="gnb-depth-anchor-arrow"></span>										
									</a>
								</li>
								<li class="gnb-depth-listitem">
									<a href="#" class="gnb-depth-anchor">개인 장기 렌터카</a>
									<ul class="gnb-2depth-listbox">
										<li class="gnb-2depth-listitem">
											<a href="/rent/long/prsn/html/rent_guide.do" class="gnb-2depth-anchor">개인 장기렌터카 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/long/membership/html/membership_information.do" class="gnb-2depth-anchor">개인장기렌터카 혜택</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/long/direct/sales_carlst.do" class="gnb-2depth-anchor">장기렌터카 차량 정보</a>
										</li>	
										<li class="gnb-2depth-listitem"> <!-- 200609 메뉴추가 -->
											<a href="http://www.skcar-smartcare.com/" class="gnb-2depth-anchor" target="_blank">스마트케어 서비스</a>
										</li>																			
									</ul>
								</li>
								<li class="gnb-depth-listitem">
									<a href="#" class="gnb-depth-anchor">법인 장기렌터카</a>
									<ul class="gnb-2depth-listbox">
										<li class="gnb-2depth-listitem">
											<a href="/rent/long/corp/html/rent_info.do" class="gnb-2depth-anchor">법인 장기렌터카 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/long/corp/html/carmng_serv_info.do" class="gnb-2depth-anchor">차량관리 서비스</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/custcnte/counsel/corp_reqt_form.do" class="gnb-2depth-anchor">법인 장기 상담신청</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<div class="gnb-placeholder"></div>
					</li>
				
					<li class="gnb-listitem gnb-listitem-short">
					
						<a href="/rent/rentcar/main.do" class="gnb-anchor">단기렌터카</a>
						
					
					
						<div class="gnb-depth-listbox-wrapper">
							<ul class="gnb-depth-listbox">
								<li class="gnb-depth-listitem gnb-depth-listitem-often">
									<a href="/rent/rentcar/short_rent_reservation_new_jeju.do" class="gnb-depth-anchor">
										<strong class="gnb-depth-anchor-tit">단기렌터카<br>예약/확인</strong>
										<p class="gnb-depth-anchor-descp">실시간으로 빠르게<br>예약/확인!</p>
										<span class="gnb-depth-anchor-arrow"></span>
									</a>
								</li>
								<li class="gnb-depth-listitem">
									<a href="#" class="gnb-depth-anchor">단기렌터카</a>
									<ul class="gnb-2depth-listbox">
										<li class="gnb-2depth-listitem">
											<a href="/rent/rentcar/html/rent_guide.do" class="gnb-2depth-anchor">단기렌터카 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/rentcar/html/jeju_price.do" class="gnb-2depth-anchor">요금/할인 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/rentcar/html/evcar_guide.do" class="gnb-2depth-anchor">전기차 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/rentcar/html/insur_car_serv.do" class="gnb-2depth-anchor">보험대차 안내</a>
										</li>
									</ul>
								</li>
								<li class="gnb-depth-listitem">
									<a href="#" class="gnb-depth-anchor">중고차 장기렌터카</a><!--20170523 텍스트-->
									<ul class="gnb-2depth-listbox">
										<li class="gnb-2depth-listitem">
											<a href="/rent/rentcar/html/monthly_guide.do" class="gnb-2depth-anchor">중고차 장기렌터카 안내</a>
										</li>
										<li class="gnb-2depth-listitem">
											<a href="/rent/custcnte/counsel/short_reqt_form.do" class="gnb-2depth-anchor">중고차 장기 상담신청</a>
										</li>
									</ul>	
								</li>
							</ul>
						</div>
						<div class="gnb-placeholder"></div>
					</li>
				</ul>
			</div>
						
		</nav>
		<div class="header-placeholder"><div class="header-placeholder-bg"></div></div>
	</div>
</header>












<script type="text/javascript">
$(document).ready(function(){
	

});
</script>
<style>
table.ui-datepicker-calendar tr td.ui-state-highlight-start:after {content:""}
table.ui-datepicker-calendar tr td.ui-state-highlight-end:after {content:""}
table.ui-datepicker-calendar tr td.ui-datepicker-today:after {content:""}
div.ui-datepicker-multi-2 { left: calc(50% + 135px)!important; }

td.ui-datepicker-today > a.ui-state-default{background:#fff;color:#666;}

#inland-info-modal-close{
	position: absolute;
    right: 50px;
    top: 40px;
    width: 41px;
    height: 41px;
    background-image: url(/resources/img/spr-common.png);
    background-repeat: no-repeat;
    background-position: -84px -1205px;
    -webkit-background-size: 1347px 1290px;
    background-size: 1347px 1290px;
    text-indent: 1000%;
    white-space: nowrap;
    overflow: hidden;
}
</style>
	<script src="/resources/js/common.js" type="text/javascript"></script>
	<script src="/resources/js/CSSPlugin.min.js"></script>
	<script src="/resources/js/EasePack.min.js"></script>
	<script src="/resources/js/TweenLite.min.js"></script>
	<script src="/resources/js/TweenMax.min.js"></script>
	<script src="/resources/js/TimelineLite.min.js"></script>
	<script src="/resources/js/shortMain_renew_ui.js?v=21" type="text/javascript"></script>
	
	<script src="/resources/js/shortMain_renew_br.js" type="text/javascript"></script>
	<script src="/resources/js/shortMain_renew_cal.js?v=18" type="text/javascript"></script>
	
	<!-- 20190114 추가( 달력 이벤트 )  -->
	<script src="/resources/js/calenderValidateEvent.js?v=11" type="text/javascript"></script>

	
   <form id="formId" name="formId" action="" method="post">	
               <input type="hidden" name="cdId" id="cdId" />
               <input type="hidden" name="branchId" id="branchId" />					                
               <input type="hidden" name="branchNm" id="branchNm" />
               
               <input type="hidden" name="cdId2" id="cdId2" />	
               <input type="hidden" name="branchId2" id="branchId2" />					                
               <input type="hidden" name="branchNm2" id="branchNm2" />
               
               <input type="hidden" name="dptDtm" id="dptDtm" />					                
               <input type="hidden" name="arvDtm" id="arvDtm" />	
               
	<div id="content">
		<div class="content content-short content-original is-expanded" data-type="short">
			<div class="content-wrapper">
				<!--
				
					################### 주의사항!!!!! ########################################
					프로모션없을때 promotion-slider 주석처리하거나 출력을 안하게 하지 마시오. ---- 스타일 다 깨짐!!!!
					is-expanded 속성으로 처리하시오!!!!
					
					<div class="promotion-slider long slider-arrow-article" id="promotion-slider-short"> -- 프로모션 없을때
					<div class="promotion-slider long slider-arrow-article  is-expanded" id="promotion-slider-short"> ---- 프로모션 있을때. 속성을  is-expanded로 해줌
				-->

				<!-- 프로모션 배너 시작 -->
				<div class="promotion-slider long slider-arrow-article"  id="promotion-slider-short">
					<div class="wrap">
						<div class="slider">
							<div class="list">
								<a href="#">
									<div class="bg">
										<img src="/resources/img/img-promotion-main01.png" alt="">
									</div>
									<div class="heading">
										<em class="introduction">SK렌터카가 추천하는 장기렌터카</em>
										<strong class="title">그랜저IG 3.0[가솔린] 익스클루시브 스페셜</strong>
										<p class="price"><span class="txt">월 렌탈료<br><span class="number">415,000</span> 원</span></p>
										<div class="detail">
											<dl>
												<dt class="title">판매조건</dt>
												<dt class="descp">선수금 30%, 48개월, 만26세 이상 가족한정, 멤버십 제외, VAT포함 금액</dt>
												<dt class="title">판매기간 </dt>
												<dt class="descp">2017-04-01 ~ 2017-04-30</dt>
											</dl>
										</div>
									</div>
								</a>
							</div>
							<div class="list">
								<a href="#">
									<div class="bg">
										<img src="/resources/img/img-promotion-main01.png" alt="">
									</div>
									<div class="heading">
										<em class="introduction">SK렌터카가 추천하는 장기렌터카</em>
										<strong class="title">그랜저IG 3.0[가솔린] 익스클루시브 스페셜</strong>
										<p class="price"><span class="txt">월 렌탈료<br><span class="number">415,000</span> 원</span></p>
										<div class="detail">
											<dl>
												<dt class="title">판매조건</dt>
												<dt class="descp">선수금 30%, 48개월, 만26세 이상 가족한정, 멤버십 제외, VAT포함 금액</dt>
												<dt class="title">판매기간 </dt>
												<dt class="descp">2017-04-01 ~ 2017-04-30</dt>
											</dl>
										</div>
									</div>
								</a>
							</div>
							<div class="list">
								<a href="#">
									<div class="bg">
										<img src="/resources/img/img-promotion-main01.png" alt="">
									</div>
									<div class="heading">
										<em class="introduction">SK렌터카가 추천하는 장기렌터카</em>
										<strong class="title">그랜저IG 3.0[가솔린] 익스클루시브 스페셜</strong>
										<p class="price"><span class="txt">월 렌탈료<br><span class="number">415,000</span> 원</span></p>
										<div class="detail">
											<dl>
												<dt class="title">판매조건</dt>
												<dt class="descp">선수금 30%, 48개월, 만26세 이상 가족한정, 멤버십 제외, VAT포함 금액</dt>
												<dt class="title">판매기간 </dt>
												<dt class="descp">2017-04-01 ~ 2017-04-30</dt>
											</dl>
										</div>
									</div>
								</a>
							</div>
						</div>
						<div class="close-area">
							<span class="checkbox">
								<input type="checkbox" id="promotion-short-close-remember">
								<label for="promotion-short-close-remember">오늘 하루 동안 보지 않기</label>
							</span>
							<a href="#" class="btn-close">닫기</a>
						</div>
					</div>
				</div>
				<!-- -프로모션 배너 끝 -->
				
				

				<!-- 20180530 : s -->
				<div class="spot short type2">
					<div class="spot-wrapper">
						<div class="heading">
							<h2 class="tit">즐거운 여행의 시작</h2>
							<p class="descp">안전하고 즐거운 여행은 SK렌터카에서 시작됩니다.</p>
						</div>
						<!--
							개발 전달 사항
							multi datepicker // 오늘, 대여일, 반납일 문구는 개발에서 추가필요함
							대여일 td 에는 .start / 반납일 td에는 .end, 대여일과 반납일 사이이 td에는 .middle 추가하면 스타일이 반영됩니다.
							--
							장기렌터카 이동 후 돌아 올 시 날짜 값에 이상한 값이 들어가는 현상 확인 부탁 드립니다.
						-->
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
											<span id="sDateSpan" class="input fl">
												<input type="text" id="sDate" class="brr0 rentDate" placeholder="대여일 선택" name="sDate" value=""  readonly="readonly">
											</span>
											<span class="select-box fl">
												<select name="sHour" id="sHour" class="option01 option02 hour fast-reserve-select" >
													<option value="06">06 시</option>
													<option value="07">07 시</option>
													<option value="08">08 시</option>
													<option value="09">09 시</option>
													<option value="10">10 시</option>
													<option value="11">11 시</option>
													<option value="12">12 시</option>
													<option value="13">13 시</option>
													<option value="14">14 시</option>
													<option value="15">15 시</option>
													<option value="16">16 시</option>
													<option value="17">17 시</option>
													<option value="18">18 시</option>
													<option value="19">19 시</option>
													<option value="20">20 시</option>
													<option value="21">21 시</option>
													<option value="22">22 시</option>
												</select>
											</span>
											<span class="select-box fl">
												<select name="sMinute" id="sMinute" class="option01 option02 timeChange fast-reserve-select">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
											<span id="br1" class="multiple-select-box fl is-disabled">
												<strong class="js-multiple-select-text">제주/제주지점</strong>
											</span>
											<div class="layer-multiple-select-box">
												<div class="col">
													<dl id="dlRegion1" class="location">
														<dt>지역선택</dt>
		                                        		<dd><a href="#" data-cd="692001" class="is-selected">서울</a></dd>
		                                        		<dd><a href="#" data-cd="692002">경기</a></dd>
		                                        		<dd><a href="#" data-cd="692003">충청</a></dd>
		                                        		<dd><a href="#" data-cd="692004">경상</a></dd>
		                                        		<dd><a href="#" data-cd="692005">전라</a></dd>
	                                        			<dd><a href="#" data-cd="692006">강원</a></dd>
													</dl>
												</div>
												<div class="col">
													<dl id="div_store_area1"  class="store">
														<dt>지점선택</dt>
													</dl>
												</div>
											</div>
										</div>
										<div class="option-row clearfix">
											<span id="lDateSpan" class="input fl">
												<input type="text" id="lDate" class="brr0 rentDate" placeholder="반납일 선택" name="lDate" value="" readonly="readonly">
											</span>
											<span  class="select-box fl">
												<select name="lHour" id="lHour" class="option01 option02 hour fast-reserve-select" >
													<option value="06">06 시</option>
													<option value="07">07 시</option>
													<option value="08">08 시</option>
													<option value="09">09 시</option>
													<option value="10">10 시</option>
													<option value="11">11 시</option>
													<option value="12">12 시</option>
													<option value="13">13 시</option>
													<option value="14">14 시</option>
													<option value="15">15 시</option>
													<option value="16">16 시</option>
													<option value="17">17 시</option>
													<option value="18">18 시</option>
													<option value="19">19 시</option>
													<option value="20">20 시</option>
													<option value="21">21 시</option>
													<option value="22">22 시</option>
												</select>
											</span>
											<span class="select-box fl">
												<select name="lMinute" id="lMinute" class="option01 option02 timeChange fast-reserve-select">
													<option value="00">00 분</option>
													<option value="30">30 분</option>
												</select>
											</span>
											<span  id="br2" class="multiple-select-box fl is-disabled">
												<strong class="js-multiple-select-text">제주/제주지점</strong>
											</span>
											<div class="layer-multiple-select-box">
												<div class="col">
													<dl id="dlRegion2" class="location">
														<dt>지역선택</dt>
		                                        		<dd><a href="#" data-cd="692001" class="is-selected">서울</a></dd>
		                                        		<dd><a href="#" data-cd="692002">경기</a></dd>
		                                        		<dd><a href="#" data-cd="692003">충청</a></dd>
		                                        		<dd><a href="#" data-cd="692004">경상</a></dd>
		                                        		<dd><a href="#" data-cd="692005">전라</a></dd>
	                                        			<dd><a href="#" data-cd="692006">강원</a></dd>
													</dl>
												</div>
												<div class="col">
													<dl id="div_store_area2"  class="store">
														<dt>지점선택</dt>
													</dl>
												</div>
											</div>
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
											<span>0</span>일
											<span>0</span>시간
											<span>0</span>분
										</p>
									</div>
									<div class="btn-box">
										<!-- 대여/반납 기간, 지점 선택 완료 시 disable 삭제 부탁 드립니다. -->
										<a id="btn_quick" href="javascript:void(0);" class="btn btn-color1 btn-large disable" onclick="go_resv(this)">빠른예약</a>
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
				
				<div class="shortcut short type2">
					<div class="shortcut-wrapper">
						<div class="heading">
							<strong class="tit">SK 단기렌터카의 특별한 서비스</strong>
						</div>
						<div class="list">
							<div class="item">
								<a href="/rent/rentcar/html/dc_guide.do" class="anchor">
									<span class="ico ico-card-discount"></span><!-- 20180611 -->
									<strong class="tit"><span class="explain">회원가입 후 제휴할인 카드로</span>최대 85%까지 할인</strong>
								</a>
							</div>
							<div class="item">
								<a href="/rent/rentcar/html/rent_guide.do" class="anchor">
									<span class="ico ico-accident-costs"></span><!-- 20180611 -->
									<strong class="tit"><span class="explain">제주지점 완전자차 가입시</span>사고비용 고객부담 0원</strong>
								</a>
							</div>
							<div class="item">
								<a href="/rent/rentcar/html/bus_guide.do" class="anchor">	
									<span class="ico ico-jeju-bus" ></span><!-- 20180731 -->
									<strong class="tit"><span class="explain">공항 ↔ 제주지점</span>제주 셔틀버스 안내</strong><!-- 20180731 -->
								</a>
							</div>
							<div class="item">
								<a href="https://www.skcarrental.com/rent/custcnte/notice/notice_view.do?pageNo=1&rowPerPage=10&searchBoardSeqNo=15401&schKind=&schWord=" class="anchor">	
									<span class="ico ico-start" ></span><!-- 20180731 -->
									<strong class="tit"><span class="explain">제주지점</span>바로 출발 서비스 안내</strong><!-- 20180731 -->
								</a>
							</div>
							
						</div>
					</div>
				</div>
				<div class="ad-main-event-promotion">
					<div class="ad-main-event-promotion-wrap">
						<div class="heading">
							<strong class="tit">Event &amp; Promotion</strong>
						</div>
						<div class="helper">
							<div class="slider">
							
						<!-- 하단 베너 롤링 영역 -->	
						
								<div class="list">
									<div class="image">
										<img src="/rent/imageviewer.do?GBN=bnnr&SQ=77" alt="SK렌터카 회원대상 제주 최대 80% 할인!">
									</div>
									<div class="detail">
									
										<div class="tag tag-jeju">제주지점</div>
										
										
																			
										<strong class="title">SK렌터카 회원대상 제주 최대 80% 할인!</strong>
										<span class="date">2020-07-09 ~ 2020-12-31</span>
									
				                		
				                		
				                			<a href="https://www.skcarrental.com/rent/prmt/evnt/evnt_view.do?pageNo=1&rowPerPage=10&searchEvntClsCd=&searchEvntSeqNo=10250&subMenuType=on&schWord=" class="btn-more" >자세히 보기</a>
				                		
			                		
			                			
									</div>
								</div>						
						
								<div class="list">
									<div class="image">
										<img src="/rent/imageviewer.do?GBN=bnnr&SQ=65" alt="SK렌터카 무료여행자보험 이벤트">
									</div>
									<div class="detail">
									
										<div class="tag tag-jeju">제주지점</div>
										
										
																			
										<strong class="title">SK렌터카 무료여행자보험 이벤트</strong>
										<span class="date">2019-10-08 ~ 2020-07-25</span>
									
				                		
				                		
				                			<a href="https://www.skcarrental.com/rent/prmt/evnt/evnt_view.do?pageNo=1&rowPerPage=10&searchEvntClsCd=&searchEvntSeqNo=10235&subMenuType=on&schWord=" class="btn-more" >자세히 보기</a>
				                		
			                		
			                			
									</div>
								</div>						
						
								<div class="list">
									<div class="image">
										<img src="/rent/imageviewer.do?GBN=bnnr&SQ=40" alt="SK렌터카 제주지점 3일 이용시 하루는 무료!">
									</div>
									<div class="detail">
									
										<div class="tag tag-jeju">제주지점</div>
										
										
																			
										<strong class="title">SK렌터카 제주지점 3일 이용시 하루는 무료!</strong>
										<span class="date">2017-11-16 ~ 2020-12-31</span>
									
				                		
				                		
				                			<a href="https://www.skcarrental.com/rent/prmt/evnt/evnt_view.do?pageNo=1&rowPerPage=10&searchEvntClsCd=&searchEvntSeqNo=10167&subMenuType=on&schWord=" class="btn-more" >자세히 보기</a>
				                		
			                		
			                			
									</div>
								</div>						
						
						
						

								<!-- 20180604 : e -->
							</div>
							<div class="arrows"></div>
						</div>
						<div class="dots"></div>
						<div class="btn-box">
							<a href="/rent/prmt/evnt/evnt_list.do" class="btn btn-line4 btn-small btn-arrow">더보기</a>
						</div>
					</div>
				</div>
				<div class="notice short type2">
					<div class="notice-wrapper">
						<div class="list">
							<ul>

	
								<li class="listitem">
									<a href="/rent/custcnte/notice/notice_view.do?searchBoardSeqNo=15493" class="anchor fl"><span class="cate">[단기렌터카]</span> 20년 제주지점 추석, 한글날 연휴 기간 제휴할인율 변경 안내</a>
									<span class="date-ymd fr"> 2020-06-29</span>
								</li>

	
								<li class="listitem">
									<a href="/rent/custcnte/notice/notice_view.do?searchBoardSeqNo=15490" class="anchor fl"><span class="cate">[단기렌터카]</span> 20년 제주 여름 성수기 기간 제휴할인율 재 변경 안내(+추가정정)</a>
									<span class="date-ymd fr"> 2020-06-18</span>
								</li>

							</ul>
						</div>
					</div>
				</div>
				<!-- 20180530 : e -->
				<div class="quick-move long">
					<div class="bg"></div>
					
					<a href="/rent/long/main.do" class="anchor btn-content-move">
						<strong class="tit">Car &amp; Life</strong>
						<span class="txt"><strong class="type">장<br>기<br>렌<br>터<br>카</strong>바<br>로<br>가<br>기</span>
					</a>
				</div>
				<div id="modal-reward-system" class="modal-pop modal-large">
					<div class="modal-box">
						<div class="modal-header">
							<a href="#" class="modal-close">레이어 닫기</a>
							<h3>실시간 예약 안내</h3>
						</div>
						<article>
							<div class="article-content">
								<ul class="list-info v1">
			                        <li>대여기간이 24시간 미만인 경우 할인혜택이 적용되지 않습니다.</li>
			                        <!-- 20180608 : s -->
			                        <li>예약자 본인 명의 제휴카드로만 할인 가능하며, 차량 예약 및 인수 시 제휴카드를 반드시 지참해 주시기 바랍니다.</li>
			                        <li>대여 당일 차량인수 시 운전면허증 지참은 필수입니다.(도로교통법상 유효한 운전면허소지자)</li>
			                        <!-- 20180608 : e -->
			                        <li>외국인의 경우, 국제운전면허증(B등급이상) 소지자에 한해 9인승 이하 차량만 대여 가능합니다.</li>
			                        <li>반드시 예약자와 운전자가 동일해야하며, 제2운전자 등록은 예약자 외 1인에 한해 추가 등록 가능합니다.</li>
			                        <li>취소 및 위약규정<br>
			                            대여시간 24시간 이내 취소 시 순수차량 대여요금의 10% 위약금이 발생합니다.<br>
			                            대여시간 이후(NO-Show) 취소시 순수차량 대여요금의 10% 위약금이 발생합니다.<br>
			                            대여시간에서 2시간 경과시 예약이 임의로 취소됩니다.
			                        </li>
								</ul>
							</div>
						</article>
					</div>
				</div>
			</div>

		</div>
	</div>
	</form>
	
	
	
	
	<div id="inland-info-modal" class="modal-pop modal-large">
		<div class="modal-box">
			<div class="modal-header">
				<a href="#" id="inland-info-modal-close" >레이어 닫기</a>
				<h3>내륙 단기 예약 전 꼭 확인하세요!</h3>
			</div>
			<article>
				<div class="article-content">
					<div style="width: 100%;">
<div>
<img style="margin: 0px; padding: 0px; vertical-align: top;" src="https://image.speedmate.com/speedimg/rentcar/real/popup/200529/pc popup_01.jpg">
</div>	
<div>
<a href="https://www.ajrentacar.co.kr/front/ko/member/joinAgree.do?menuCd=E_01" target="_blank">		
<img style="margin: 0px; padding: 0px; vertical-align: top;" src="https://image.speedmate.com/speedimg/rentcar/real/popup/200529/pc popup_02.jpg">
</a>
</div>	
<div>
<a href="https://www.skcarrental.com/member/join_step1.do?mode=memberRegister">
 <img style="margin: 0px; padding: 0px; vertical-align: top;" src="https://image.speedmate.com/speedimg/rentcar/real/popup/200529/pc popup_03.jpg">
</a>
</div>	
<div>
  <img style="margin: 0px; padding: 0px; vertical-align: top;" src="https://image.speedmate.com/speedimg/rentcar/real/popup/200529/pc popup_04.jpg">
</div>
<div>
<a href="https://www.ajrentacar.co.kr/index.do?utm_source=skrentcar_pc" target="_blank">
 <img style="margin: 0px; padding: 0px; vertical-align: top;" src="https://image.speedmate.com/speedimg/rentcar/real/popup/200529/pc popup_05.jpg">
</a>
</div>
</div>
				</div>
			</article>
		</div>
	</div>
		
	
	
	<div id="sht_rnt_loading" style="display:none;">
		<img src="/resources/img/loading.gif" border="0" class="car"/>
	</div>
	<div class="quick-top">
		<a href="#top" class="btn-top">TOP</a>
	</div>
	<script>
		var sessUserCls = "";
	    function mShortIndex(){
	    	var tmpUserAgent = "";
	    	if(isMobile() && tmpUserAgent != 'pc' ){
	    		location.href = "https://m.skcarrental.com/mobile/rentcar/main.do";
	    	}	    	
	    }
	    mShortIndex();
	    setHour();
	    MinuteCheck();
	    
	    $("#inland-info-modal-close").on("click", function(){
	        $(".modal-pop").css({display:"none"});
	        $("html").removeClass("no-scroll");
	        $(".dimd").css({display:"none"});
	        
	    	$(".wrapper").css({display:"block"});
	    	$("#submain-div").css({display:"block"});
	    	
	    	// 제주 지점으로 탭 변경
			$("input:radio[id='jejuQuickReserve']").change();
			$("input:radio[id='jejuQuickReserve']").prop("checked", true);
			$("input:radio[id='inlandQuickReserve']").prop("checked", false);
			setHour(true);
	    });
	</script>	
	
	

<link rel="stylesheet" href="/resources/css2/newshort.css?v=8">	










<!--  c:if test="$(startsWith(menuId, 'P05') || startsWith(menuId, 'P06'))"-->

<!-- JQuery -->
<script src="/resources/js/bundle.js?v=1" type="text/javascript"></script>
<script src="/resources/js/select2.full.min.js" type="text/javascript"></script>
<script src="/resources/js/secure.js" type="text/javascript"></script>



<!--20170522 추가-->
<div id="modal-email" class="modal-pop">
    <div class="modal-box">
        <div class="modal-header">
            <a href="#" class="modal-close">레이어 닫기</a>
            <h3>이메일무단수집거부</h3>
        </div>
        <article>
            <div class="email-opposite-msg">
                SK렌터카는 무단 이메일 주소 수집을 거부합니다.
            </div>
            <div class="bg-line1">
                본 웹사이트에 게재된 이메일 주소가 전자 우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여<br>
                무단으로 수집되는 것을 거부하며 이를 위반 시 정보통신망 법에 의해 형사 처벌됨을 유념하시기 바랍니다.<br>
                <p>게시일 2017년 8월 15일</p>
            </div>
        </article>
    </div>
    <!-- modal-box//end -->
</div>
<!-- modal-pop//end -->
<div class="dimd" style="display: none;"></div>


<!-- 렌터카지점 지도보기 -->
<div id="modal-office-detail" class="modal-pop modal-large">
    <div class="modal-box">
        <div class="modal-header">
            <a href="#" class="modal-close">레이어 닫기</a>
            <h3>지도보기</h3>
        </div>
        <!-- modal-hedaer//end -->
        <article>
            <div class="office-name clearfix text-r">
                <strong class="fl cl-bold">광주송정지점</strong>
                <span class="cl-point2"></span>
                <span class="cl-point1"></span>
                <span class="cl-deafult"></span>
            </div>
            <ul class="list-info v1">
                <li>
                    <dl class="dl-horizontal">
                        <dt>주소</dt>
                        <dd class="addr-area"></dd>
                    </dl>
                </li>
                <li>
                    <dl class="dl-horizontal">
                        <dt>전화</dt>
                        <dd class="tel-area"></dd>
                    </dl>
                </li>
            </ul><!-- 지도영역 700x230 -->
            <div id="iframe-map" class="iframe-map">
            </div>
            <!-- iframe-map//end -->
            <p class="msg-info v1">지도보기는 NHN에서 제공하는 네이버 오픈 API 지도 서비스를 통해 제공됩니다.</p>
            <div class="btn-box text-c popup-btn">
                
            </div>
            <!-- btn-box//end -->
        </article>
    </div>
    <!-- modal-box//end -->
</div>



<!-- 렌터카지점 지도보기 -->
<div id="modal-office-detail-new" class="modal-pop modal-map">
    <div class="modal-box">
        <div class="modal-header">
            <a href="#" class="modal-close">레이어 닫기</a>
            <h3>지도보기</h3>
        </div>
        <!-- modal-hedaer//end -->
        <article class="map_article">
            <a href="#none" onclick="" class="btn btn-line1 map-fast-btn" >빠른 길찾기</a>
            <div class="office-name clearfix text-r" style="text-align: left !important;">
                <strong class="fl cl-bold">광주송정지점</strong>
                <span class="cl-point2"></span>
                <span class="cl-point1"></span>
                <span class="cl-deafult"></span>
            </div>
            <ul class="list-info v1">
                <li>
                    <dl class="dl-horizontal">
                        <dt>주소</dt>
                        <dd class="addr-area"></dd>
                    </dl>
                </li>
                <li>
                    <dl class="dl-horizontal">
                        <dt>전화</dt>
                        <dd class="tel-area"></dd>
                    </dl>
                </li>
                <li>
                    <dl class="dl-horizontal">
                        <dt>영업시간 </dt>
                        <dd class="openHour-area" >월~금:00:00 ~ 23:59 / 토 ~ 일(공휴일) : 00:00 ~ 23:59</dd>
                    </dl>
                </li>
                
            </ul><!-- 지도영역 700x230 -->
            <div id="iframe-map-new" style="height: 248px;margin-right: 10px;" class="iframe-map">
            </div>
            <!-- iframe-map//end -->
            <p class="msg-info v1">지도보기는 NHN에서 제공하는 네이버 오픈 API 지도 서비스를 통해 제공됩니다.</p>
			<table id="mapWay" class="tb-cnt mt10 map-way">
 
			  <colgroup>
			   <col width="25%">
			   <col width="*">
			  </colgroup>			

			</table>

        </article>
    </div>
    <!-- modal-box//end -->
</div>

</div>


<script>

</script>


</body>
</html>
</layoutTag:layout>