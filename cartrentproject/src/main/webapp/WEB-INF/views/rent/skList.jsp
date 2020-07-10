<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
 <link href="http://localhost:8082/static/css/total.css" rel="stylesheet" type="text/css"/>
	<meta charset="UTF-8">
	<title>중고차 or 신차 리스트 페이지</title>
	<%@ include file="aaa.jsp" %>
</head>
<body>
<div class="content">
	<div class="container">
		<div class="breadcrumbs">
			<h2 class="tit">장기렌트카 리스트</h2>
			
			<div class="clearfix">
				<span>홈</span>
				<span class="cl-point2">장기렌트카 리스트</span>
			</div>
		</div>	
		
		<div class="tab-menu v1">
			<ul>
				<li class="col-4"><a href="#">신차 렌트카</a></li>
				<li class="col-4 selected"><a href="#">중고차 렌트카</a></li>
			</ul>
		</div>
		
		<article class="car-search tab-content" id="tab-direct-user-personal" role="search" style="display: block;">
			<div class="car-search__wrapper clearfix">
				<div class="select-area fl">
					<div class="select-col col-3">
						<span class="select-box"> 
							<select name="usedCarMakerId" id="usedCarMakerId" class="select2-selection select2-selection--single option01" onchange="carKind()">
								<option value="">제조사 선택</option>
								<c:forEach items="${manufacturer}" var="manufacturer" varStatus="status">
									<option>${manufacturer.manufacturer}</option>
								</c:forEach>
							</select>
						</span>
					</div>
					<div class="select-col col-3">
						<span class="select-box"> 
							<select name="usedCarSgmntTypeCd" id="usedCarSgmntTypeCd" class="select2-selection select2-selection--single option01"  onchange="selectCar();">
								<option value="">차량 유형 선택</option>
							</select>
						</span>
					</div>
					<div class="select-col col-3">
						<span class="select-box"> 
							<select name="usedCartypeId" id="usedCartypeId" class="select2-selection select2-selection--single option01" >
								<option value="">차량 선택</option>
							</select>
						</span>
					</div>
						<script type="text/javascript">

							function selectCar() {
								var car_kind = $('#usedCarSgmntTypeCd').val();
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
									},
									error : function(data){alert("gdss");}
								});
							}
						</script>
				</div>
				<div class="btn-wrap fr">
					<a href="#" class="btn btn-color2" id="usedcarSearchButton" >검색</a>
				</div>
			</div>
			
			<div class="newresult_show_box user-car-search">
				<div class="newresult_show">
					<div class="step1_box clearfix pat10">
						<div class="step1  step1_left">
							<p class="result_p_bar fl">대여기간</p>
							<div class="bar_topfont_left">
								<span>1개월</span> <span>48개월</span>
							</div>
							
							<div class="wrap-rangeslider range-duration fl">
								<div id="divUsedcarCntrPsblTerm" class="rangeslider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 0%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span>
								</div>
							</div>
							<div class="area-value">
								<input id="divUsedcarCntrPsblTermAreaValue" type="text" class="range-val duration-val" readonly>개월이상 ~
							</div>
							<script>
							$(function () {
								$('#divUsedcarCntrPsblTerm').slider({
									orientation: "horizontal",
									range: 'min',
									min: 1,
									max: 48,
									step:1,
									value: 1,
									slide: function( event, ui ) {
										$( "#divUsedcarCntrPsblTermAreaValue" ).val( ui.value );
									}
								});
								$('#divUsedcarCntrPsblTermAreaValue').val($('#tab-direct-user-personal .range-duration .rangeslider').slider('value'));
							})   
							</script>
						</div>
						<div class="step1">
							<p class="result_p_bar fl pl12">월 렌탈료</p>
							<div class="bar_topfont">
								<span>10만원</span> <span>100만원 </span>
							</div>
							
							<div class="wrap-rangeslider range-price fl">
								<div id="divUsedcarStdRentAmt" class="rangeslider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 100%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 100%;"></span>
								</div>
							</div>
							<div id="divUsedcarStdRentAmtAreaValue" class="area-value">
								<p class="from100" align="right">전체</p>
							</div>
							<script>
									$(function () {
									$('#divUsedcarStdRentAmt').slider({
										range: true,
										min: 10,
										max: 100,
										values: [ 10, 100 ],
										step: 10,
										slide: function( event, ui ) {
											
											if( ui.values[ 0 ] == ui.values[ 1 ] )
											{
												return false;
											}
											
											setViewStdRentAmt($("#divUsedcarStdRentAmtAreaValue"), ui.values[ 0 ], ui.values[ 1 ],"usedcar");
											
											$( "#tab-direct-user-personal .price-val-1" ).val(ui.values[ 0 ] );
											$( "#tab-direct-user-personal .price-val-2" ).val(ui.values[ 1 ] );
										}
									});
									$('#tab-direct-user-personal .price-val-1').val($('#tab-direct-user-personal .range-price .rangeslider').slider('values',0));
									$('#tab-direct-user-personal .price-val-2').val($('#tab-direct-user-personal .range-price .rangeslider').slider('values',1));
								})
							</script>
						</div>
					</div>
					
					<div class="step1_box clearfix ">
						<div class="step1 step1_left">
							<p class="result_p_bar fl">주행거리</p>
							<div class="bar_topfont_left">
								<span>0만 km</span> <span>10만 km</span>
							</div>
							
							<div class="wrap-rangeslider mileage fl">
								<div id="divUsedcarCurTravelDtc" class="rangeslider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 100%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 100%;"></span>
								</div>
							</div>
							<div id="divUsedcarCurTravelDtcAreaValue" class="area-value">
								<p class="from100">전체</p>
							</div>
							<script>
									$(function () {
										$('#divUsedcarCurTravelDtc').slider({
											range: true,
											min: 0,
											max: 10,
											values: [ 0, 10 ],
											slide: function( event, ui ) {
										
												if( ui.values[ 0 ] == ui.values[ 1 ] )
												{
													return false;
												}
												setViewCurTravelDtc($("#divUsedcarCurTravelDtcAreaValue"),ui.values[ 0 ], ui.values[ 1 ],"usedcar");
												$( "#tab-direct-user-personal .mileage-val-1" ).val(ui.values[ 0 ] );
												$( "#tab-direct-user-personal .mileage-val-2" ).val(ui.values[ 1 ] );
											}
										});
										$('#tab-direct-user-personal .mileage-val-1').val($('#tab-direct-user-personal .mileage .rangeslider').slider('values',0));
										$('#tab-direct-user-personal .mileage-val-2').val($('#tab-direct-user-personal .mileage .rangeslider').slider('values',1));

									})
							</script>
							
						</div>
						<div class="step1">
							<p class="result_p_bar fl pl12">차량등록</p>

							<div class="bar_topfont">
								<span>2015년</span> <span>2020년</span>
							</div>
														
							<div class="wrap-rangeslider car-model fl">
								<div id="divUsedcarPrdyr" class="rangeslider ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
									<div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 100%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span>
									<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 100%;"></span>
								</div>
							</div>
							<div id="divUsedcarPrdyrAreaValue" class="area-value">
								2015년 이상 ~ 2020년 이하
							</div>
							<script>
									$(function () {
									$('#divUsedcarPrdyr').slider({
										range: true,
										min: 2015,
										max: 2020,
										values: [ 2015, 2020 ],
										// step: 10,
										slide: function( event, ui ) {
											
											if( ui.values[ 0 ] == ui.values[ 1 ] )
											{
												return false;
											}
											
											setViewUsedCarPrdyr($("#divUsedcarPrdyrAreaValue"),ui.values[ 0 ], ui.values[ 1 ],"usedcar");
											
											$( "#tab-direct-user-personal .car-model-val-1" ).val(ui.values[ 0 ] );
											$( "#tab-direct-user-personal .car-model-val-2" ).val(ui.values[ 1 ] );
										}
									});
									$('#tab-direct-user-personal .car-model-val-1').val($('#tab-direct-user-personal .car-model .rangeslider').slider('values',0));
									$('#tab-direct-user-personal .car-model-val-2').val($('#tab-direct-user-personal .car-model .rangeslider').slider('values',1));
								})
							</script>
						</div>
					</div>
					<div class="step2_box pd0">
						<p class="result_p">연료</p>
						<ul class="fuel_ul">
							<li id="USEDCAR_F_ALL"	value="2" class="selected_red_font" ><a href="#none">전체</a></li>
							<li id="USEDCAR_210001" value="1" ><a href="#none">휘발유</a></li>
							<li id="USEDCAR_210002" value="1" ><a href="#none">경유</a></li>
							<li id="USEDCAR_210003" value="1" ><a href="#none">LPG</a></li>
							<li id="USEDCAR_210005" value="1" ><a href="#none">하이브리드</a></li>
							<li id="USEDCAR_210007" value="1" ><a href="#none">전기</a></li>
						</ul>
					</div>
					<div class="step2_box">
						<p class="result_p">지역</p>
						<ul class="city_ul">
							<li id="USEDCAR_A_ALL"  value="2" class="selected_red_font" ><a href="#none">전체</a></li>
							<li id="USEDCAR_692001" value="1"><a href="#none">서울</a></li>
							<li id="USEDCAR_692002"	value="1"><a href="#none">경기</a></li>
							<li id="USEDCAR_692003" value="1"><a href="#none">충청</a></li>
							<li id="USEDCAR_692006" value="1"><a href="#none">강원</a></li>
							<li id="USEDCAR_692004" value="1"><a href="#none">경상</a></li>
							<li id="USEDCAR_692005" value="1"><a href="#none">전라</a></li>
							<li id="USEDCAR_692007" value="1"><a href="#none">제주</a></li>
						</ul>
					</div>
					<div class="search_box clearfix">
						<p class="result_p_search fl">검색</p>
						<div class="searchBar">
							<input id="usedCarNo" class="searchBar_input" type="text" title="키워드" placeholder="차량번호로 검색">
							<div class="searchBarBtn">
								<a id="usedCarNoSearchButton" href="#">검색하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
		
	</div>
</div>
</body>

</html>
</layoutTag:layout>