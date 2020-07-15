<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<layoutTag:layout>
<!DOCTYPE html>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value='${now}' pattern='yyyy' var="now"/>
<html>
<style>
	.container {
		width: 1030px; 
	}
	
	#moreBtn {
		margin-top: 30px;
		background-color: #e0e0e0;
	}
</style>
<head>
 <link href="http://localhost:8082/static/css/total.css" rel="stylesheet" type="text/css"/>
 <link href="http://localhost:8082/static/css/bootstrap-slider.css" rel="stylesheet" type="text/css"/>
<%@ include file="slider.jsp" %>
<%@ include file="skListAction.jsp" %>
	<meta charset="UTF-8">
	<title>중고차 or 신차 리스트 페이지</title>
</head>
<body>
<div class="content">
<form class="listForm" action="/rent/rentListProc" method="post">
	<div class="container">
		<div class="breadcrumbs">
			<h2 class="tit">장기렌트카 리스트</h2>
			
			<div class="clearfix">
				<span>홈</span>
				<span class="cl-point2">장기렌트카 리스트</span>
			</div>
		</div>	
		<div class="container">
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
							<select name="manufacturer" id="usedCarMakerId" class="select2-selection select2-selection--single option01" onchange="carKind(); searchForm();">
								<option value="">제조사 선택</option>
								<c:forEach items="${manufacturer}" var="manufacturer" varStatus="status">
									<option>${manufacturer.manufacturer}</option>
								</c:forEach>
							</select>
						</span>
					</div>
					<div class="select-col col-3">
						<span class="select-box"> 
							<select name="car_kind" id="usedCarSgmntTypeCd" class="select2-selection select2-selection--single option01"  onchange="selectCar(); searchForm();">
								<option value="">차량 유형 선택</option>
							</select>
						</span>
					</div>
					<div class="select-col col-3">
						<span class="select-box"> 
							<select name="car_name" id="usedCartypeId" class="select2-selection select2-selection--single option01" onclick="searchForm();">
								<option value="">차량 선택</option>
							</select>
						</span>
					</div>

				</div>
				<div class="btn-wrap fr">
					<a class="btn btn-color2" id="usedcarSearchButton" onclick="searchForm();">검색</a>
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
							<input class="sildeBar" size="100" id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="1" data-slider-max="48" data-slider-step="1" data-slider-value="1" onchange="searchForm();" />
							<div class="area-value">
								<input id="divUsedcarCntrPsblTermAreaValue" name="Max_month" type="text" class="range-val duration-val" readonly>개월이상 ~
							</div>
						</div>
						<div class="step1">
							<p class="result_p_bar fl pl12">월 렌탈료</p>
							<div class="bar_topfont">
								<span>10만원</span> <span>100만원 </span>
							</div>
							
							 <input class="sildeBar"  id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="100" data-slider-step="10" data-slider-value="[10,100]"  onchange="searchForm();" /> 
							 <input class="hidden" name="price1" id="price1" value="0">
							 <input class="hidden" name="price2" id="price2" value="0">
							<div id="divUsedcarStdRentAmtAreaValue" class="area-value">
								<p class="from100" align="right">전체</p>
							</div>
						</div>
					</div>
					
					<div class="step1_box clearfix ">
						<div class="step1 step1_left">
							<p class="result_p_bar fl">주행거리</p>
							<div class="bar_topfont_left">
								<span>0만 km</span> <span>10만 km</span>
							</div>
							
							<input class="sildeBar"  id="ex3" type="text" class="span3" value="" data-slider-min="0" data-slider-max="10" data-slider-step="1" data-slider-value="[0,10]"  onchange="searchForm();" />
							 <input class="hidden" name="milage1" id="milage1" value="0">
							 <input class="hidden" name="milage2" id="milage2" value="0">
							<div id="divUsedcarCurTravelDtcAreaValue" class="area-value">
								<p class="from100">전체</p>
							</div>
						</div>
						<div class="step1">
							<p class="result_p_bar fl pl12">차량등록</p>

							<div class="bar_topfont">
								<span>2015년</span> <span>${now}년</span>
							</div>
									
							<input class="sildeBar"  id="ex4" type="text" class="span4" value="" data-slider-min="2015" data-slider-max="${now}" data-slider-step="1" data-slider-value="[2015,${now}]"  onchange="searchForm();" />					
							 <input class="hidden" name="reg_date1" id="reg_date1" value="0">
							 <input class="hidden" name="reg_date2" id="reg_date2" value="0">
							<div id="divUsedcarPrdyrAreaValue" class="area-value">
								2015년 이상 ~ ${now}년 이하
							</div>
						</div>
					</div>
