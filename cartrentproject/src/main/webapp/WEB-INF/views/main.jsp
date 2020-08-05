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
<link href="http://localhost:8082/static/css/total.css" rel="stylesheet"type="text/css" />
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
	<style>
	#fp-nav ul li .active span{
	background:#f68121!important;
	}
	head{border-bottom: none;}
		body {margin-top : 0px !important;}
		
		.carousel-control.left, .carousel-control.right{
			background-image: 		none;
			color: 					#417505;
			
		}	
		
		.carousel-indicators li{
			border-color:  			#417505;
		}
		
		.carousel-indicators li.active{
			background-color: 		#417505;
		}
		
		.item h4{
			font-size: 				19px;
			line-height: 			1.375em;
			font-weight: 			400;
			font-style: 			italic;
			margin: 				70px 0;
		}
		
		.item span{
			font-style: 			normal;
			
		}
		.icon{
			font-size:				20px;
			margin-bottom: 			20px;
			color: 					#417505;
		}
		
		.logo {
			font-size: 				200px;
			color: 					#417505;
		}
		
		.logo-small{
			color: 					#417505;
			font-size: 				50px;
		}
		
		.panel{
			border: 				2px solid #417505;
			border-radius: 			0;
			transition:				box-shadow 0.5s;
		}
		
		.panel:hover{
			box-shadow: 			5px 0px 40px rgba(0, 0, 0, .4); /* .2 투명도 */
		}
		
		
		.panel-heading{
			background-color: 		#417505 !important;
			padding: 				25px;
			border-bottom:			1px solid transparent;
			border-top-right-radius: 	0px;
			border-top-left-radius: 	0px;
			border-bottom-left-radius: 	0px;
			border-bottom-right-radius:	0px;
		}

/* 가운데 박스 마진 및 푸터 위치 */
.content-default .main-service .main-service-wrapper{margin-bottom:70px;}
#start .footer-gate.type2{bottom: 100px;}


