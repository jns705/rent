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
<div class="spot long" >
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
    
    
    
.select-box b {
    background-image: url(http://localhost:8082/static/img/spr-common.png);
    left:350px;
    width: 13px;
    height: 7px;
    background-repeat: no-repeat;
    margin-left: -130px;
    margin-top: 17px;
    background-position: -1331px -1205px;
    -webkit-background-size: 1347px 1290px;
    background-size: 1347px 1290px;
    text-indent: 1000%;
    white-space: nowrap;
    overflow: hidden;
    position: absolute;
}
</style>

<script type="text/javascript">
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
		$('.aa1').attr('style','color:black !important; left: auto; right: 50px; text-decoration: none;')
		$('.aa2').attr('style','color:black !important; left: 40px; width: 100px; text-decoration: none;')

	}else{
		$('#menuHeader11').css('background-color','transparent');
		$('#menuHeader12').css('background-color','transparent');
		$('#menuHeader12').css('background-color','transparent');
		$('.plh').addClass('hidden');
		$('.awaw').attr('style','color:white !important text-decoration: none;')
		$('.aa1').attr('style','color:white !important; left: auto; right: 50px; text-decoration: none;')
		$('.aa2').attr('style','color:white !important; left: 40px; width: 100px; text-decoration: none;')
		
	}});

</script>
							<div class="panel is-selected search_input" style="border:none;"> <!-- 중고차 -->
								<div class="select-area fl" style=" padding-top: 20; padding-left: 30;">
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarMakerId" id="usedCarMakerId" class="option01 option02 inputDate"  onchange="carKind();">
											<option value="">제조사 선택</option>
											<c:forEach items="${manufacturer}" var="manufacturer" varStatus="status">
												<option>${manufacturer.manufacturer}</option>
											</c:forEach>
										</select>
												<b role="presentation"></b>
			                        </span>
									</div>
									<div class="select-col col-3">
			                        <span class="select-box">
										<select name="usedCarSgmntTypeCd" id="usedCarSgmntTypeCd" class="option01 inputDate"  onchange="selectCar();">
											<option value="">차량 유형 선택</option>
										</select>
									<b role="presentation"></b>
			                        </span>
									</div>
									<div class="select-col col-3">
					                    <span class="select-box">
											<select name="usedCartypeId" id="usedCartypeId" class="option01 inputDate" tabindex="-1" aria-hidden="true">
												<option value="">차량 선택</option>
											</select>
										<b role="presentation"></b>
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
				</div>
</form>
</body>
</html>


</layoutTag:layout>