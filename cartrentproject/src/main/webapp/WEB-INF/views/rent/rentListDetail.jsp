<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
	<!DOCTYPE html>
	<html>
<head>
<link href="http://localhost:8082/static/css/total.css" rel="stylesheet"
	type="text/css" />
<meta charset="UTF-8">
<title>상세정보</title>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

#slide {
	height: 300px;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 100%;
}

#slide li:nth-child(1) {
	background: #faa;
}

#slide li:nth-child(2) {
	background: #ffa;
}

#slide li:nth-child(3) {
	background: #faF;
}

#slide li:nth-child(4) {
	background: #aaf;
}

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	border: 2px solid #666;
	background: #fff;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul{
	margin-left: 0%;
}

#pos2:checked ~ul{
	margin-left: -100%;
}

#pos3:checked ~ul{
	margin-left: -200%;
}

#pos4:checked ~ul{
	margin-left: -300%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background: #666;
}

#pos2:checked ~.pos>label:nth-child(2) {
	background: #666;
}

#pos3:checked ~.pos>label:nth-child(3) {
	background: #666;
}

#pos4:checked ~.pos>label:nth-child(4) {
	background: #666;
}

.pd {
	padding-bottom: 7px !important;
}

.car-list__caption-title-jg {
	font-size: 22px !important;
	width: 464px;
	line-height: 32px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: #333;
}

.car-list__caption-jg {
	padding-bottom: 20px;
}

.pd {
	padding-top: 20px
}

.pb {
	padding-bottom: 20px;
}

.rentalPrice {
	padding: 5px 5px;
	margin-top: 30px;
	margin-right: 0px;
	border: 1px solid #333;
	color: #333;
	width: 100px;
	text-align: center;
	height: 50px;
}

.pos {
	height: 30px;
	background-color: rgba(0, 0, 0, 0.5);
	text-align: center;
	position: absolute;
	bottom: 0;
	color: white;
}

.font {
	position: relative;
	font-size: 13px;
	color: #fff;
	margin-left: 5px;
	line-height: 31px;
}

.table>thead>tr>th, .table>thead>tr>td, .table>tbody>tr>th, .table>tbody>tr>td,
	.table>tfoot>tr>th, .table>tfoot>tr>td {
	vertical-align: middle;
}
.img img {
	margin-right: 30px;
	margin-top: 15px;
	margin-bottom: 15px;
}

.table th {
	text-align: center !important;
	height: 44px !important;
	width: 200px;
	padding: 0px;
	margin: 0px;
}

.table td {
	width: 200px;
	height: 44px;
	padding: 0px;
	margin: 0px;
}
.age-prefer__graph-num {
	top: -20px;
}

