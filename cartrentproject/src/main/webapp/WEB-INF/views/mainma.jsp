<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">

<head>
	<style>
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
.imgsection img{position: absolute;right: 0;top: 35px;width: 65px;height: 65px;}
             
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

/* 200103 인트로 이벤트추가*/
.rela{position: relative;}
.event-mini-box{display:none;text-align: left;background-color: #f68121;width: 118px;height: 78px;position: absolute;bottom: 80px;cursor: pointer;z-index: 99;}
.event-mini-box span{color: #fff;font-size: 14px;display: block;margin: 16px 0 0 14px;}
.event-long-box{right: 116px;}
.used-event-long-box{left:380px;}
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


/* 190930 event! 
.event-mini-box span:first-child{border-bottom: 1px solid rgba(255,255,255,0.6);width: 43px;margin: 12px 0 4px 14px;line-height: 14px;} 
.event-mini-box span:last-child{line-height: 19px;margin: 0 0 5px 14px;}*/

	</style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>fullPage.js | 한 페이지 스크롤 구역 사이트 플러그인</title>
    <meta name="author" content="Alvaro Trigo Lopez">
    <meta name="description" content="Alvaro 제작 플러그인. 전체화면 페이지를 빠르고 손쉽게 만듭니다. 한 페이지 스크롤 구역. 마우스 스냅.">
    <meta name="keywords" content="전체화면, 화면, 전체, 스냅, 스냅핑, 스크롤, 구역">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="twitter:card" content="photo">
    <meta name="twitter:site" content="@imac2">
    <meta name="twitter:creator" content="@imac2">
    <meta name="twitter:title" content="fullPage.js">
    <meta name="twitter:description" content="전체화면 스크롤 웹사이트를 만드는 훌륭한 자바스크립트 라이브러리입니다.">
    <meta name="twitter:image" content="https://alvarotrigo.com/fullPage/imgs/share.png">
    <meta name="twitter:url" content="https://alvarotrigo.com/fullPage/">
    <meta name="Resource-type" content="Document">

    <link rel="canonical" href="https://alvarotrigo.com/fullPage/ko/">
    <link rel="apple-touch-icon" sizes="180x180" href="https://alvarotrigo.com/fullPage/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" href="https://alvarotrigo.com/fullPage/favicons/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="https://alvarotrigo.com/fullPage/favicons/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="https://alvarotrigo.com/fullPage/favicons/manifest.json">
    <link rel="mask-icon" href="https://alvarotrigo.com/fullPage/favicons/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="https://alvarotrigo.com/fullPage/favicons/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="fullPage.js">
    <meta name="application-name" content="fullPage.js">
    <meta name="msapplication-config" content="https://alvarotrigo.com/fullPage/favicons/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <link rel="dns-prefetch" href="https://ajax.googleapis.com">
    <link rel="dns-prefetch" href="https://ghbtns.com">
    <link rel="dns-prefetch" href="https://www.google-analytics.com">
    <link rel="dns-prefetch" href="https://connect.facebook.net">


    <link rel="alternate" href="https://alvarotrigo.com/fullPage/" hreflang="en">
    <link rel="alternate" href="https://alvarotrigo.com/fullPage/zh/" hreflang="zh">
    <link rel="alternate" href="https://alvarotrigo.com/fullPage/ko/" hreflang="ko">
    <link rel="alternate" href="https://alvarotrigo.com/fullPage/es/" hreflang="es">
    <link rel="alternate" href="https://alvarotrigo.com/fullPage/ru/" hreflang="ru">

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
.fp-enabled body,html.fp-enabled{margin:0;padding:0;overflow:hidden;-webkit-tap-highlight-color:transparent}.fp-section{position:relative;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.fp-slide{float:left}.fp-slide,.fp-slidesContainer{height:100%;display:block}.fp-slides{z-index:1;height:100%;overflow:hidden;position:relative;-webkit-transition:all .3s ease-out;transition:all .3s ease-out}.fp-section.fp-table,.fp-slide.fp-table{display:table;table-layout:fixed;width:100%}.fp-tableCell{display:table-cell;vertical-align:middle;width:100%;height:100%}.fp-slidesContainer{float:left;position:relative}.fp-controlArrow{-webkit-user-select:none;-moz-user-select:none;-khtml-user-select:none;-ms-user-select:none;position:absolute;z-index:4;top:50%;cursor:pointer;width:0;height:0;border-style:solid;margin-top:-38px;-webkit-transform:translate3d(0,0,0);-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}.fp-controlArrow.fp-prev{left:15px;width:0;border-width:38.5px 34px 38.5px 0;border-color:transparent #fff transparent transparent}.fp-controlArrow.fp-next{right:15px;border-width:38.5px 0 38.5px 34px;border-color:transparent transparent transparent #fff}.fp-scrollable{position:relative}.fp-scrollable,.fp-scroller{overflow:hidden}.iScrollIndicator{border:0!important}.fp-notransition{-webkit-transition:none!important;transition:none!important}#fp-nav,.fp-slidesNav{opacity:1;-webkit-transform:translate3d(0,0,0)}#fp-nav{margin-top:-32px;top:50%;position:fixed;z-index:100}#fp-nav.fp-right{right:17px}#fp-nav.fp-left{left:17px}.fp-slidesNav{position:absolute;z-index:4;-ms-transform:translate3d(0,0,0);transform:translate3d(0,0,0);left:0!important;right:0;margin:0 auto!important}.fp-slidesNav.fp-bottom{bottom:17px}.fp-slidesNav.fp-top{top:17px}#fp-nav ul,.fp-slidesNav ul{margin:0;padding:0}#fp-nav ul li,.fp-slidesNav ul li{display:block;width:14px;height:13px;margin:7px;position:relative}.fp-slidesNav ul li{display:inline-block}#fp-nav ul li a,.fp-slidesNav ul li a{display:block;position:relative;z-index:1;width:100%;height:100%;cursor:pointer;text-decoration:none}#fp-nav ul li a.active span,#fp-nav ul li:hover a.active span,.fp-slidesNav ul li a.active span,.fp-slidesNav ul li:hover a.active span{height:12px;width:12px;margin:-6px 0 0 -6px;border-radius:100%}#fp-nav ul li a span,.fp-slidesNav ul li a span{border-radius:50%;position:absolute;z-index:1;height:4px;width:4px;border:0;background:#333;left:50%;top:50%;margin:-2px 0 0 -2px;-webkit-transition:all .1s ease-in-out;-moz-transition:all .1s ease-in-out;-o-transition:all .1s ease-in-out;transition:all .1s ease-in-out}#fp-nav ul li:hover a span,.fp-slidesNav ul li:hover a span{width:10px;height:10px;margin:-5px 0 0 -5px}#fp-nav ul li .fp-tooltip,.fp-sr-only{position:absolute;overflow:hidden;white-space:nowrap}#fp-nav ul li .fp-tooltip{top:-2px;color:#fff;font-size:14px;font-family:arial,helvetica,sans-serif;max-width:220px;display:block;opacity:0;cursor:pointer;width:0}#fp-nav ul li:hover .fp-tooltip,#fp-nav.fp-show-active a.active+.fp-tooltip{-webkit-transition:opacity .2s ease-in;transition:opacity .2s ease-in;width:auto;opacity:1}#fp-nav ul li .fp-tooltip.fp-right{right:20px}#fp-nav ul li .fp-tooltip.fp-left{left:20px}.fp-auto-height .fp-slide,.fp-auto-height .fp-tableCell,.fp-auto-height.fp-section,.fp-responsive .fp-auto-height-responsive .fp-slide,.fp-responsive .fp-auto-height-responsive .fp-tableCell,.fp-responsive .fp-auto-height-responsive.fp-section{height:auto!important}.fp-sr-only{width:1px;height:1px;padding:0;clip:rect(0,0,0,0);border:0}</style>

    <style id="stylesheet-critical" type="text/css">@CHARSET "ISO-8859-1";blockquote,body,dd,div,dl,dt,fieldset,form,h2,h3,h4,h5,h6,input,li,ol,p,pre,td,textarea,th,ul{padding:0;margin:0}a{text-decoration:none}table{border-spacing:0}abbr,acronym,fieldset,img{border:0}address,caption,cite,code,dfn,em,th,var{font-weight:400;font-style:normal}h1,strong{font-weight:700}strong{font-style:normal}ol,ul{list-style:none}caption,th{text-align:left}h1{padding:0;font-size:8em;margin:0 0 .25em}h2,h3,h4,h5,h6{font-weight:400;font-size:100%}q:after,q:before{content:''}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}#fullpage,.section,body,html{height:100%}body,html{overflow:hidden}.section.fp-table{display:table;table-layout:fixed;width:100%}.fp-tableCell{display:table-cell;vertical-align:middle;width:100%;height:100%}.examples,.fp-slidesNav.bottom{display:none}body{font-family:arial,helvetica;color:#fff}[data-lang=ru] h1{font-size:6em}#section-1 h2,.intro p{-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased}.intro p{max-width:-webkit-calc(30em - (1.3em*2));max-width:calc(30em - (1.3em*2));margin-right:auto;margin-left:auto;padding-right:1.3em;padding-left:1.3em;font-size:1.5em}#fp-nav ul li a span,#menu-line,.fp-slidesNav ul li a span{background:#fff}.section,.twitter-share i,.wrap{position:relative}.section{text-align:center}.wrap{margin-left:auto;margin-right:auto;width:960px}#menu-line{position:absolute;top:24px;left:0;width:101px;height:2px;transition:all 600ms ease}#menu{position:fixed;top:20px;right:20px;z-index:70;-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased;letter-spacing:1px;font-size:1.1em}#menu li{display:inline-block;margin:10px 0}#menu a{color:#fff;padding:0 1.1em 1.1em}.menu-active{font-weight:700}#menu-theme-mobile,.menu-sub{display:none}.menu-sub li{display:block}.plugins{visibility:hidden;position:absolute}#section-1{background:#ff5f45}#section-1 h1{font-size:10em;font-weight:900;color:#fff}#section-1 h2{color:rgba(255,255,255,.7);font-size:1.73em;font-weight:100;margin:-10px 30px 10px}#section-1 li,.github-data{display:inline-block;margin:1.25em .3em}.section-1-button{padding:.93em 1.87em;background:#fff;border-radius:5px;display:block;color:#ff5f45}#download a{background:#004f69;color:#fff}.section-1-usedBy{background-image:url(http://localhost:8082/static/img/main.jpg);width:80%;max-width:536px;height:36px;display:block;margin:0 auto;position:absolute;bottom:20px;left:0;right:0}.language{position:absolute;left:20px;top:14px;z-index:99;opacity:1}.languages{display:none}.language-current{margin:15px 0 6px 15px;z-index:99;cursor:pointer}.flag{width:35px;height:24px;display:inline-block;margin:0 17px 0 0;vertical-align:middle;background-image:url(https://alvarotrigo.com/fullPage/imgs/flags.png)}.flag-chinese{background-position:0 0}.flag-english{background-position:-35px 0}.flag-russian{background-position:-70px 0}.flag-korean{background-position:-105px 0}.flag-spanish{background-position:-140px 0}.language-triangle{position:absolute;top:22px;left:3px;fill:#fff;height:6px;width:8px}.twitter-share i{vertical-align:middle;display:inline-block;width:38px;height:14px;color:#fff;top:-4px;left:-2px;fill:#fff}.twitter-share svg{height:40px;margin-top:-10px}@media screen and (max-width:1135px){.fp-tableCell{font-size:.9em}.examples-wrapper{top:100px;-webkit-transform:none;transform:none}}@media screen and (max-width:1050px){.fp-tableCell{font-size:.85em}}@media screen and (max-width:1030px){#section-3 .intro{width:40%}.shell{width:calc(60% - 54px)}}@media screen and (max-width:900px){#section-3 .intro{display:block;text-align:center;width:100%}#section-3 .intro p{display:none}.shell{width:80%;margin:0}#menu{text-align:center;left:0;right:0}#menu-theme-desktop{display:none!important}#menu-theme-mobile{display:inline-block}.language{left:50%;margin-left:-71px;bottom:70px;top:auto;transition:all 1s ease-in;-webkit-transition:all .3s ease-in;opacity:0;visibility:hidden}.fp-viewing-page1 .language{display:block;opacity:1;visibility:visible}}@media screen and (max-width:700px){.fp-tableCell{font-size:.8em}#menu a{padding:0 .7em .7em}.my-arrow.left,.my-arrow.right{display:none}.fp-slidesNav.bottom{display:block}}@media screen and (max-width:630px){h1{font-size:6.5em}#menu{letter-spacing:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol'}}@media screen and (max-width:550px){#section-1 h1{font-size:6em}h1{font-size:5em}.intro p{max-width:75%}#menu li a{padding:0 .7em .7em}#download,#menu-contact,.mobile-hide{display:none!important}.shell-body{margin:1.6em}#fp-nav.right{right:7px}}@media screen and (max-width:380px){h1{font-size:3.5em}.intro p{max-width:85%}#section-3 .shell{font-size:.8em}.shell-body{margin:1em}}@media only screen and (min-width:551px){.mobile-show{display:none}}</style>

    <!--[if IE]>
        <script type="text/javascript">
             var console = { log: function() {} };
        </script>
    <![endif]-->
    <style id="stylesheet-responsive" type="text/css">@CHARSET "ISO-8859-1";@media screen and (max-width:1135px){.fp-tableCell{font-size:.9em}.examples-wrapper{top:100px;-webkit-transform:none;transform:none}}@media screen and (max-width:1050px){.fp-tableCell{font-size:.85em}}@media screen and (max-width:1030px){#section-3 .intro{width:40%}.shell{width:calc(60% - 54px)}}@media screen and (max-width:900px){#section-3 .intro{display:block;text-align:center;width:100%}#section-3 .intro p{display:none}.shell{width:80%;margin:0}#menu{text-align:center;left:0;right:0}#menu-theme-desktop{display:none!important}#menu-theme-mobile{display:inline-block}.language{left:50%;margin-left:-71px;bottom:70px;top:auto;transition:all 1s ease-in;-webkit-transition:all .3s ease-in;opacity:0;visibility:hidden}.fp-viewing-page1 .language{display:block;opacity:1;visibility:visible}}@media screen and (max-height:500px){.section-1-usedBy{display:none}.fp-slidesNav.bottom{bottom:0}.trusted-by-big{background-position:50% 0;height:54px}}@media screen and (max-height:330px){.fp-section{height:350px!important}}@media screen and (max-width:700px),screen and (max-height:500px){.fp-tableCell{font-size:.8em}#menu a{padding:0 .7em .7em}.my-arrow.left,.my-arrow.right{display:none}.fp-slidesNav.bottom{display:block}}@media screen and (max-width:630px){h1{font-size:6.5em}#menu{letter-spacing:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol'}[data-lang=ru] h1{font-size:4em}}@media screen and (max-width:550px){#section-1 h1{font-size:6em}h1{font-size:5em}[data-lang=ru] h1{font-size:3.6em}.intro p{max-width:75%}#menu li a{padding:0 .7em .7em}[data-lang=es] #menu li a,[data-lang=ru] #menu li a{padding:0 .4em .4em}[data-lang=es] #menu,[data-lang=ru] #menu{font-size:.98em}#download,#menu-contact,.mobile-hide{display:none!important}.shell-body{margin:1.6em}#fp-nav.right{right:7px}}@media screen and (max-width:380px){h1{font-size:3.5em}.intro p{max-width:85%}#section-3 .shell{font-size:.8em}.shell-body{margin:1em}}@media only screen and (min-width:551px){.mobile-show{display:none}}</style>
</head>
<script type="text/javascript">
d
</script>
<body data-lang="ko">
<div id="fullpage">
<script type="text/javascript">
function goChat(){
	window.open("/rent/login/pop_chat.do", "pop", "width=450, height=650, fullscreen=no, resizable=yes");
}

/* 190930 인트로 이벤트 스크립트 추가 */
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

	// 200528 추가
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

function goEvent(branch){
	showloading();
	if(branch == 'tesla'){
		location.href="/rent/long/direct/tesla_event_integration.do";
	}else if (branch == 'event'){
		location.href="/rent/prmt/evnt/evnt_view.do?pageNo=1&rowPerPage=10&searchEvntClsCd=&searchEvntSeqNo=10250&subMenuType=on&schWord=";
	}
}

function goEvents(branch){
	showloading();
	if(branch == 'tesla'){
		location.href="/rent/long/direct/tesla_event_integration.do";
	}else if (branch == 'events'){
		window.open('/rent/promotion/long_rental_counsel_dotcom.do?landing=Y');
		hideloading();
	}
}

</script>
    <div class="section fp-table" id="section-1"  style="background-image: url(http://localhost:8082/static/img/main.jpg); background-repeat: no-repeat; background-size: cover;">
        <div class="fp-tableCell">
	<div id="content">
        <div class="content content-default content-original is-expanded" data-type="gate" style="height: 757px; margin-top: 0px;">
            <div class="content-wrapper">
                <div class="main-service">
                    <div class="main-service-wrapper">
                        <div class="container long">
                            <div class="heading">
                                <h2 class="title"  style=" margin: 100px;">똑똑한 선택! 즐거운 여행!</h2>
                            </div>                           
                            <div class="shortcut rela">    
                              <!-- 200528 테슬라이벤트 추가 -->
                               <div class="event-mini-box tesla-event-box" style="left:130px;" onclick="javascript:goEvent('tesla');">
                           			<span>신차<br>상담 신청</span>
                           		</div>                      	
                            	<div class="white_div tesla-ovet-event" onclick="location.href='/rent/NewRentList'">
                            		<ul class="list_ul" style="width: 178px; height: 308px;">
                            			<li>신차 다이렉트</li>
                            			<li>바</li>
                            			<li>경제적인 신차구매</li>
                            			<li>더 좋은 차를 가지는<br>합리적인 방법!</li>
                            			<li class="imgsection"><img src="http://localhost:8082/static/img/img_car_icon.png"></li>
                            			<li class="arrowicon">신차 견적 검색</li>
                            		</ul>
                            	</div>
                            	<!-- 200319 중고차상담신청 이벤트 -->   
								<div class="event-mini-box used-event-long-box" onclick="javascript:goEvents('events');">
                           			<span>월간 렌터카<br>특가 이벤트</span>
                           		</div>     
                            	<div class="white_div used-over-event" onclick="location.href='/rent/rentList'">
                            		<ul class="list_ul">
                            			<li>중고차 장기</li>
                            			<li>바</li>
                            			<li>믿을 수 있는 중고차렌트</li>
                            			<li>이젠 사지말고<br>가성비 좋은 렌터카로!</li>
                            			<li class="imgsection"><img src="http://localhost:8082/static/img/img_car_icon.png"></li>
                            			<li class="arrowicon">중고차 견적 검색</li>
                            		</ul>          		
                            	</div> 
                            	                 	  
                				<!-- 200103 이벤트 -->   
								<div class="event-mini-box new-jeju-box" style="right: 495px;" onclick="javascript:goEvent('event');" style="display: none;">
                           			<span>솔렌터카 최대<br>80% 할인!</span>
                           		</div>          		
                            	<div class="white_div over-jeju" onclick="location.href='/rent/main.do'">
                            		<ul class="list_ul">
                            			<li>제주 단기</li>
                            			<li>바</li>
                            			<li>바로 출발 서비스로</li>
                            			<li>기다림 없이!<br>빠른 렌터카 대여</li>
                            			<li class="imgsection"><img src="http://localhost:8082/static/img/img_short_icon.png"></li>
                            			<li class="arrowicon">제주 빠른 예약</li>
                            		</ul>
                            	</div>
                           		
                            	<div class="white_div over-event" onclick="location.href='/rent/main.do'"> 
                            		<ul class="list_ul">
                            			<li>내륙 단기</li>
                            			<li>바</li>
                            			<li>제휴 할인 혜택으로</li>
                            			<li>더욱 가볍게!<br>빠른 실시간 예약</li>
                            			<li class="imgsection"><img src="http://localhost:8082/static/img/img_short_icon.png"></li>
                            			<li class="arrowicon">내륙 빠른 예약</li>
                            		</ul>
                            	</div>
                            </div><!-- //shortcut -->
                        </div><!-- //container long -->                      
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    </div>

    <div class="section" id="section-2">
        <button class="my-arrow left">
            <svg width="60px" height="80px" viewbox="0 0 50 80" xml:space="preserve">
                <polyline fill="none" stroke="#FFFFFF" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" points="
                    45.63,75.8 0.375,38.087 45.63,0.375 ">
            </polyline></svg>
        </button>
        <button class="my-arrow right">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="60px" height="80px" viewbox="0 0 50 80" xml:space="preserve">
                <polyline fill="none" stroke="#FFFFFF" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" points="
                    0.375,0.375 45.63,38.087 0.375,75.8 ">
            </polyline></svg>
        </button>
        <div class="slide active">
            <div class="intro">
                <h1>열려 있어요</h1>
                <p>fullPage.js is actively maintained and community driven.</p>
                <p>2013년부터 개발자가 맞닥뜨리는 문제를 해결하고 있습니다.</p>

                <ul>
                    <li class="github-data github-data-1" data-github="commits">
                        <h4>-</h4>
                        <span>commits</span>
                    </li>

                    <li class="github-data github-data-2" data-github="closed_issues">
                        <h4>-</h4>
                        <span>해결된 문제</span>
                    </li>

                    <li class="github-data github-data-3" data-github="contributors">
                        <h4>-</h4>
                        <span>기여자</span>
                    </li>
                </ul>
            </div>
            <div class="sponsors">
                <div>Sponsored by</div>
                <a href="https://www.browserstack.com" target="_blank" rel="nofollow noopener noreferrer"></a>
                <a href="https://stackpath.com" target="_blank" rel="nofollow noopener noreferrer"></a>
                <a href="https://codepen.io" target="_blank" rel="nofollow noopener noreferrer"></a>
                <a href="https://hostpresto.com/?utm_source=alvaro" target="_blank" rel="nofollow noopener noreferrer"></a>
                <a href="https://www.codefirst.co.uk/" target="_blank" rel="noopener"></a>
            </div>
        </div>
        <div class="slide" id="slide-2-2">
            <div class="intro">
                <h1>단연 최고!</h1>
                <p>
                    가장 완성된 틀임을 자부심 있게 선언합니다.
                    혁신의 선두를 달리는 기업에게 신뢰받고 있습니다.
                </p>
                <div class="bg-image trusted-by-big"></div>
            </div>
        </div>
        <div class="slide">
            <div class="intro">
                <h1>훌륭한 호환성</h1>
                <p>
                    최신 브라우저뿐만 아니라 예전 버전에서도 작동합니다. 심지어 IE 9에서도 작동합니다!
                    소수가 아닌 모두를 위한 멋진 웹사이트를 만들어 보세요!
                </p>
                <div class="bg-image compatible"></div>
            </div>
        </div>
    </div>
    <div class="section fp-table" id="section-3">
        <div class="fp-tableCell">
            <div class="intro">
                <h1>쉬워요!</h1>
                <p>
                    fullPage.js는 쉽게 사용하고 맞춤 설정할 수 있도록 고안되었습니다.
                    수십 가지 예시, 훌륭한 문서화, 탁월한 개인 및 공동체 지원을 자랑합니다.
                </p>
            </div><!--
            --><div class="shell">
                <div class="shell-header">
                    <span class="shell-header-actions shell-header-close"></span>
                    <span class="shell-header-actions shell-header-minimize"></span>
                    <span class="shell-header-actions shell-header-maximize"></span>
                    <span class="shell-tabs">
                        <a href="#html" class="active shell-tab">HTML</a>
                        <a href="#js" class="shell-tab">JS</a>
                    </span>
                    <a href="https://codepen.io/alvarotrigo/pen/qqabrp" class="shell-demo">Codepen에서 보기</a>
                </div>

                <div class="shell-body">

<div class="shell-tab-content active" data-tab="html">
<figure class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;div</span> <span class="na">id=</span><span class="s">"fullpage"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"section"</span><span class="nt">&gt;</span><span class="mobile-show"><br>        </span>Section 1<span class="mobile-show"><br>    </span><span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"section"</span><span class="nt">&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"slide"</span><span class="nt">&gt;</span><span class="mobile-show"><br>            </span>Slide 2.1<span class="mobile-show"><br>         </span><span class="nt">&lt;/div&gt;</span>
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"slide"</span><span class="nt">&gt;</span><span class="mobile-show"><br>            </span>Slide 2.2<span class="mobile-show"><br>         </span><span class="nt">&lt;/div&gt;</span><span class="mobile-hide">
        <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"slide"</span><span class="nt">&gt;</span><span class="mobile-show"><br>            </span>Slide 2.3<span class="mobile-show"><br>         </span><span class="nt">&lt;/div&gt;</span></span>
    <span class="nt">&lt;/div&gt;</span>
    <span class="nt">&lt;div</span> <span class="na">class=</span><span class="s">"section"</span><span class="nt">&gt;</span><span class="mobile-show"><br>        </span>Section 3<span class="mobile-show"><br>    </span><span class="nt">&lt;/div&gt;</span>
<span class="nt">&lt;/div&gt;</span></code></pre></figure>
</div>

<div class="shell-tab-content" data-tab="js">
<figure class="highlight"><pre><code class="language-javascript" data-lang="javascript"><span class="kc">new</span> <span class="na">fullpage</span><span class="p">(</span><span class="s1">'#fullpage'</span><span class="p">, {
    <span class="na">navigation</span><span class="p">:</span> <span class="kc">true</span><span class="p">,</span>
    <span class="na">responsiveWidth</span><span class="p">:</span> <span class="mi">700</span><span class="p">,</span>
    <span class="na">anchors</span><span class="p">:</span> <span class="p">[</span><span class="s1">'home'</span><span class="p">,</span> <span class="s1">'about-us'</span><span class="p">,</span> <span class="s1">'contact'</span><span class="p">],</span>
    <span class="na">parallax</span><span class="p">:</span> <span class="kc">true</span><span class="p">,</span>
    <span class="na">onLeave</span><span class="p">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">origin</span><span class="p">,</span> <span class="nx">destination</span><span class="p">,</span> <span class="nx">direction</span><span class="p">){</span>
        <span class="nx">console</span><span class="p">.</span><span class="nx">log</span><span class="p">(</span><span class="s2">"Leaving section"</span> <span class="o">+</span> <span class="nx">origin.index</span><span class="p">);</span>
    <span class="p">},</span>
<span class="p">});</span></span></code></pre></figure>
</div>
                </div>
            </div>
        </div>
    </div>
    <div class="section" id="section-4">
        <div class="intro">
            <div class="section-4-finger"></div>
            <h1>만져보세요!</h1>
            <p>모바일 기기와 태블릿에서 완전히 반응하도록 설계되었습니다.</p>
            <p>누구나 아이처럼 신나게 만지고 싶으니까요.</p>
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

<div class="examples">
    <a href="#" class="info-close"></a>
    <div class="examples-wrapper">
        <div class="examples-column">
            <h3>이동</h3>
            <ul>
            <li><a href="https://alvarotrigo.com/fullPage/examples/scrollBar.html">스크롤 막대 활성화됨</a></li>
            <li><a href="https://alvarotrigo.com/fullPage/examples/normalScroll.html">정상 스크롤</a></li>
            <li><a href="https://alvarotrigo.com/fullPage/examples/continuous.html">연속 수직</a></li>
            <li><a href="https://alvarotrigo.com/fullPage/examples/noAnchor.html">앵커 링크가 없음 (동일 URL)</a></li>
            <li><a href="https://alvarotrigo.com/fullPage/examples/navigationV.html">수직 이동 점</a></li>
            <li><a href="https://alvarotrigo.com/fullPage/examples/navigationH.html">수평 이동 점</a></li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://alvarotrigo.com/fullPage/dist/fullpage.dragAndMove2.limited.min.js?v11"></script>

<script type="text/javascript" src="https://alvarotrigo.com/fullPage/fullpage.extensions.min.js"></script>
<script type="text/javascript">
        new fullpage('#fullpage', {
            anchors: ['page1', 'page2', 'page3', 'page4'],
            navigationTooltips: ['fullPage', 'Open', 'Easy', 'Touch'],
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
</html>
