<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
 <link href="http://localhost:8082/static/css/total.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>상세정보</title>
<head>
</head>


<body id="" class="longterm-section type-reverse">
<div id="content">
	<div id="container">
		<div class="breadcrumbs">
			<h2 class="tit">솔렌트카 상세정보</h2>
			
			<div class="clearfix">
				<span>홈</span>
				<span>중고렌터카</span>
				<span class="cl-point2">솔렌터카 상세정보</span>
			</div>
			
		</div>

			<div class="header-group mab0 form-group">
				<h3 class="col-sm-5">다이렉트 견적조회</h3>
				<div class="col-sm-offset-10">
				<a href="#" class="btn btn-line4 btn-fix1 listBtn" onclick="location.href='${path}/rent/rentList'"   >목록</a>
				</div>
			</div>
			<div class="car-list v1 car-list--inquiry">
				<div class="car-list__item-jg">
					<div class="car-list__thumbnail-jg">
						<div class="car-list__thumbnail-image-jg user_car">
							<div class="howmany_jg" >
							    <span class="howmany_jg_font">현재 ${rent.standby_personnel}명의 고객님이 상담 진행 중입니다.</span>
							</div>

							<ul class="underimg col-sm-4">
								<c:forEach items="${rentImage}" var="image">
									<li><img src="${image.rent_url}" width="230" height="120"></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="car-list__caption-jg">
					<div style="padding-bottom:15px;">
						<p class="car-list__caption-title">${car.car_name}</p>
					</div>
					<div class="bg-line-tran col-sm-8">
					<hr>

						<table style="table-layout-fixed;word-break:break-all;" >
							<tr>
								<td style="width:100px;" >∙ 모델명</td>
								<td>
									${car.car_name}
								</td>
							</tr>
							<tr>
								<td>∙ 소비자가</td>
								<td>
									${String.format('%,d',rent.price)}원
								</td>
							</tr>
							<tr>
								<td>∙ 계약기간</td>
								<td>최대${rent.max_month}개월</td>
							</tr>
						</table>
                     </div>
                     <div class="month_price_div">
                            <ul class="month_price">
                                <li>표준 렌탈료</li>
                                <li><span class="month_price_number">${String.format('%,d',rent.price)}</span>원</li>				
                            </ul>
                     </div>				
					</div>
				</div>
				<!-- car-list__item//end -->
			</div>
			<!-- car-list//end -->
			
			<!-- 190103 아코디언 메뉴 추가  -->
			<div class="estimate-search-list__information">
				<div class="tab-menu v8 js-tab-opener2">
					<ul class="tab-menu__listbox">
						<li class="tab-menu__list col-6">
							<a href="#tab-prefer-information1" class="tab-menu__anchor" onclick="btnSlide('preference');">차량선호도</a>
						</li>
					<c:if test="${sessionScope.id != null}">
						<li class="tab-menu__list col-6">
							<a href="#tab-customer-information1" class="tab-menu__anchor" onclick="btnSlide('product')">상품 문의</a>
						</li>
					</c:if>	
					<c:if test="${sessionScope.id == null}">
						<li class="tab-menu__list col-6">
							<a href="#tab-customer-information1" class="tab-menu__anchor" onclick="alert('로그인 후 문의가능')">상품 문의</a>
						</li>
					</c:if>	
					</ul>
				</div>
				
				<div id="preference" class="tab-content" style="display: none;" >
					<div class="estimate-car-prefer clearfix">
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--sales fl">
							<div class="estimate-car-prefer__title">전체 차량 판매순위</div>
							<div class="estimate-car-prefer__data">
								<p class="estimate-car-prefer__data-desc">
									<strong class="estimate-car-prefer__data-num">52</strong>위
								</p>
							</div>
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div
							class="estimate-car-prefer__item estimate-car-prefer__item--competition fl">
							<div class="estimate-car-prefer__title">동급 차량 판매순위</div>
							<div class="estimate-car-prefer__data">
								<p class="estimate-car-prefer__data-desc">
								
									<strong class="estimate-car-prefer__data-num">3</strong>위
								
								
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
											<div class="gender-prefer__graph-num" style="height:50%;">남성</div>
											<span class="gender-prefer__graph-avatar" aria-hidden="true"></span>
										</div>
										<p class="estimate-car-prefer__data-desc">
											<strong class="estimate-car-prefer__data-num">50</strong>%
										</p>
									</div>
									<div class="gender-prefer__list gender-prefer__list--women">
										<div class="gender-prefer__graph">
											<div class="gender-prefer__graph-num" style="height:50%;">여성</div>
											<span class="gender-prefer__graph-avatar" aria-hidden="true"></span>
										</div>
										<p class="estimate-car-prefer__data-desc">
											<strong class="estimate-car-prefer__data-num">50</strong>%
										</p>
									</div>
								</div>
								<!-- gender-prefer//end -->
							</div>
							<!-- estimate-car-prefer__data//end -->
						</div>
						<!-- estimate-car-prefer__item//end -->
						<div class="estimate-car-prefer__item estimate-car-prefer__item--age fl">
							<div class="estimate-car-prefer__title mab0">연령대별 선호도</div>
							<div class="estimate-car-prefer__data">
								<div class="age-prefer clearfix">
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value" style="height:0%;">
												<div class="age-prefer__graph-num" >0%</div>
												<span class="age-prefer__graph-stick v1" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">20대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value" style="height:0%;">
												<div class="age-prefer__graph-num" >0%</div>
												<span class="age-prefer__graph-stick v2" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">30대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value" style="height:67%;">
												<div class="age-prefer__graph-num" >67%</div>
												<span class="age-prefer__graph-stick v3" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">40대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value" style="height:17%;">
												<div class="age-prefer__graph-num" >17%</div>
												<span class="age-prefer__graph-stick v4" aria-hidden="true"></span>
											</div>
										</div>
										<p class="age-prefer__range">50대</p>
									</div>
									<!-- age-prefer__list//end -->
									<div class="age-prefer__list fl">
										<div class="age-prefer__graph">
											<div class="age-prefer__graph-value" style="height:17%;">
												<div class="age-prefer__graph-num" >17%</div>
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
					</div>		
					<!-- estimate-car-prefer-info//end -->
				</div>
		<form class="bs-example form-horizontal" action="${path}/qna/insertProc" method="post">		
		<div class="pd25">
			<input type="hidden" name="rent_id" value="${rent.rent_id }">
			<input type="hidden" name="subject" value="${car.car_name}">
			<input type="hidden" name="writer" value="${sessionScope.id}">
			<div class="review_bigbox" id="product"  style="display: none;">
				<ul class="review_step1_ul">
					<li id="lockSt" class="lock_off"></li>
					<li><textarea id="regTextArea" name="content" placeholder="상품에 대한 문의는 100자이내로 작성해 주세요."></textarea></li>
					<li><button type="submit" >등록</button> &nbsp; 비밀글<label><input type="checkbox" id="check_yn"></label></li>
					<li><div class="form-group pwd" id="pwd"><div id="pwevt"></div></div></li>
				</ul>	
			</div>
		</div>
		<script>
		var str ='';
			str += '<div id="pwevt">';
		    str += '<label class="col-lg-2 control-label">비밀번호</label>';
		    str += '<div class="col-lg-10">';
		    str += '<input type="password" class="form-control" id="qne_password" name="qne_password" placeholder="비밀번호를 입력하세요">';
		    str += '</div>';
		    str += '</div>';
		
			$(document).ready(function(){
			    $("#check_yn").change(function(){
			        if($("#check_yn").is(":checked")){
			            $(".pwd").html(str);       
			        }else{
			            $('#pwevt').remove();
			        }
			    });
			});
		</script>
		</form>
	
		<br><br>

			<article>
				<div class="header-group estimate-type mab0">
					<h4>차량 정보</h4>
				</div>
				<table class="tb-cnt tb-my bt0">
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
					    <td colspan="3">${car.car_name} </td>				
					  </tr>
					  	
					  <tr>
					  	<th>제조사차량옵션</th>
						<td colspan="3">
								-
						</td>
					  </tr>
					  
					  <tr>
					  	<th>제조사차량옵션2</th>
						<td colspan="3">
								-
						</td>
					  </tr>
					  
					  <tr>
					    <th>주행거리</th>
					    <td>${String.format('%,d',rent.milage)} km</td>					
					    <th>연료</th>
					    <td>${car.fuel}</td>							
					  </tr>	
					  <tr>
					    <th>배기량</th><td>${car.exhaust_volume}cc</td>											
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

			<article>
				<div class="header-group estimate-type mab0">
					<h4>옵션 정보</h4>
				</div>
				<div>
					<img src="http://localhost:8082/static/img/icon_가죽시트_${count[0]}.png">
					<img src="http://localhost:8082/static/img/icon_네비게이션_${count[1]}.png">
					<img src="http://localhost:8082/static/img/icon_룸미러_${count[2]}.png">
					<img src="http://localhost:8082/static/img/icon_스마트키_${count[3]}.png">
					<img src="http://localhost:8082/static/img/icon_썬루프_${count[4]}.png">
					<img src="http://localhost:8082/static/img/icon_통풍시트_${count[5]}.png">
					<img src="http://localhost:8082/static/img/icon_후방카메라_${count[6]}.png">
				</div>
				
			</article>			

		
		
		<form id="frm" name="frm" action="" method="post">
        	
        	
			<div class="form-gorup-list js-accordion-group">

				<article>
					<!-- 20180223 : s -->
					<div class="header-group estimate-type clearfix mab0">
						<h4 class="fl">렌트 조건 선택${count[1]}</h4>
						<!-- btn-box//end -->
					</div>
					<!-- header-gruop//end -->
					<fieldset>
						<legend class="sr-only">렌트 조건 선택 폼</legend>
						<div class="form-group form-group--estimate">

							<input type="text" id="sDate" readonly="readonly" placeholder="계약시작일" name="sDate" value="" style="display:none;" >
							