/* 가운데 4개 박스 */
.white_div{vertical-align: middle;width: 234px;height: 363px;background-color: rgba( 255, 255, 255, 0.9 );display: inline-block;margin-right: 20px;padding:28px;text-align: left;box-shadow : 12px 12px 25px rgba( 0, 0, 0, 0.1 );}
.hover-border{width: 234px;height: 363px;padding:25px;border:3px solid #f68121;cursor:pointer;}

.shortcut div:last-child{margin-right:0;}
.list_ul li:first-child{font-size:25px!important;line-height: 30px!important;color:#333!important;letter-spacing:-1px!important;}
.list_ul li:nth-child(2){width:25px!important;height: 3px!important;background: #f68121!important;margin: 23px 0!important;font-size: 0!important;}
.list_ul li:nth-child(3){font-size:17.5px!important;line-height: 20px!important;color:#f16d00!important;letter-spacing: -1.5px!important;}
.list_ul li:nth-child(4){font-size:17px!important;line-height: 23px!important;color:#777!important;margin-top:10px!important;}
.list_ul li:nth-child(5){height: 135px!important;position: relative;}
.list_ul li:last-child{font-size:18px!important;line-height: 20px!important;color:#333;}

/* 아이콘 */
.imgsection img{position: absolute;right: 0;width: 65px;height: 65px;}
             
/* 화살표 아이콘 */
.arrowicon{position: relative;}
.arrowicon:after{
	content:"";
	position:absolute;
	top:8px;
	background-image: url(../img/img_intro_arrow.png);
	background-repeat: no-repeat;
	width: 47px;
	height: 10px;
	margin-left:10px;
}

body{
max-width:999999px!important;
}

/* 200103 인트로 이벤트추가*/
.rela{position: relative;}
.event-mini-box{display:none;text-align: left;background-color: #f68121;width: 118px;height: 78px;position: absolute;bottom: 80px;z-index: 99;}
.event-long-box{right: 116px;}
.used-event-long-box{left:380px !important;}
.new-jeju-box{right: 495px;}

/* 200602 내륙단기 > AJ렌터카 로그인안내 팝업창 */
.mr10{margin-right: 10px;}
.aj-modal-ori-pop{margin-left: -298px!important;}
.aj-modal-ori-pop .article-content{padding: 0 20px!important;}
.name_check{color: #444; margin-bottom: 20px;}
.login_popbox{position: relative; float: left; width: 200px; height: 184px; padding: 0; border: 1px solid #ddd;}
.login_popbox:after{position: absolute; left: 85px; top: 31px; content:""; width: 32px; height: 37px; 
	background-image: url(/resources/mobile/img/common.png); background-position: -61px -642px;}
.login_txt{display: block; margin-top: 35px; font-size: 16px; text-align: center;}
.login_button{position: relative; top: 112px; width: 150px; height: 42px; text-align: center; font-size: 18px; display: block; line-height: 42px; margin: 0 auto; color: #fff;}
.aj_members{background: #f68121;}
.non_members{background: #444;}


	</style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>fullPage.js | 한 페이지 스크롤 구역 사이트 플러그인</title>


    <style type="text/css">/*!
 * fullPage 3.0.7
 * https://github.com/alvarotrigo/fullPage.js
 *
 * @license GPLv3 for open source use only
 * or Fullpage Commercial License for commercial use
 * http://alvarotrigo.com/fullPage/pricing/
 *
 * Copyright (C) 2018 http://alvarotrigo.com/fullPage - A project by Alvaro Trigo
 */
 #a {
  padding-top: 0px;
  color:white;
  font-size:20px;
}
#a #span {
  position: absolute;
  bottom:100px;
  left: 50%;
  width: 24px;
  height: 24px;
  margin-left: -12px;
  border-left: 3px solid white;
  border-bottom: 3px solid white;
  -webkit-transform: rotateZ(-45deg);
  transform: rotateZ(-45deg);
  -webkit-animation: sdb 1.5s infinite;
  animation: sdb 1.5s infinite;
  box-sizing: border-box;
}
@-webkit-keyframes sdb {
  0% {
    -webkit-transform: rotateY(0) rotateZ(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    -webkit-transform: rotateY(720deg) rotateZ(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
}
@keyframes sdb {
  0% {
    transform: rotateY(0) rotateZ(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: rotateY(720deg) rotateZ(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
}
 #menuHeader11 , #menuHeader12{
	background-color:  transparent;
	border-bottom:none !important;
a:hover {text-decoration: none;}
}
.fp-enabled body,html.fp-enabled{margin:0;padding:0;overflow:hidden;-webkit-tap-highlight-color:transparent}.fp-section{position:relative;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.fp-slide{float:left}.fp-slide,.fp-slidesContainer{height:100%;display:block}.fp-slides{z-index:1;height:100%;overflow:hidden;position:relative;-webkit-transition:all .3s ease-out;transition:all .3s ease-out}.fp-section.fp-table,.fp-slide.fp-table{display:table;table-layout:fixed;width:100%}.fp-tableCell{display:table-cell;vertical-align:middle;width:100%;height:100%}.fp-slidesContainer{float:left;position:relative}.fp-controlArrow{-webkit-user-select:none;-moz-user-select:none;-khtml-user-select:none;-ms-user-select:none;position:absolute;z-index:4;top:50%;cursor:pointer;width:0;height:0;border-style:solid;margin-top:-38px;-webkit-transform:translate3d(0,0,0);-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.fp-controlArrow.fp-prev{left:15px;width:0;border-width:38.5px 34px 38.5px 0;border-color:transparent #fff transparent transparent}.fp-controlArrow.fp-next{right:15px;border-width:38.5px 0 38.5px 34px;border-color:transparent transparent transparent #fff}.fp-scrollable{position:relative}.fp-scrollable,.fp-scroller{overflow:hidden}.iScrollIndicator{border:0!important}.fp-notransition{-webkit-transition:none!important;transition:none!important}#fp-nav,.fp-slidesNav{opacity:1;-webkit-transform:translate3d(0,0,0)}#fp-nav{margin-top:-32px;top:50%;position:fixed;z-index:100}#fp-nav.fp-right{right:17px}#fp-nav.fp-left{left:17px}.fp-slidesNav{position:absolute;z-index:4;-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0);left:0!important;right:0;margin:0 auto!important}.fp-slidesNav.fp-bottom{bottom:17px}.fp-slidesNav.fp-top{top:17px}#fp-nav ul,.fp-slidesNav ul{margin:0;padding:0}#fp-nav ul li,.fp-slidesNav ul li{display:block;width:14px;height:13px;margin:7px;position:relative}.fp-slidesNav ul li{display:inline-block}#fp-nav ul li a,.fp-slidesNav ul li a{display:block;position:relative;z-index:1;width:100%;height:100%;cursor:pointer;text-decoration:none}#fp-nav ul li a.active span,#fp-nav ul li:hover a.active span,.fp-slidesNav ul li a.active span,.fp-slidesNav ul li:hover a.active span{height:12px;width:12px;margin:-6px 0 0 -6px;border-radius:100%}#fp-nav ul li a span,.fp-slidesNav ul li a span{border-radius:50%;position:absolute;z-index:1;height:4px;width:4px;border:0;background:#333;left:50%;top:50%;margin:-2px 0 0 -2px;-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;transition:all .1s ease-in-out}#fp-nav ul li:hover a span,.fp-slidesNav ul li:hover a span{width:10px;height:10px;margin:-5px 0 0 -5px}#fp-nav ul li .fp-tooltip,.fp-sr-only{position:absolute;overflow:hidden;white-space:nowrap}#fp-nav ul li .fp-tooltip{top:-2px;color:#fff;font-size:14px;font-family:arial,helvetica,sans-serif;max-width:220px;display:block;opacity:0;cursor:pointer;width:0}#fp-nav ul li:hover .fp-tooltip,#fp-nav.fp-show-active a.active+.fp-tooltip{-webkit-transition:opacity .2s ease-in;transition:opacity .2s ease-in;width:auto;opacity:1}#fp-nav ul li .fp-tooltip.fp-right{right:20px}#fp-nav ul li .fp-tooltip.fp-left{left:20px}.fp-auto-height .fp-slide,.fp-auto-height .fp-tableCell,.fp-auto-height.fp-section,.fp-responsive .fp-auto-height-responsive .fp-slide,.fp-responsive .fp-auto-height-responsive .fp-tableCell,.fp-responsive .fp-auto-height-responsive.fp-section{height:auto!important}.fp-sr-only{width:1px;height:1px;padding:0;clip:rect(0,0,0,0);border:0}</style>


    <style id="stylesheet-critical" type="text/css">@CHARSET "ISO-8859-1";blockquote,body,dd,div,dl,dt,fieldset,form,h2,h3,h4,h5,h6,input,li,ol,p,pre,td,textarea,th,ul{padding:0;margin:0}a{text-decoration:none}table{border-spacing:0}abbr,acronym,fieldset,img{border:0}address,caption,cite,code,dfn,em,th,var{font-weight:400;font-style:normal}h1,strong{font-weight:700}strong{font-style:normal}ol,ul{list-style:none}caption,th{text-align:left}h1{padding:0;font-size:8em;margin:0 0 .25em}h2,h3,h4,h5,h6{font-weight:400;font-size:100%}q:after,q:before{content:''}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}#fullpage,.section,body,html{height:100%}body,html{overflow:hidden}.section.fp-table{display:table;table-layout:fixed;width:100%}.fp-tableCell{display:table-cell;vertical-align:middle;width:100%;height:100%}.examples,.fp-slidesNav.bottom{display:none}body{font-family:arial,helvetica;color:#fff}[data-lang=ru] h1{font-size:6em}#section-1 h2,.intro p{-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased}.intro p{max-width:-webkit-calc(30em - (1.3em*2));max-width:calc(30em - (1.3em*2));margin-right:auto;margin-left:auto;padding-right:1.3em;padding-left:1.3em;font-size:1.5em}#fp-nav ul li a span,#menu-line,.fp-slidesNav ul li a span{background:#fff}.section,.twitter-share i,.wrap{position:relative}.section{text-align:center}.wrap{margin-left:auto;margin-right:auto;width:960px}#menu-line{position:absolute;top:24px;left:0;width:101px;height:2px;transition:all 600ms ease}#menu{position:fixed;top:20px;right:20px;z-index:70;-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased;letter-spacing:1px;font-size:1.1em}#menu li{display:inline-block;margin:10px 0}#menu a{color:#fff;padding:0 1.1em 1.1em}.menu-active{font-weight:700}#menu-theme-mobile,.menu-sub{display:none}.menu-sub li{display:block}.plugins{visibility:hidden;position:absolute}#section-1{background-image: url(http://localhost:8082/static/img/자동촤.jpg); background-size: cover;}#section-1 h1{font-size:10em;font-weight:900;color:#fff}#section-1 h2{color:rgba(255,255,255,.7);font-size:1.73em;font-weight:100;margin:-10px 30px 10px}#section-1 li,.github-data{display:inline-block;margin:1.25em .3em}.section-1-button{padding:.93em 1.87em;background:#fff;border-radius:5px;display:block;color:#ff5f45}#download a{background:#004f69;color:#fff}.section-1-usedBy{background-image:url(http://localhost:8082/static/img/main.jpg);width:80%;max-width:536px;height:36px;display:block;margin:0 auto;position:absolute;bottom:20px;left:0;right:0}.language{position:absolute;left:20px;top:14px;z-index:99;opacity:1}.languages{display:none}.language-current{margin:15px 0 6px 15px;z-index:99;cursor:pointer}.flag{width:35px;height:24px;display:inline-block;margin:0 17px 0 0;vertical-align:middle;background-image:url(https://alvarotrigo.com/fullPage/imgs/flags.png)}.flag-chinese{background-position:0 0}.flag-english{background-position:-35px 0}.flag-russian{background-position:-70px 0}.flag-korean{background-position:-105px 0}.flag-spanish{background-position:-140px 0}.language-triangle{position:absolute;top:22px;left:3px;fill:#fff;height:6px;width:8px}.twitter-share i{vertical-align:middle;display:inline-block;width:38px;height:14px;color:#fff;top:-4px;left:-2px;fill:#fff}.twitter-share svg{height:40px;margin-top:-10px}@media screen and (max-width:1135px){.fp-tableCell{font-size:.9em}.examples-wrapper{top:100px;-webkit-transform:none;transform:none}}@media screen and (max-width:1050px){.fp-tableCell{font-size:.85em}}@media screen and (max-width:1030px){#section-3 .intro{width:40%}.shell{width:calc(60% - 54px)}}@media screen and (max-width:900px){#section-3 .intro{display:block;text-align:center;width:100%}#section-3 .intro p{display:none}.shell{width:80%;margin:0}#menu{text-align:center;left:0;right:0}#menu-theme-desktop{display:none!important}#menu-theme-mobile{display:inline-block}.language{left:50%;margin-left:-71px;bottom:70px;top:auto;transition:all 1s ease-in;-webkit-transition:all .3s ease-in;opacity:0;visibility:hidden}.fp-viewing-page1 .language{display:block;opacity:1;visibility:visible}}@media screen and (max-width:700px){.fp-tableCell{font-size:.8em}#menu a{padding:0 .7em .7em}.my-arrow.left,.my-arrow.right{display:none}.fp-slidesNav.bottom{display:block}}@media screen and (max-width:630px){h1{font-size:6.5em}#menu{letter-spacing:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol'}}@media screen and (max-width:550px){#section-1 h1{font-size:6em}h1{font-size:5em}.intro p{max-width:75%}#menu li a{padding:0 .7em .7em}#download,#menu-contact,.mobile-hide{display:none!important}.shell-body{margin:1.6em}#fp-nav.right{right:7px}}@media screen and (max-width:380px){h1{font-size:3.5em}.intro p{max-width:85%}#section-3 .shell{font-size:.8em}.shell-body{margin:1em}}@media only screen and (min-width:551px){.mobile-show{display:none}}</style>

    <!--[if IE]>
        <script type="text/javascript">
             var console = { log: function() {} };
        </script>
    <![endif]-->
    <style id="stylesheet-responsive" type="text/css">@CHARSET "ISO-8859-1";@media screen and (max-width:1135px){.fp-tableCell{font-size:.9em}.examples-wrapper{top:100px;-webkit-transform:none;transform:none}}@media screen and (max-width:1050px){.fp-tableCell{font-size:.85em}}@media screen and (max-width:1030px){#section-3 .intro{width:40%}.shell{width:calc(60% - 54px)}}@media screen and (max-width:900px){#section-3 .intro{display:block;text-align:center;width:100%}#section-3 .intro p{display:none}.shell{width:80%;margin:0}#menu{text-align:center;left:0;right:0}#menu-theme-desktop{display:none!important}#menu-theme-mobile{display:inline-block}.language{left:50%;margin-left:-71px;bottom:70px;top:auto;transition:all 1s ease-in;-webkit-transition:all .3s ease-in;opacity:0;visibility:hidden}.fp-viewing-page1 .language{display:block;opacity:1;visibility:visible}}@media screen and (max-height:500px){.section-1-usedBy{display:none}.fp-slidesNav.bottom{bottom:0}.trusted-by-big{background-position:50% 0;height:54px}}@media screen and (max-height:330px){.fp-section{height:350px!important}}@media screen and (max-width:700px),screen and (max-height:500px){.fp-tableCell{font-size:.8em}#menu a{padding:0 .7em .7em}.my-arrow.left,.my-arrow.right{display:none}.fp-slidesNav.bottom{display:block}}@media screen and (max-width:630px){h1{font-size:6.5em}#menu{letter-spacing:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol'}[data-lang=ru] h1{font-size:4em}}@media screen and (max-width:550px){#section-1 h1{font-size:6em}h1{font-size:5em}[data-lang=ru] h1{font-size:3.6em}.intro p{max-width:75%}#menu li a{padding:0 .7em .7em}[data-lang=es] #menu li a,[data-lang=ru] #menu li a{padding:0 .4em .4em}[data-lang=es] #menu,[data-lang=ru] #menu{font-size:.98em}#download,#menu-contact,.mobile-hide{display:none!important}.shell-body{margin:1.6em}#fp-nav.right{right:7px}}@media screen and (max-width:380px){h1{font-size:3.5em}.intro p{max-width:85%}#section-3 .shell{font-size:.8em}.shell-body{margin:1em}}@media only screen and (min-width:551px){.mobile-show{display:none}}</style>
    
    <c:set var="URL" value="${pageContext.request.requestURL}" />

	    <!-- header 시작 -->
</head>
<body data-lang="ko" id="body">
<div id="fullpage">
<script type="text/javascript">







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


</script>
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
      		
                            	<div class="white_div over-jeju" onclick="location.href='/rent/main.do'"  style="position: relative;">
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
                           		
                            	<div class="white_div over-event" onclick="location.href='/rent/main.do'"> 
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
                            	<a id="a" href="#" ><span id="span"></span>단기렌트</a>
        </div>
    </div>
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
<style>
	.time-area span{
		font-size:28px;
	}
</style>
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
				<a id="a" href="#"  style="color:black; font-weight:800;"><span id="span" style=""></span>장기렌트</a>
    </div>
    <div class="section" id="section-3"  style="margin-bottom:50px; height:700px; background-image: url('http://localhost:8082/static/img/자동차1.jpg'); background-repeat: no-repeat; background-size: cover; padding: 0px !important; margin: 0px  !important;">
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
										<em class="title" style="width:500px; left:355px;">중고차 렌터카 검색</em>
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
    width: 130px !important;
    margin-top: 20px !important;
    line-height:2	 !important;
    }
</style>
							<div class="panel is-selected search_input" style="border:none;"> <!-- 중고차 -->
								<div class="select-area fl" style=" padding-top: 20px; padding-left: 30px;">
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
					<!-- [S] 2018-01-25 변경 -->
				</div>
					</form><br><br><br><br><br><br><br><br><br><br><br><br><br><br><a id="a" href="#"><span id="span" style=""></span>회사소개</a>
        </div>
        
    <div class="section" id="section-4">
    </div>
    </div>
    
</div>

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

</script>

<script type="text/javascript">!function(i,a){"use strict";var e,t,n,s=fp_utils.$,o=fp_utils.after,l=fp_utils.hasClass,u=fp_utils.addClass,r=fp_utils.toggleClass,c=fp_utils.removeClass,f=fp_utils.siblings,d=fp_utils.preventDefault,p=".language",h=s("#menu-line")[0],g=s(".menu-active").offsetWidth,v=0,m=40,L="active";function E(){m=2*parseFloat(getComputedStyle(fp_utils.$(".menu-active a")[0]).paddingLeft)}function y(){var e,t,n,i,a;e="GET",t="https://alvarotrigo.com/fullPage/routes/github-api.php",n=null,i=function(e){var n=JSON.parse(e);Object.keys(n).forEach(function(e){var t=s('[data-github="'+e+'"] h4')[0];t&&(t.innerHTML=n[e])})},(a=new XMLHttpRequest).open(e,t,!0),a.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8"),a.send(n),a.onreadystatechange=function(){4===a.readyState&&(200===a.status?i(a.responseText):console.log("Error: "+a.status))}}function w(e){switch(e.keyCode){case 27:l(s(".examples")[0],L)&&T()}}function b(){l(this,"left")?fullpage_api.moveSlideLeft():fullpage_api.moveSlideRight()}function _(){var e,t,n;e="https://alvarotrigo.com/fullPage/dist/non-critical.min.css?v=2",t=a.document.createElement("link"),a.document.styleSheets,t.rel="stylesheet",t.href=e,o(s("#stylesheet-critical")[0],t),s(".github-stars")[0].setAttribute("src","https://ghbtns.com/github-btn.html?user=alvarotrigo&repo=fullpage.js&type=star&count=true&size=large"),(n=decodeURIComponent(a.location.hash.substr(1))).length&&s("."+n,i).length&&fp_utils.trigger(s(".show-examples")[0],"click"),y()}function k(){clearTimeout(e),e=setTimeout(x,350)}function x(){if(g=s(".menu-active")[0].offsetWidth,a.innerWidth<=900){E();var e=s("#menu a")[0];R.call(e),v=e.offsetLeft}else 900<a.innerWidth&&(E(),R.call(s("#menu a")[0]),v=0)}function T(){clearTimeout(t),t=setTimeout(function(){S(".examples"),fullpage_api.setAllowScrolling(!0)},300)}function C(e){S(".examples"),fullpage_api.setAllowScrolling(!1)}function S(e){r(s(e)[0],L)}function A(e){void 0!==e&&(d(e),(e||a.event).stopPropagation()),S(p)}function W(e){c(s(p)[0],L)}function R(){var e=this.parentNode;D(e.offsetLeft,e.offsetWidth)}function j(){D(v,g)}function D(e,t){h.style.left=e+m/2+"px",h.style.width=t-m+"px"}function H(e){d(e);var t=this.getAttribute("href").substr(1);u(this,L),c(f(this),L);var n=s('[data-tab="'+t+'"]')[0];u(n,L),c(f(n),L)}E(),h.style.width=g-m+"px",h.style.left="20px","en"!==(!(n=navigator.language||navigator.userLanguage)||n.indexOf("-")<0?n:n.split("-")[0])&&A(),k(),s(".menu-active a")[0].addEventListener("click",function(e){e.preventDefault()}),s("#menu li a").forEach(function(e){e.addEventListener("mouseover",R),e.addEventListener("mouseout",j)}),a.addEventListener("resize",k),a.addEventListener("load",_),s(".shell-tab").forEach(function(e){e.addEventListener("click",H)}),s(".language-current")[0].addEventListener("click",A),s("html")[0].addEventListener("click",W),s(".info-close")[0].addEventListener("touchstart",T),s(".info-close")[0].addEventListener("click",T),s(".show-examples")[0].addEventListener("click",C),i.addEventListener("keydown",w),s(".my-arrow").forEach(function(e){e.addEventListener("click",b)}),function(){function e(){dataLayer.push(arguments)}a.dataLayer=a.dataLayer||[],e("js",new Date),e("config","UA-94005074-1"),e("config","AW-1012934304")}()}(document,window);</script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94005074-1"></script>



</body>

</layoutTag:layout>
</html>