.checkgl {
	style ="content: '';
	display: inline-block;
	position: absolute;
	left: -15px;
	top: 1px;
	width: 15px;
	height: 15px;
	background-image:
		url(http://localhost:8082/static/img/pc_check_white.png);
	background-size: 11px;
	background-repeat: no-repeat;
	"
}

.next-img-btn {
	right: -40px !important;
	height: 21px !important;
	background-image: url(http://localhost:8082/static/img/spr-common.png);
	background-repeat: no-repeat;
	background-position: -1333px -590px;
	-webkit-background-size: 1347px 1290px;
	background-size: 1347px 1290px;
	text-indent: 1000%;
	white-space: nowrap;
	overflow: hidden;
}

.imgbtn-box>div {
	position: absolute !important;
	width: 20px !important;
	cursor: pointer !important;
}

-->
.gly {
	position: absolute;
	width: 41px;
	right: -40px !important;
	background-image: url(http://localhost:8082/static/img/spr-common.png);
	background-repeat: no-repeat;
	background-position: -1333px -590px;
	-webkit-background-size: 1347px 1290px;
	background-size: 1347px 1290px;
	text-indent: 1000%;
	white-space: nowrap;
	margin-top: 300;
	margin-right: 40;
}

.glya {
	position: absolute;
	width: 41px;
	left: -40px;
	background-image: url(http://localhost:8082/static/img/spr-common.png);
	background-repeat: no-repeat;
	background-position: -1334px -802px;
	-webkit-background-size: 1347px 1290px;
	background-size: 1347px 1290px;
	text-indent: 1000%;
	white-space: nowrap;
	overflow: hidden;
	text-indent: 1000%;
	white-space: nowrap;
	margin-top: 300;
	margin-left: 70;
}

.modal-pop {
	position: fixed;
	box-shadow: rgba(0, 0, 0, 0.5) 0 0 0 9999px, rgba(0, 0, 0, 0.5) 2px 2px
		3px 3px;
	z-index: 10000;
}
</style>
</head>


<body  class="longterm-section type-reverse" style="overflow-y: auto;">
	<div id="content">
		<div id="container" style="margin-top:20px;">
			<div class="breadcrumbs">
				<h2 class="tit">솔렌트카 상세정보</h2>

				<div class="clearfix">
					<span>홈</span> <span>중고렌터카</span> <span class="cl-point2">솔렌터카
						상세정보</span>
				</div>

			</div>

			<div class="header-group mab0 form-group"
				style="padding-bottom: 20px;">
				<h3 class="col-sm-5">다이렉트 견적조회</h3>
				<div class="col-sm-offset-10">
					<a href="#" class="btn btn-line4 btn-fix1 listBtn"
						onclick="location.href='${path}/rent/rentList'">목록</a>
				</div>
			</div>
			<div class="car-list v1 car-list--inquiry"
				style="height: 391px; padding: 68px 58px; border: 1px solid #ddd; border-top: none;">
				<div class="car-list__item-jg">
					<div class="car-list__thumbnail-jg">
						<div class="car-list__thumbnail-image-jg user_car">

							<ul class="underimg col-sm-4">

								<div id="slide" style="width: 350px; height: 250px">
									<a href="#"><ul>
											<li
												style="background-repeat:no-repeat;  background-size: 350px 250px; cover; background-image: url('${rentImage[0].rent_url}');">
											<li>
										</ul></a>
									<p class="pos">
										<span class="font"><span class="checkgl"></span>현재
											${rent.standby_personnel}명의 고객님이 상담 진행 중입니다.</span>
									</p>
								</div>

							</ul>

						</div>
					</div>
					<div class="car-list__caption-jg" style="margin-left: 400px;">
						<div style="padding-bottom: 30px;">
							<p class="car-list__caption-title-jg">${car.car_name}</p>
							<p class="car-list__caption-subject">변화를 넘어선 진화,
								${car.car_name} 프리미어</p>
						</div>
						<div class="bg-line-tran" style="left: 1000px;">
							<div class="car-list__caption-jg">
								<table
									style="word-break: break-all; border: 1px solid #ddd; border-right: none; border-left: none;">
									<tbody>
										<tr style="padding-top: 20px;">
											<td class="pd" style="width: 100px;">∙ 모델명</td>
											<td class="pd">${car.car_name}</td>
										</tr>
										<tr>
											<td style="padding-bottom: 7px;">∙ 소비자가</td>
											<td style="padding-bottom: 7px;">
												${String.format('%,d',rent.price)}원</td>
										</tr>
										<tr>
											<td class="pb">∙ 계약기간</td>
											<td class="pb">최대${rent.max_month}개월</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="month_price_div">
								<ul class="month_price">
									<li><span class="rentalPrice">표준 렌탈료</span>&nbsp;&nbsp;&nbsp;&nbsp;
										<font color="#eb444b"><span class="month_price_number"
											style="font-size: 24px; margin-right: 5px;">${String.format('%,d',rent.price)}</span>원</font>
									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
				<!-- car-list__item//end -->
			</div>
			<!-- car-list//end -->
			<script>
				
			</script>
			<!-- 190103 아코디언 메뉴 추가  -->
			<div class="estimate-search-list__information">
				<div class="tab-menu v8 js-tab-opener2">
					<ul class="tab-menu__listbox">
						<li class="preference tab-menu__list col-6"><a
							href="#tab-prefer-information1" class="tab-menu__anchor preference"
							onclick="btnSlide('preference');">차량선호도</a></li>
						<c:if test="${sessionScope.id != null}">
							<li class="product tab-menu__list col-6"><a
								href="#tab-customer-information1" class="tab-menu__anchor"
								onclick="btnSlide('product')">상품 문의</a></li>
						</c:if>
						<c:if test="${sessionScope.id == null}">
							<li class="product tab-menu__list col-6"><a
								href="#tab-customer-information1" class="tab-menu__anchor"
								onclick="alert('로그인 후 문의가능')">상품 문의</a></li>
						</c:if>
					</ul>
				</div>
				<div id="preference" class="tab-content" style="display: none;">
					<div class="estimate-car-prefer clearfix">
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--sales fl">
							<div class="estimate-car-prefer__title">전체 차량 판매순위</div>
							<div class="estimate-car-prefer__data">
								<p class="estimate-car-prefer__data-desc">
									<strong class="estimate-car-prefer__data-num" id="abr"></strong>위
								</p>
							</div>
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--competition fl">
							<div class="estimate-car-prefer__title">동급 차량 판매순위</div>
							<div class="estimate-car-prefer__data">
								<p class="estimate-car-prefer__data-desc">
									<strong class="estimate-car-prefer__data-num" id=dbr></strong>위
								</p>
							</div>
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--gender fl">
							<div class="estimate-car-prefer__title">성별 선호도</div>
							<div class="estimate-car-prefer__data">
								<div class="gender-prefer clearfix">
									<div class="gender-prefer__list gender-prefer__list--men">
										<div class="gender-prefer__graph">
											<div class="gender-prefer__graph-num"
												style="height:${preference.man}%;">남성</div>
											<span class="gender-prefer__graph-avatar" aria-hidden="true"></span>
										</div>
										<p class="estimate-car-prefer__data-desc">
											<strong class="estimate-car-prefer__data-num">${preference.man}</strong>%
										</p>
									</div>
									<div class="gender-prefer__list gender-prefer__list--women"
										style="margin-left: 20;">
										<div class="gender-prefer__graph">
											<div class="gender-prefer__graph-num"
												style="height:${preference.women}%;">여성</div>
											<span class="gender-prefer__graph-avatar" aria-hidden="true"></span>
										</div>
										<p class="estimate-car-prefer__data-desc">
											<strong class="estimate-car-prefer__data-num">${preference.women}</strong>%
										</p>
									</div>
								</div>
								<!-- gender-prefer//end -->
							</div>
							<!-- estimate-car-prefer__data//end -->
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--age fl">
							<div class="estimate-car-prefer__title mab0">연령대별 선호도</div>
							<div class="estimate-car-prefer__data">
								<div class="age-prefer clearfix">
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value"
												style="height:${preference.twenties}%;">
												<div class="age-prefer__graph-num">${preference.twenties}%</div>
												<span class="age-prefer__graph-stick v1" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">20대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value"
												style="height:${preference.thirties}%;">
												<div class="age-prefer__graph-num">${preference.thirties}%</div>
												<span class="age-prefer__graph-stick v2" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">30대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value"
												style="height:${preference.forties}%;">
												<div class="age-prefer__graph-num">${preference.forties}%</div>
												<span class="age-prefer__graph-stick v3" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">40대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value"
												style="height:${preference.fifteen}%;">
												<div class="age-prefer__graph-num">${preference.fifteen}%</div>
												<span class="age-prefer__graph-stick v4" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">50대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value"
												style="height:${preference.sixties}%;">
												<div class="age-prefer__graph-num">${preference.sixties}%</div>
												<span class="age-prefer__graph-stick v5" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">60대</p>
									</div>
									<!-- age-prefer__list//end -->
								</div>
								<!-- age-prefer//end -->
							</div>
							<!-- estimate-car-prefer__data//end -->
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--release fl">
							<div class="estimate-car-prefer__title">차량 예상 출고일</div>
							<div class="estimate-car-prefer__data">
								<p class="estimate-car-prefer__data-desc">
									<!--  
													<strong class="estimate-car-prefer__data-num"></strong>주
												-->
									<strong class="estimate-car-prefer__data-num">1</strong>주
								</p>
							</div>
						</div>
						<!-- estimate-car-prefer__item//end -->
					</div>
					<!-- estimate-car-prefer//end -->
					<div class="estimate-car-prefer-info">

						<p class="msg-info v1">출고일은 제조사 상황에 따라 다를 수 있습니다.</p>
						<c:if test="${preference.total eq 0}">
							<p class="msg-info v1">
								<font color="red" size="5px">해당 자동차는 표본이 적어서 분석할 수 없습니다.</font>
							</p>
						</c:if>
					</div>
					<!-- estimate-car-prefer-info//end -->
				</div>

				<form class="bs-example form-horizontal"
					action="${path}/qna/insertProc" method="post">
					<input type="hidden" name="rent_id" value="${rent.rent_id }">
					<input type="hidden" name="subject" value="${car.car_name}">
					<input type="hidden" name="writer" value="${sessionScope.id}">

					<div class="review_bigbox" id="product" style="display: none;">
					
						<div class="tab-content"><br>
							<ul class="review_step1_ul">
								<li><textarea id="regTextArea" name="content" style="height: 180px; width: 850px; margin-left: 60px;"
										placeholder="상품에 대한 문의는 100자이내로 작성해 주세요."></textarea></li>
								<li style="float: left;">
								<button type="submit" style="margin-top: 0px;  margin-left: 60px; height:29px;">등록</button>
								 &nbsp;<label for="check_yn">비밀글</label>&nbsp; <input type="checkbox" id="check_yn" style="width:25px;height:25px;background-image:url(http://localhost:8082/static/img/total.png);background-repeat:no-repeat;background-position:-1309px -914px;-webkit-background-size:1347px 1290px;background-size:1347px 1290px;text-indent:1000%;white-space:nowrap;overflow:hidden"></li>
								<li style="float: right; width: 75%;"><div
										class="form-group pwd" id="pwd"></div></li>
							</ul>
						</div>
					</div>
					<script>
						var str = '';
						str += '<div id="pwevt">';
						str += '<label class="col-lg-2 control-label">비밀번호</label>';
						str += '<div class="col-lg-10">';
						str += '<input type="password" class="form-control" id="qne_password" name="qne_password" placeholder="비밀번호를 입력하세요">';
						str += '</div>';
						str += '</div>';

						$(document).ready(function() {
							$("#check_yn").change(function() {
								if ($("#check_yn").is(":checked")) {
									$(".pwd").html(str);
								} else {
									$('#pwevt').remove();
								}
							});
						});
					</script>
				</form>
				<br>
				<br>
				<article>
					<div class="header-group estimate-type mab0">
						<h4>차량 정보</h4>
					</div>
					<table class="tb-cnt tb-my bt0 table">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<th>제조사</th>
								<td>${car.manufacturer}</td>
								<th>차량번호</th>
								<td>${rent.car_number}</td>
							</tr>
							<tr>
								<th>차종</th>
								<td>${car.manufacturer}</td>
								<th>최초 등록일</th>
								<td>${rent.reg_date}</td>
							</tr>
							<tr>
								<th>모델명</th>
								<td colspan="3">${car.car_name}</td>
							</tr>

							<tr>
								<th>제조사차량옵션</th>
								<td colspan="3">-</td>
							</tr>

							<tr>
								<th>제조사차량옵션2</th>
								<td colspan="3">-</td>
							</tr>

							<tr>
								<th>주행거리</th>
								<td>${String.format('%,d',rent.milage)}km</td>
								<th>연료</th>
								<td>${car.fuel}</td>
							</tr>
							<tr>
								<th>배기량</th>
								<td>${car.exhaust_volume}cc</td>
								<th>색상</th>
								<td>${rent.color}</td>
							</tr>
							<tr>
								<th>지역</th>
								<td colspan="3">${rent.location}</td>
							</tr>
						</tbody>
					</table>

				</article>
				
				<article style="margin-top: 50px;">
					<div class="header-group estimate-type mab0">
						<h4>옵션 정보</h4>
					</div>
					<div class="img">
						<img
							src="http://localhost:8082/static/img/icon_가죽시트_${count[0]}.png">
						<img
							src="http://localhost:8082/static/img/icon_네비게이션_${count[1]}.png">
						<img
							src="http://localhost:8082/static/img/icon_룸미러_${count[2]}.png">
						<img
							src="http://localhost:8082/static/img/icon_스마트키_${count[3]}.png">
						<img
							src="http://localhost:8082/static/img/icon_썬루프_${count[4]}.png">
						<img
							src="http://localhost:8082/static/img/icon_통풍시트_${count[5]}.png">
						<img
							src="http://localhost:8082/static/img/icon_후방카메라_${count[6]}.png">
					</div>

				</article>



				<form id="frm" name="frm"
					action="${path}/counseling/insert/${rent_id}" method="post">
					<input type="hidden" name="term" id="term" value="1">
					<!-- 계약기간 -->
					<input type="hidden" name="totalPrice" id="totalPrice">
					<!-- 총합 비용 -->
					<input type="hidden" name="deposit" id="deposit">
					<!-- 보증금 -->
					<input type="hidden" name="km" id="km" value="1">
					<!-- 주행거리 -->
					<input type="hidden" name="id" value="${sessionScope.id}">

					<div class="form-gorup-list js-accordion-group" id="abc">

						<article style="margin-top: 30px;">
							<!-- 20180223 : s -->
							<div class="header-group estimate-type clearfix mab0">
								<h4 class="fl">렌트 조건 선택</h4>
								<!-- btn-box//end -->
							</div>
							<!-- header-gruop//end -->
							<fieldset>
								<legend class="sr-only">렌트 조건 선택 폼</legend>
								<div class="form-group form-group--estimate">

									<input type="text" id="sDate" readonly="readonly"
										placeholder="계약시작일" name="sDate" value=""
										style="display: none;">


									<div class="form-group__list">
										<div class="form-group__header">
											<div class="estimate-list">
												<div class="estimate-list__label">
													<p class="estimate-list__label-title">계약기간</p>
												</div>
												<!-- estimate-list__label//end -->
												<div class="estimate-list__item">
													<div class="estimate-item__caption clearfix">
														<p class="estimate-item__caption-text fl" id="monthShow">1개월</p>
													</div>
													<!-- estimate-item__caption//end -->



												</div>
												<!-- estimate-list__item//end -->
												<div class="estimate-list__action">
													<a href="#none"
														class="btn btn- btn-line4 btn-fix0 js-accordion-btn cntrTermMm"
														data-value="btn" onclick='btnSlide("cntrTermMm");'>변경</a>
												</div>
												<!-- estimate-list__action//end -->
											</div>

											<div class="estimate-information clearfix" id="cntrTermMm"
												style="display: none;">
												<div class="estimate-information__detail">
													<p class="estimate-information__detail-desc"
														id="cntrTermMm_detail">차량 운행할수 있는 총 대여기간</p>
												</div>

												<div class="col-lg-2">
													<select id="month" name="cntrTermMm" class="form-control"
														onchange="monthShow(this.value);">
														<c:set value="${rent.max_month}" var="month" />
														<c:forEach var="i" begin="1" end="${rent.max_month}">
															<option value="${i}">${i}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>



										<div class="form-group__list" id="sub5">
											<div class="form-group__header">
												<div class="estimate-list">
													<div class="estimate-list__label">
														<p class="estimate-list__label-title">약정 주행거리</p>
													</div>
													<!-- estimate-list__label//end -->
													<div class="estimate-list__item">
														<div class="estimate-item__caption clearfix">
															<p class="estimate-item__caption-text" id="driving">1만Km
																이하/년</p>
														</div>
														<!-- estimate-item__caption//end -->
													</div>
													<!-- estimate-list__item//end -->
													<div class="estimate-list__action">
														<a href="#none"
															class="btn btn- btn-line4 btn-fix0 js-accordion-btn milage"
															data-value="btn" onclick="btnSlide('milage');">변경</a>
													</div>
												</div>


												<div class="estimate-information clearfix" id="milage"
													style="display: none;">
													<div class="estimate-information__detail">
														<p class="estimate-information__detail-desc"
															id="cntrTermMm_detail">계약기간 총 주행거리 초과 시 위약금발생</p>
													</div>
													<div class="col-lg-3">
														<select name="cntrTermMm" class="form-control"
															onchange="driving(this.value);">
															<option value="1">1만km 이하</option>
															<option value="2">2만km 이하</option>
															<option value="3">3만km 이하</option>
														</select>
													</div>
												</div>

												<div class="form-group__list" id="sub5">
													<div class="form-group__header">
														<div class="estimate-list"
															style="margin-left: 0px; padding: 0px; margin: 0px;">
															<div class="estimate-list__label">
																<p class="estimate-list__label-title">보증금</p>
															</div>
															<div class="estimate-item__caption clearfix"
																style="padding-left: 0px;">
																<!-- estimate-item__caption//end -->
																<div class="col-sm-10">
																	<p class="estimate-item__caption-text"
																		id="prmsDtcClsCd_view" style="padding-bottom: 0px;">
																		보증금<span id="span_deposit" class="cl-point2 ml10">&nbsp;${String.format('%,d',rent.price*5)}&nbsp;</span>원(렌탈료
																		1개월분 * 5)<span id="span_deposit_after"></span>
																	</p>
																</div>
																<div class="col-sm-12" style="padding-bottom: 12px;">
																	<p id="ssss" class="estimate-item__caption-subtext">※
																		보증금 납부 후 차량이 출고되며, 입금(가상)계좌는 계약완료 후 문자 발송됩니다.</p>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div id="imagepop"
													class="modal-pop modal-large big-img-show"
													style="display: none; z-index: 1000000">
													<div class="modal-box">
														<div class="modal-header" style="margin-bottom: 15px;">
															<a href="#" class="modal-close">레이어 닫기</a> <a href="#"
																class="gly" onclick="gly();">></a> <a href="#"
																class="glya" onclick="gly();">></a>
															<h3>차량 이미지</h3>
														</div>
														<article class="bigimg-box-article">
															<div id="popImageList" class="article-content bigimg-box">
																<span id="cimg"><img
																	src="${rentImage[0].rent_url}" width="640" height="480"></span>
																<span class="jg_img_font">※ 차량 이미지(주행거리)는 고객님의
																	이해를 돕기 위한 것으로 실제 차량과 다를 수 있습니다.</span>
															</div>
														</article>
													</div>
												</div>

												<script type="text/javascript">
													var a = false;
													$('.modal-close')
															.click(
																	function() {
																		$(
																				'.modal-pop')
																				.css(
																						'display',
																						'none');
																	});

													$('#slide')
															.click(
																	function() {
																		$(
																				'.modal-pop')
																				.css(
																						'display',
																						'block');
																	});

													var img = '${rentImage[0].rent_url}';
													var img1 = '${rentImage[1].rent_url}';
													function gly() {
														if (a == false) {
															$('#cimg')
																	.html(
																			'<img src="'+ img1 +'" width="640" height="480">');
															a = true;
														} else {
															$('#cimg')
																	.html(
																			'<img src="'+ img +'" width="640" height="480">');
															a = false;
														}
													}
												</script>

											</div>
										</div>

									</div>
								</div>
							</fieldset>
						</article>
<article>
<div class="ticker-info ticker-info--direct">
<div class="ticker-head">
<dl class="dl-horizontal">
<dt>월 렌탈료</dt>
<dd class="text-r">
<strong id="totalRental">${String.format('%,d',rent.price)}</strong>원
</dd>
<dt class="fs-default">(총 차량 소비자가)</dt>
<dd class="fs-default text-r">
(<strong class="fs-default" id="totAmt">${String.format('%,d',car.car_price)}</strong>만원)
</dd>
</dl>
<div class="btn-box-all">
<div class="btn-box-gray btn2">
<button onclick="apply();">
<span>맞춤형 렌탈료</span>
<br><font color="white">상담신청</font></button></div>
<div class="btn-box-red btn2">

<c:choose>
<c:when test="${sessionScope.id !=null && sessionScope.id != ''}">
<button formaction="${path}/buy/insert/${rent.rent_id}" onclick="apply();" id="btnDirectContract">
</c:when>
<c:otherwise>
<button formaction="${path}/rent/rentListDetail/${rent.rent_id}" onclick="alert('로그인 후 사용가능')" id="btnDirectContract">
</c:otherwise>
</c:choose>


<span>무방문/무서류</span>
<br><font color="white">다이렉트 계약</font></button></div></div>
</div></div></article>

</div></form></div></div></div>
<div id="sds"></div>
</body>
	</html>
	</body>
<script>
var cost = ${rent.price};
var temporaryPrice=0;
function monthShow(e) {
	$('#monthShow').html(e+"개월");
	document.getElementById('term').value = e;
	
	if(e==1) {
		$('#totalRental').html(numberWithCommas(cost));
		$('#span_deposit').html(numberWithCommas(cost*5));
		temporaryPrice = cost;
	}else{
		var sale = e*5000;
		temporaryPrice=cost-sale;
		$('#totalRental').html(numberWithCommas(temporaryPrice));
		$('#span_deposit').html(numberWithCommas(temporaryPrice*5));
	}
}
function driving(e) {
	$('#driving').html(e+"만km 이하/년");
	document.getElementById('km').value = e;
	var drPrice = e*22000;
	//document.getElementById('totalRental').text();
	if(e == 1) drPrice =0;
	if(temporaryPrice == 0) {
		var drive = cost + drPrice;
		$('#totalRental').html(numberWithCommas(drive));
		$('#span_deposit').html(numberWithCommas(drive*5));
	}else if(temporaryPrice != 0) {
		var a = temporaryPrice + drPrice;
		$('#totalRental').html(numberWithCommas(a));
		$('#span_deposit').html(numberWithCommas(a*5));
	}
	
}
</script>
	<script>
		function btnSlide(id) {
			//if		($('#'+id).is(":visible")) $('#'+id).slideUp(); 슬라이드 효과
			//else  	$('#'+id).slideDown();
			if ($('#' + id).is(":visible")) {
				$('.product').css("border", ""); $('.preference').css("border", "");
				$('#' + id).hide();
				$('.' + id).removeClass("selected");
				if (id == 'preference')
					$('.product').css("border-bottom", "");
				if (id == 'product')
					$('.preference').css("border-bottom", "");
			} else {
				$('.product').css("border", ""); $('.preference').css("border", "");
				$('#' + id).show();
				$('.' + id).addClass("selected");
				if (id == 'preference')
					$('.product').css("border-bottom", "1px solid red");
				if (id == 'product')
					$('.preference').css("border-bottom", "1px solid red");
			}

			if (id == "product") {
				//if		($('#'+id).is(":visible")) $("#preference").slideUp();
				if ($('#' + id).is(":visible"))
					$("#preference").hide();
				$(".preference").removeClass("selected");
			} else if (id == "preference") {
				//if		($('#'+id).is(":visible")) $("#product").slideUp();
				if ($('#' + id).is(":visible"))
					$("#product").hide();
				$(".product").removeClass("selected");
			}
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function apply() {
			document.getElementById('totalPrice').value = $('#totalRental')
					.text(); // 옵션등등 추가 후 비용
			document.getElementById('deposit').value = $('#span_deposit')
					.text();//보증금(렌트계약기간 * 5)
		}
	</script>
	<script>



	
		//footerSHeight값 이상일시 class를 바꾼다
		$(window).scroll(
				function() {
					var windowHeight = $(window).height(); // Viewport Height
					var documentHeight = $(document).height(); // Viewport Height
					var footerHeight = $('#footer').height();
					console.log(windowHeight-footerHeight-1055);
					if(documentHeight > 2457) 
				        var footerSHeight = 1050;
				    else if(documentHeight > 2421) var footerSHeight = 1136;
				    else if(documentHeight > 2411) var footerSHeight = 1195;
				    else if(documentHeight > 2400) var footerSHeight = 1308;
					
					var scrollValue = $(document).scrollTop();

					console.log('스크롤'+scrollValue + ' 푸터' + windowHeight + ' 도큐' + documentHeight + ' 윈도우' +  windowHeight + ' ' );
					if (scrollValue > footerSHeight)
						$('.ticker-info').addClass("off");
					else
						$('.ticker-info').removeClass("off");
				});

		var abr = Math.floor(Math.random() * 50) + 1;
		document.getElementById('abr').innerHTML = abr;

		var dbr = Math.floor(Math.random() * 10) + 1;
		document.getElementById('dbr').innerHTML = dbr;

		//모두 동의 체크박스
		function checkBox() {
			//체크박스가 전부 체크일 시 체크박스를 풀고 아닐시 선택으로 바꾼다
			if ($("input:checkbox[name=is_check]:checked").length == 5)
				$("input[name=is_check]:checkbox").attr("checked", false);
			else
				$("input[name=is_check]:checkbox").prop("checked", true);
		}

		function boxCheck() {
			//다른 5개의 체크박스가 모두 선택됬을 시 모두동의 체크박스를 체크 아닐 시 반대
			if ($("input:checkbox[name=is_check]:checked").length == 5)
				$("input[id='term-check-all']:checkbox").attr("checked", true);
			else
				$("input[id='term-check-all']:checkbox").attr("checked", false);
		}
	</script>

	</html>
</layoutTag:layout>