<script>
    function btnSlide(id){
            if		($('#'+id).is(":visible")) $('#'+id).slideUp();
            else  	$('#'+id).slideDown();
    }    
</script>

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
												<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn cntrTermMm" data-value="btn" onclick='btnSlide("cntrTermMm");'>변경</a>
											</div>
											<!-- estimate-list__action//end -->
										</div>
										
										<div class="estimate-information clearfix" id="cntrTermMm" style="display: none;">
											<div class="estimate-information__detail">
												<p class="estimate-information__detail-desc" id="cntrTermMm_detail">차량 운행할수 있는 총 대여기간</p>
											</div>
														
										<div class="col-lg-2">
											<select id="month" name="cntrTermMm" class="form-control" onchange="monthShow(this.value);">
												<c:set value="${rent.max_month}" var="month"/>
													<c:forEach var="i" begin="1" end="${rent.max_month}">
														<option value="${i}">${i}</option>
													</c:forEach>
											</select>
										</div>											
									</div>
								</div>

							

							<div class="form-group__list" id="sub5" >
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
												<p class="estimate-list__label-title">약정 주행거리</p>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item">
											<div class="estimate-item__caption clearfix">
												<p class="estimate-item__caption-text"  id="driving">2만Km 이하/년</p>
											</div>
											<!-- estimate-item__caption//end -->
										</div>
										<!-- estimate-list__item//end -->
										<div class="estimate-list__action">
											<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn milage" data-value="btn" onclick="btnSlide('milage');">변경</a>
										</div>
									</div>
										
										
										<div class="estimate-information clearfix" id="milage" style="display: none;">
											<div class="estimate-information__detail">
												<p class="estimate-information__detail-desc" id="cntrTermMm_detail">계약기간 총 주행거리 초과 시 위약금발생</p>
											</div>
													