<input class="hidden" name="limit" value="">

					<div class="step2_box pd0">
						<p class="result_p">연료</p>
						<ul class="fuel_ul">
							<li id="전체"	value="all" class="fuel" onclick="ac('fuel'); searchForm();">전체</li>
						<c:forEach items="${fuel}" var="fuel" varStatus="status">
							<li id="${fuel.FUEL}" value="2" class="fuel${status.index}" onclick="cc(${status.index},'fuel'); searchForm();">${fuel.FUEL}</li>
							<input class="hidden" id="a${fuel.FUEL}" name="f${status.index}">
						</c:forEach>
						</ul>
					</div>
					<div class="step2_box">
						<p class="result_p">지역</p>
						<ul class="fuel_ul">
							<li id="전체"	value="all" class="location" onclick="ac('location'); searchForm();">전체</li>
						<c:forEach items="${location}" var="location" varStatus="status">
							<li id="${location.location}"	value="2" class="location${status.index}"  onclick="cc(${status.index},'location'); searchForm();">${location.location}</li>
							<input class="hidden" id="a${location.location}" name="l${status.index}">
						</c:forEach>
						</ul>
					</div>
					<div class="search_box clearfix">
						<p class="result_p_search fl">검색</p>
						<div class="searchBar">
							<input name="car_number" id="usedCarNo" class="searchBar_input" type="text" title="키워드" placeholder="차량번호로 검색">
							<div class="searchBarBtn" >
								<font size="+1"><span class="glyphicon glyphicon-search"  onclick="searchForm();"></span></font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div>
		<div class="form-group">
			<label class="control-label col-sm-2" id="total"></label>	
			<div align="right" class="col-sm-offset-8 col-sm-2">
			<select name="orderBy" onchange="searchForm();" class="form-control ">
				<option value="0">낮은 가격 순</option>
				<option value="1">높은 가격 순</option>
				<option value="2">짧은 주행거리 순</option>
				<option value="3">최근 등록 순</option>
				<option value="4">인기 순</option>
			</select>
			</div>
		</div>
		<hr>
		<div id="aa"></div>
		
	</div>
</form>
		
</div>
</body>
<script type="text/javascript">
searchForm();
$('#ex1').slider({});  //대여기간
$("#ex2").slider({});  //월렌탈료
$("#ex3").slider({});  //주행거리
$("#ex4").slider({});  //차량등록

//대여기간
$('#ex1').on('slide',function(data){
	$( "#divUsedcarCntrPsblTermAreaValue" ).val(data.value);
});

//월렌탈료
$('#ex2').on('slide',function(data){
	$( "#divUsedcarStdRentAmtAreaValue" ).html('<p class="from100" align="right">'+ data.value[0]+'만원이상 ~ '+ data.value[1]+'만원이하</p>');
	$( "#price1" ).val(data.value[0]*10000);
	$( "#price2" ).val(data.value[1]*10000);
});

//주행거리
$('#ex3').on('slide',function(data){
	$( "#milage1" ).val(data.value[0]*10000);
	$( "#milage2" ).val(data.value[1]*10000);
	$( "#divUsedcarCurTravelDtcAreaValue" ).html('<p class="from100" align="right">'+ data.value[0]+'만Km 이상 ~ '+ data.value[1]+'만Km 이하</p>');
});

//차량등록
$('#ex4').on('slide',function(data){
	$( "#divUsedcarPrdyrAreaValue" ).html(data.value[0]+'년 이상 ~ '+ data.value[1]+'년 이하');
	$( "#reg_date1" ).val(data.value[0]);
	$( "#reg_date2" ).val(data.value[1]);
});
</script>

</html>
</layoutTag:layout>