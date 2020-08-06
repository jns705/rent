<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>

<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>  
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.css" rel="stylesheet"> 
 <link href="http://localhost:8082/static/css/fullpage.css" rel="stylesheet" type="text/css"/>
 <link href="http://localhost:8082/static/js/fullpage.js" />
	<meta charset="UTF-8">
	<title>렌트의 기준 - 솔렌트카</title>
</head>

	<style>
		body {
			margin-top : 0px !important;
		}
		
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
.list_ul li:first-child{font-size:25px;line-height: 30px;color:#333;letter-spacing:-1px;}
.list_ul li:nth-child(2){width:25px;height: 3px;background: #f68121;margin: 23px 0;font-size: 0;}
.list_ul li:nth-child(3){font-size:17.5px;line-height: 20px;color:#f16d00;letter-spacing: -1.5px;}
.list_ul li:nth-child(4){font-size:17px;line-height: 23px;color:#777;margin-top:10px;}
.list_ul li:nth-child(5){height: 135px;position: relative;}
.list_ul li:last-child{font-size:18px;line-height: 20px;color:#333;}

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
	


<body id="start" style="background-image: url(http://localhost:8082/static/img/main.jpg); background-repeat: no-repeat;">
	<div id="content">
	<script type="text/javascript">
		var width = $(window).width();
		var height = $(window).height();
		$('#start').css("background-size", width+"px "+ height + "px");
</script>

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
                            		<ul class="list_ul">
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

    
	<div id="sht_rnt_loading" style="display:none;">
		<img src="/resources/img/loading.gif" border="0" class="car">
	</div>    

    <footer class="footer-gate type2" tabindex="0"><!-- 20180607 -->
    	
	</footer>

</div>


<script>
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


</body>
</html>
</layoutTag:layout>