<script>
var cost = ${rent.price};
var price=0;
function monthShow(e) {
	$('#monthShow').html(e+"개월");
	
	if(e==1) $('#totalRental').html(cost);
	else{
		var sale = e*5000;
		price=cost-sale;
		$('#totalRental').html(price);
	}
}
function driving(e) {
	$('#driving').html(e+"만km 이하/년");
	var drPrice = e*22000;
	//document.getElementById('totalRental').text();
	if(e == 1) drPrice =0;
	if(price == 0) {
		var drive = cost + drPrice;
		$('#totalRental').html(drive);
	}else if(price != 0) {
		var a =price + drPrice;
		$('#totalRental').html(a);
	}
	
}


</script>
														
											<div class="col-lg-3">
											<select name="cntrTermMm" class="form-control" onchange="driving(this.value);" >
												<option value="1">1만km 이하</option>
												<option value="2">2만km 이하</option>
												<option value="3">3만km 이하</option>
											</select>
										</div>											
									</div>
									
							<div class="form-group__list" id="sub5" >
								<div class="form-group__header">
									<div class="estimate-list" style="margin-left: 0px;">
										<div class="estimate-list__label">
												<p class="estimate-list__label-title">보증금</p>
										</div>
										<div class="estimate-item__caption clearfix">
											<!-- estimate-item__caption//end -->
											<div class="col-sm-10">
												<p class="estimate-item__caption-text" id="prmsDtcClsCd_view">보증금<span id="span_deposit" class="cl-point2 ml10">&nbsp;${String.format('%,d',rent.price)}원&nbsp;</span>(렌탈료 1개월분)<span id="span_deposit_after" ></span></p>
											</div>
											<div class="col-sm-12">
												<p class="estimate-item__caption-subtext">※ 보증금 납부 후 차량이 출고되며, 입금(가상)계좌는 계약완료 후 문자 발송됩니다.</p>
											</div>
										</div>
									</div>
									</div>
									</div>
								
								</div>
							</div>

						</div>
						</div>
					</fieldset>
				</article>
				<article>
					<div class="ticker-info ticker-info--direct">
					
						<!-- ticker-body//end -->
						<div class="ticker-head">
							<dl class="dl-horizontal">
								<dt>월 렌탈료</dt>
								<dd class="text-r">
								<div class="col-sm-4" id="rent_price">
								<strong id="totalRental">${rent.price}</strong>원
								</div>
								<div class="col-sm-offset-1 col-sm-3" style="margin-left: 30px;">
									<button onclick="apply()">상담신청</button>
								</div>
								<div class="col-sm-4">
									<button >다이렉트 계약</button>
								</div>
								</dd>
								<dt class="fs-default">(총 차량 소비자가)</dt>
								<dd class="fs-default text-r">
								<div class="col-sm-4" >
								(<strong class="fs-default" id="totAmt">${String.format('%,d',car.car_price)}</strong>만원)
								</div>
								</dd>
							</dl>
							<div>
							</div>
				
						</div>
					</div>
					<!-- ticker-info//end -->
				</article>

</div></form></div></div></div>
</body>
</html>
</body>
<script>
function apply() {
	
}
</script>
</html>
</layoutTag:layout>