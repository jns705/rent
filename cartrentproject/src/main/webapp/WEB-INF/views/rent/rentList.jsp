<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="searchCondition" id="search_agreeDist" value=""/>
	<input type="hidden" name="searchCondition" id="search_companyName" value=""/>
	<input type="hidden" name="searchCondition" id="search_carGubun" value=""/>
	<input type="hidden" name="searchCondition" id="search_carName" value="" />
	<input type="hidden" name="searchCondition" id="search_priceStd" value=""/>
	<input type="hidden" name="searchCondition" id="search_priceSearch" value=""/>	
	<input type="hidden" name="searchCondition" id="search_fuelKd" value=""/>	
	
	<div class="container">
		<div class="amazon-tabs">
			<a href="/rent/domestic"><div class="amazon-tab active">국산신차</div></a>
			<a href="/rent/imports"><div class="amazon-tab">수입신차</div></a>
		</div>
		<div class="amazon-tab-info" style="margin-top: 20px;">
			<div class="amazon-tab-info-title">아마존카의  장기렌트는?</div>
    		<div class="amazon-tab-info-content">
    			고객이 원하는 차량을 구매하여 고객이 약정한 기간동안 장기로 대여해드리는 서비스이며,<br/>
				약정주행거리, 정비포함여부, 차량옵션, 용품 등 구미에 맞게 선택하여 국내에선 유일하게 모든 차량 100% 가격공개 및 실시간 견적서비스도 함께 제공합니다.
				<span class="label label-warning rent-desc">상세보기</span>
    		</div>
			<div class="rent-required" style="display:none;">
				<span class="glyphicon glyphicon-check"></span>&nbsp;<span>만 26세 이상 / 운전면허 취득 3년 이상 / 본인 명의 신용카드 소지자</span>만 월 렌트 가능합니다.
			</div>
		</div>
	</div>
	
	<!-- 검색존 -->
	<form target="_self" method="get" id="searchForm" action="/rent/domestic">
		<input type="hidden" name="tempCompNm" value="">
		<input type="hidden" name="tempFuelKd" value="">
		<div class="container">
			<table class="table" >
				<tr>
					<th>제조사</th>
					<td>
						<input type="radio" name="companyName" value="" checked id="company-all"/>
						<label for="company-all">전체</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0001" id="company-0001" />
						<label for="company-0001">현대</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0002" id="company-0002"/>
						<label for="company-0002">기아</label>
					</td>
					<td colspan="2">
						<input type="radio" name="companyName" value="0004" id="company-0004"/>
						<label for="company-0004">한국GM(쉐보레)</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0005" id="company-0005"/>
						<label for="company-0005">쌍용</label>
					</td>	
					<td>
						<input type="radio" name="companyName" value="0003" id="company-0003"/>
						<label for="company-0003">르노삼성</label>
					</td>
					
					<td></td>
				</tr>
				<tr class="multiple-line">
					<th>차종</th>
					<td>
						<input type="radio" name="carGubun" value="" checked id="gubun-all"/>
						<label for="gubun-all">전체</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="3L" id="gubun-3L"/>
						<label for="gubun-3L">중형·소형승용(LPG)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="4L" id="gubun-4L"/>
						<label for="gubun-4L">대형승용(LPG)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="12" id="gubun-12"/>
						<label for="gubun-12">소형승용/경승용(가솔린,디젤)</label>
					</td>
					<td></td>
					
				</tr>
				<tr class="multiple-line">
					<th></th>
					<td></td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="30" id="gubun-30"/>
						<label for="gubun-30">중형승용(가솔린,디젤)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="40"  id="gubun-40"/>
						<label for="gubun-all">대형승용(가솔린,디젤)</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="8"  id="gubun-8"/>
						<label for="gubun-8">RV</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="9" id="gubun-9"/>
						<label for="gubun-9">
							화물/승합	
						</label><br/>
					</td>
					<td>
						<input type="radio" name="carGubun" value="green" id="gubun-green" />
						<label for="gubun-green" class="primary" style="font-weight:500 !important;">친환경차</label>
					</td>
				</tr>
				<tr>
					<th>연간 약정운행거리</th>
					<td>
						<input type="radio" name="agreeDist" checked value="10000" id="dist-1"/>
						<label for="dist-1">10,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="15000" id="dist-2"/>
						<label for="dist-2">15,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="20000" id="dist-3"/>
						<label for="dist-3">20,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="25000" id="dist-4"/>
						<label for="dist-4">25,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="30000" id="dist-5"/>
						<label for="dist-5">30,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="40000" id="dist-6" />
						<label for="dist-6">40,000km</label>
					</td>
					<td colspan="2"></td>
				</tr>
				
				<tr>
					<th>
						월대여료
					</th>
					<td colspan="8">
						<div class="filter-condition" style="float: left; padding-right: 30px;">
						 	<select name="priceSearch" style="width:130px;">
								<option value="">금액 전체</option>
							 	<option value="20">20만원대</option>
							 	<option value="30">30만원대</option>
							 	<option value="40">40만원대</option>
							 	<option value="50">50만원대</option>
							 	<option value="60">60만원대</option>
							 	<option value="70">70만원~100만원</option>
							 	<option value="100">100만 이상</option>
						 	</select>
							<select style="width:130px;" name="priceStd">
								<option value="36">36개월 견적기준</option>
								<option value="48" selected>48개월 견적기준</option>
								<option value="60">60개월 견적기준</option>
							</select>
						</div>
						<div class="filter-condition" style="float: left; padding-right: 30px;">
							<span class="bold" style="padding-right: 20px;">차명</span>
							<select class="selectCarName" name="carName" id="carName-search">
								<option value="">차명 전체</option>
								<!-- for문 -->
									<option value="넥쏘">[현대]넥쏘</option>
								
									<option value="더뉴 그랜저">[현대]더뉴 그랜저</option>
								
									<option value="더뉴 그랜저 LPG">[현대]더뉴 그랜저 LPG</option>
								
									<option value="더뉴 그랜저 하이브리드">[현대]더뉴 그랜저 하이브리드</option>
								
									<option value="더뉴 싼타페">[현대]더뉴 싼타페</option>
								
									<option value="더뉴 아이오닉 일렉트릭">[현대]더뉴 아이오닉 일렉트릭</option>
								
									<option value="베뉴">[현대]베뉴</option>
								
									<option value="스타렉스">[현대]스타렉스</option>
								
									<option value="쏘나타 DN8">[현대]쏘나타 DN8</option>
								
									<option value="쏘나타 DN8 LPG">[현대]쏘나타 DN8 LPG</option>
								
									<option value="쏘나타 DN8 하이브리드">[현대]쏘나타 DN8 하이브리드</option>
								
									<option value="아반떼 CN7">[현대]아반떼 CN7</option>
								
									<option value="아반떼 CN7 LPG">[현대]아반떼 CN7 LPG</option>
								
									<option value="올뉴투싼">[현대]올뉴투싼</option>
								
									<option value="제네시스 G70">[현대]제네시스 G70</option>
								
									<option value="제네시스 G80 (RG3)">[현대]제네시스 G80 (RG3)</option>
								
									<option value="제네시스 G90">[현대]제네시스 G90</option>
								
									<option value="제네시스 GV80">[현대]제네시스 GV80</option>
								
									<option value="코나">[현대]코나</option>
								
									<option value="코나 일렉트릭">[현대]코나 일렉트릭</option>
								
									<option value="코나 하이브리드">[현대]코나 하이브리드</option>
								
									<option value="팰리세이드">[현대]팰리세이드</option>
								
									<option value="K5 DL3">[기아]K5 DL3</option>
								
									<option value="K5 DL3 LPG">[기아]K5 DL3 LPG</option>
								
									<option value="K5 DL3 하이브리드">[기아]K5 DL3 하이브리드</option>
								
									<option value="K7 프리미어">[기아]K7 프리미어</option>
								
									<option value="K7 프리미어 LPG">[기아]K7 프리미어 LPG</option>
								
									<option value="K7 프리미어 하이브리드">[기아]K7 프리미어 하이브리드</option>
								
									<option value="니로 EV">[기아]니로 EV</option>
								
									<option value="더 K9">[기아]더 K9</option>
								
									<option value="더뉴 니로 플러그인 하이브리드">[기아]더뉴 니로 플러그인 하이브리드</option>
								
									<option value="더뉴 니로 하이브리드">[기아]더뉴 니로 하이브리드</option>
								
									<option value="더뉴카니발">[기아]더뉴카니발</option>
								
									<option value="레이">[기아]레이</option>
								
									<option value="모닝 어반">[기아]모닝 어반</option>
								
									<option value="모하비 더마스터">[기아]모하비 더마스터</option>
								
									<option value="셀토스">[기아]셀토스</option>
								
									<option value="스토닉">[기아]스토닉</option>
								
									<option value="스팅어">[기아]스팅어</option>
								
									<option value="스포티지 더 볼드">[기아]스포티지 더 볼드</option>
								
									<option value="쏘렌토 MQ4">[기아]쏘렌토 MQ4</option>
								
									<option value="쏘렌토 MQ4 하이브리드">[기아]쏘렌토 MQ4 하이브리드</option>
								
									<option value="쏘울 부스터">[기아]쏘울 부스터</option>
								
									<option value="올뉴 K3">[기아]올뉴 K3</option>
								
									<option value="더뉴 말리부">[한국GM(쉐보레)]더뉴 말리부</option>
								
									<option value="더뉴 스파크">[한국GM(쉐보레)]더뉴 스파크</option>
								
									<option value="이쿼녹스">[한국GM(쉐보레)]이쿼녹스</option>
								
									<option value="트래버스">[한국GM(쉐보레)]트래버스</option>
								
									<option value="트레일블레이저">[한국GM(쉐보레)]트레일블레이저</option>
								
									<option value="G4 렉스턴">[쌍용]G4 렉스턴</option>
								
									<option value="베리뉴 티볼리">[쌍용]베리뉴 티볼리</option>
								
									<option value="올 뉴 코란도">[쌍용]올 뉴 코란도</option>
								
									<option value="SM6">[삼성]SM6</option>
								
									<option value="SM6 LPG">[삼성]SM6 LPG</option>
								
									<option value="XM3">[삼성]XM3</option>
								
									<option value="더뉴 QM6">[삼성]더뉴 QM6</option>
								
									<option value="더뉴 QM6 LPG">[삼성]더뉴 QM6 LPG</option>
								
							</select>
						</div>
						<div class="filter-condition" style="float: left;">
							<span class="bold" style="padding-right: 20px;">연료</span>
							<select class="selectFuelKd" name="fuelKd" id="fuelKd-search" style="width: 140px;">
								<option value="">연료 전체</option>
								
									<option value="1">휘발유</option>
								
									<option value="Y">경유</option>
								
									<option value="2">LPG</option>
								
									<option value="3">휘발유(하이브리드)</option>
								
									<option value="4">휘발유+전기(PHEV)</option>
								
									<option value="5">전기</option>
								
									<option value="6">수소</option>
								
									<option value="0"></option>
								
								<!-- <option value="0">휘발유</option> -->
							</select>
						</div>
					</td>
					
				</tr>
			</table>
		</div>
	</form>
	<!-- 리스트 안내 -->
	<div style="float:left;width:100%;">
		<!-- <span style="float:left;">※ 보증금 20% 기준 (단, 차가 4500만원 초과 시 25%)</span>
		<span style="float:left; padding-left: 20%;">※ 연간 약정운행거리 : 1,0000km 기준</span> -->
		
		<span style="float:right;">2020년 07월 현재 </span>
		
		
		
	</div>
	<!-- 리스트 -->
	<table class="rent-list tablesorter sticky-enabled main-list" id="attachments">
		<colgroup>
			<col width="13%"/>
			<col width="13%"/>
			<col width="6%"/>
			<col width="6%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>			
		</colgroup>
		<thead>
			<tr class="rent-list-title" style="background-color: #F6F6F6; border-top: 0px;" onmouseover="this.style.cursor='default'">
				<th colspan="16" class="rent-list-title">
					<div style="float:left;width:100%;">
						<!-- <span style="float:left;">※ 보증금 20% 기준 (단, 차가 4500만원 초과 시 25%)</span> -->
						<!-- <span style="float:left;">※ 보증금 20% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;<span class="label label-success label-green" onmouseover="this.style.cursor='default'">상세보기</span>&nbsp;&nbsp;참조 )</span> -->
						<span style="float:left;">※ 보증금 20% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;상세페이지&nbsp;참조 )</span>
						
							<span style="float:right;">※ 연간 약정운행거리 : 10,000km 기준 ( 1,000km 단위로 조정 가능 )</span>
							
						
						
						
					</div>
				</th>
			</tr>
			</thead>
			</table>
			
</body>
</html>
</layoutTag:layout>