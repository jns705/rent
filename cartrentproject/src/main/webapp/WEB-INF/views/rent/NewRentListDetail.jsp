<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<layoutTag:layout>

<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>솔렌터카</title>
</head>

<body id="" class="longterm-section type-reverse">
<div id="content">
	<div id="container">
		<div class="breadcrumbs">
			<h2 class="tit">솔장기렌터카 다이렉트</h2>
			<input class="hidden" id="pricea" value="${rent.price}">
			<div class="clearfix">
				<span>홈</span>
				<span>장기렌터카</span>
				<span class="cl-point2">SK장기렌터카 다이렉트</span>
			</div>
			
		</div>
		
		<article>
			<div class="header-group mab0">
				<h3>다이렉트 견적조회</h3>
				<a href="#" class="btn btn-line4 btn-fix1 listBtn"  >목록</a>
			</div>
			<!-- header-gruop//end -->
			<div class="car-list v1 car-list--inquiry">
				<div class="car-list__item">
					<div class="car-list__thumbnail">
						<div class="car-list__thumbnail-image carImage" >
                            	<img src="${color[0].color_url}${color[0].color_image}" width="230" height="115">
							<!-- <img src="/resources/img/img-car-default.png" alt=""> 이미지 없을 경우 //end -->
						</div>
					</div>
					<div class="car-list__caption">
						<p class="car-list__caption-title">${car.manufacturer}  ${car.car_name }</p>
						<p class="car-list__caption-subject ml36">완성도 높은 미드사이즈 럭셔리 세단, 제네시스 G80</p>											
					</div>
					
				</div>
			</div>


						<div class="estimate-search-list__information">
							<!-- 1번째 리스트일 경우 tab-menu__anchor > href, tab-content > id 뒤에 1셋팅 -->
							
							
			<div class="form-gorup-list js-accordion-group">
				<article>
					<div class="header-group estimate-type mab0">
						<h4>상세 차량 및 옵션 선택 <p>선구매 차량은 차종, 내/외부 색상, 옵션 선택이 불가할 수 있습니다.</p></h4>
					</div>
					<!-- header-gruop//end -->
					<fieldset>
						<legend class="sr-only">상세 차량 및 옵션 선택 폼</legend>
						<div class="form-group form-group--estimate">
							<div class="form-group__list">
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
											<p class="estimate-list__label-title">상세 차량</p>
											<div class="estimate-list__label-tooltip tooltip-box">
												<p class="tooltip-btn">자세히보기</p>
												<div class="tooltip-desc">차량의 상세 모델/트림입니다.</div>
											</div>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item">
											<div class="estimate-item__caption clearfix">
												<table class="estimate-item__caption-text icon">
													<tr>
														<td>
															<span class="radio v6 clearfix icon">
																<label for="car-detail-total0">
					                                                	<span class="radio__column radio__column--tag">
			                                                				<span class="fl tag">Hot Deal</span>
			                                                			</span>
			                                                	</label>
			                                                </span>
														</td>
														<td align = "left">
															<span class="car_name"> ${car.car_name}</span> 
														</td>
													</tr>												
												</table>
												<p class="estimate-item__caption-price"> ${String.format('%,d',car.car_price*10000)}원</p>
											</div>
										</div>
										<!-- estimate-list__item//end -->
										<div class="estimate-list__action">
											<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn" onclick="showMenu('f1');" data-value="btn">변경</a>
										</div>
										<!-- estimate-list__action//end -->
									</div>
									<!-- estimate-item//end -->
								</div>
								<!-- form-group__header//end -->
<script type="text/javascript">
//숫자 세자리 , 찍는 정규식
function nf(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function showMenu(data){
		if($('#'+data).is(":hidden")){
			$('.form-group__body').slideUp();
			$('#'+data).slideDown();
		}
		else
			$('.form-group__body').slideUp();
}
function showColor(data){
			$('.tab-content').css('display','none');
			$('.tab-menu__list').removeClass('selected');
			$('.a'+data).addClass('selected');
			$('.c'+data).css('display','block');
}
</script>
<script type="text/javascript">
function carSelect(data){
	var rent_id = "${rent.rent_id}";
	$.ajax({
		url : '/rent/rentColorProc',
		data : {"index": data, "rent_id" : rent_id},
		type : 'get',
		success : function(data){
			$('.carImage').html('<img src="'+ data.color_url + data.color_image + '" width="230" height="115">');
			$('#pricea').val(data.color);
			price(data.color);
		}
	});
	
}
price();
function price(data){
	var price = $('#pricea').val();
	var temp = 0.7;
	if($('input[name="prmsDtcClsCd"]:checked').val() == 2) temp = 1;
	$('#totalRental').html(nf(  Math.ceil(Number(price) * Number(temp)/100)*100 ));
	$('#totAmt').html(nf(price*($('input[name="cntrTermMm"]:checked').val())));
}
</script>
								<div class="form-group__body" id="f1" >
									<div class="estimate-information clearfix">
										<div class="estimate-information__detail">
																						
												<div class="estimate-information__detail-carousel slider-article-v2">
													<div class="slider v3 carImage">
							                            <img src="${color[0].color_url}${color[0].color_image}" width="230" height="115">
													</div>
												</div>
											
											<div class="estimate-information__detail-listbox">
												<ul>
													<li class="estimate-information__detail-list">연료 : ${car.fuel }</li>
													<li class="estimate-information__detail-list">차량 종류 : ${car.car_kind}</li>
													<li class="estimate-information__detail-list">배기량 : ${String.format('%,d',car.exhaust_volume)}cc</li>
													<li class="estimate-information__detail-list">변속기 : ${car.transmission}</li>
												</ul>
											</div>
											<p class="estimate-information__detail-noti">본 차량의 정보는 실제와 다를 수 있습니다.</p><!-- 20180305 -->
										</div>
										<!-- estimate-information__detail//end -->
										<div class="estimate-information__select">
											<div class="tab-menu v10">
												<ul class="tab-menu__listbox">
													<c:forEach items="${color}" var="color" varStatus="status">
													<li class="tab-menu__list col-6 a${status.index} <c:if test="${status.index eq 0}">selected</c:if> ">
														<a href="###" class="tab-menu__anchor" onclick="showColor('${status.index}');">${color.color}</a>
													</li>
													</c:forEach>
												</ul>
											</div>
										<c:forEach items="${color}" var="color" varStatus="status">
											<div onclick="carSelect('${status.index}'); price();" id="tab-total-estimate-information" class="tab-content c${status.index}"  <c:if test="${status.index != 0}">hidden</c:if> >
												<div class="estimate-information__listbox scroll" ><!-- scroll 없으면 삭제 -->
													<ul>
															<li class="estimate-information__list" >
																<span class="radio v6 clearfix">
					                                                <input  <c:if test="${status.index eq 0}">checked</c:if>  type="radio" id="car-detail-total${status.index}" name="select-car-detail-total" >
					                                                <label for="car-detail-total${status.index}">
						                                                 <span class="radio__column radio__column--ico">
							                                                <span class="ico"></span>
						                                                </span>
						                                                	<span class="radio__column radio__column--tag">
						                                                		<span class="fl tag">Hot Deal</span>
						                                                	</span>
						                                                
						                                                <span class="radio__column radio__column--title">
						                                                 	${car.car_name }
						                                                 </span>
						                                                 <span class="radio__column radio__column--price">
						                                                 	${String.format('%,d',car.car_price*10000)}원
						                                                 </span>
					                                                </label>
					                                            </span>
															</li>		
																						
													</ul>
												</div>
												<!-- estimate-information__listbox//end -->
											</div>
										</c:forEach>
										
									</div>
								</div>
							</div>
							<div class="form-group__list">
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
											<p class="estimate-list__label-title">외부 색상</p>
											<div class="estimate-list__label-tooltip tooltip-box">
												<p class="tooltip-btn">자세히보기</p>
												<div class="tooltip-desc">차량 외부(보닛, 도어, 트렁크 등)의 색상입니다.</div>
											</div>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item">
											<div class="estimate-item__caption clearfix">
												<p class="estimate-item__caption-text" id="selOutColorFileUrl_nm"><span class="estimate-item__caption-color carImage"><img src="${color[0].color_url}${color[0].color_image}"></span>${color[0].color}</p>
												<p class="estimate-item__caption-price" id="selOutColorAmt"></p>
											</div>
										</div>
										<!-- estimate-list__item//end -->
										
										
										<div class="estimate-list__action" style="width:140px"></div>
										
									</div>
									<!-- estimate-item//end -->
								</div>
								<!-- form-group__header//end -->
								<div class="form-group__body">
									<div class="estimate-information clearfix">
										<div class="estimate-information__detail">
											<div class="estimate-information__detail-image" id="selDetailOutColorFileUrl">
												
											</div>
											<p class="estimate-information__detail-desc" id="selDetailOutColorDesc"></p>
											<p class="estimate-information__detail-noti">화면에 보이는 색상은 실제와 다를 수 있습니다.</p><!-- 20180305 -->
										</div>
										<!-- estimate-information__detail//end -->
									</div>
									<!-- estimate-information//end -->
								</div>
								<!-- form-group__body//end -->
							</div>
							<div class="form-group__list">
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
											<p class="estimate-list__label-title">차량 옵션</p>
											<div class="estimate-list__label-tooltip tooltip-box">
												<p class="tooltip-btn">자세히보기</p>
												<div class="tooltip-desc">차량에 추가할 수 있는 편의/안전사양 등 입니다.<br>(제조사 제공)</div>
											</div>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item" id="selMakerOptDiv">
											파퓰러 패키지,빌트인 캠 패키지
										</div>
										
										<div class="estimate-list__action">
											<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn" onclick="showMenu('f2');"  data-value="btn">변경</a>
										</div>
										
										
									</div>
								</div>
								<div class="form-group__body" id="f2">
									<div class="estimate-information clearfix">
										<div class="estimate-information__detail">
											<div class="estimate-information__detail-image" id="selDetailmakerOptFileUrl">
												
											</div>
											<p class="estimate-information__detail-desc" id="selDetailmakerOptDesc"></p>
										</div>
										<!-- estimate-information__detail//end -->
										<div class="estimate-information__select">
											<div class="estimate-information__listbox scroll"><!-- scroll 없으면 삭제 -->
												<ul id="makerOpt_ul">
														<li class="estimate-information__list">
																	<span class="radio v6 clearfix" onclick="btnClick('carOptId0');">
																		<input type="radio" checked id="carOptId0" name="carOptId0" value="" />
						                                                <label for="carOptId0">
							                                                <span class="radio__column radio__column--ico">
								                                                <span class="ico"></span>
							                                                </span>
							                                                <span class="radio__column radio__column--title" >파퓰러 패키지,빌트인 캠 패키지</span>
							                                                <span class="radio__column radio__column--price">5,800,000원</span>
						                                                </label>
				                                                	</span>
<script type="text/javascript">
 	function btnClick(data){
 	 	if($("#"+data).is(":checked"))
 	 		$("#"+data).prop('checked',false);
 	 	 	alert("sss");
 	 	else{
 	 	 	alert("gg");
 	 	}
	 	 	
	}
</script>
																
														</li>
												</ul>
												<input type="hidden" id="carGoodsClfCd" value=""/>
											</div>
											<!-- estimate-information__listbox//end -->
										</div>
										
										<!-- estimate-information__select//end -->
									</div>
									<!-- estimate-information//end -->
								</div>
								<!-- form-group__body//end -->
							</div>
							<!-- form-group__list//end -->
	
	
						</div>
					</fieldset>
				</article>
				<article>
					<!-- 20180223 : s -->
					<div class="header-group estimate-type clearfix mab0">
						<h4 class="fl">렌트 조건 선택</h4>
					</div>
					<fieldset>
						<legend class="sr-only">렌트 조건 선택 폼</legend>
						<div class="form-group form-group--estimate">
							<div class="form-group__list">
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
											<p class="estimate-list__label-title">계약기간</p>
											<div class="estimate-list__label-tooltip tooltip-box">
												<p class="tooltip-btn">자세히보기</p>
												<div class="tooltip-desc">차량 대여 기간입니다.</div>
											</div>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item">
											<div class="estimate-item__caption clearfix">
												<p class="estimate-item__caption-text fl" id="cntrTermMm_view">48 개월</p>
											</div>
											<!-- estimate-item__caption//end -->
										</div>
										<!-- estimate-list__item//end -->
										<div class="estimate-list__action">
											<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn" onclick="showMenu('f3');"  data-value="btn">변경</a>
										</div>
										<!-- estimate-list__action//end -->
									</div>
									<!-- estimate-item//end -->
								</div>
								<!-- form-group__header//end -->
								<div class="form-group__body" id="f3">
								
				<style>
<!--
.radio.v7 input[type=radio]:checked+label {
    display: block !important;
    position: absolute !important;
    top: -1px !important;
    right: -1px !important;
    bottom: -1px !important;
    left: -1px !important;
    z-index: 10 !important;
    width: auto !important;
    height: auto !important;
    border: 2px solid #eb444b!important;
    margin: 0 !important;
    background: 0 0  !important;
}


.radio.v7 label {
    height: 50px !important;
    box-sizing: border-box !important;
    display: block !important;
    color: #999 !important;
    text-align: center !important;
    padding: 0 !important;
    margin-top: -1px !important;
    margin-left: -1px !important;
    border: 1px solid #ddd! important;
    background: #fff !important;
    line-height: 52px !important;
    transition: none !important;
}
-->
</style>					
									
									<div class="estimate-information clearfix">
										<div class="estimate-information__detail">
											<p class="estimate-information__detail-desc" id="cntrTermMm_detail">차량 렌탈 계약 기간이 48 개월<br>계약기간이 늘어나면 월 렌탈료가<br>줄어듭니다.</p>
										</div>
										<!-- estimate-information__detail//end -->
										<div class="estimate-information__select">
											<div class="list-option">
												<!-- header-group//end -->
												<div class="content-body bra0">
													<div class="radio-box row-2 clearfix">
														<div class="col-2 fl">
				                                            <span class="radio v7">
				                                                <input type="radio" id="cntrTermMm2" name="cntrTermMm" value="36" onchange="price();">
	                                               				<label for="cntrTermMm2">36 개월</label>
				                                            </span>
														</div>
														<!-- col//end -->
														<div class="col-2 fl">
				                                            <span class="radio v7">
				                                                <input  checked type="radio" id="cntrTermMm3" name="cntrTermMm" value="48" onchange="price();">
	                                               				<label for="cntrTermMm3">48 개월</label>
				                                            </span>
														</div>
													</div>
												</div>
												<!-- content-body//end -->
												<!-- 20170802//end -->
											</div>
										</div>
										<!-- estimate-information__select//end -->
									</div>
									<!-- estimate-information//end -->
								</div>
								<!-- form-group__body//end -->
							</div>
							<!-- form-group__list//end -->
							<div class="form-group__list">
								<div class="form-group__header">
									<div class="estimate-list">
										<div class="estimate-list__label">
											<p class="estimate-list__label-title">약정 주행거리</p>
											<div class="estimate-list__label-tooltip tooltip-box">
												<p class="tooltip-btn">자세히보기</p>
												<div class="tooltip-desc">계약기간 총 주행거리 초과 시 위약금발생<br>(총 주행거리 = 계약기간 x 약정 주행거리)<br>* 위약금은 하단 안내 참조</div>
											</div>
										</div>
										<!-- estimate-list__label//end -->
										<div class="estimate-list__item">
											<div class="estimate-item__caption clearfix">
												<p class="estimate-item__caption-text" id="prmsDtcClsCd_view">2만Km 이하/년</p>
											</div>
											<!-- estimate-item__caption//end -->
										</div>
										<!-- estimate-list__item//end -->
										<div class="estimate-list__action">
											<a href="#none" class="btn btn- btn-line4 btn-fix0 js-accordion-btn"  onclick="showMenu('f4');" data-value="btn">변경</a>
										</div>
										<!-- estimate-list__action//end -->
									</div>
									<!-- estimate-item//end -->
								</div>
								<!-- form-group__header//end -->
								<div class="form-group__body" id="f4">
									<div class="estimate-information clearfix">
										<div class="estimate-information__detail">
											<p class="estimate-information__detail-desc">계약기간 총 주행거리 초과 시 위약금발생<span class="estimate-information_subtext">(총 주행거리 = 계약기간 x 약정 주행거리)<br>* 위약금은 하단 안내 참조</span></p>
											<div class="estimate-information__detail-listbox">
												<ul>
													<li class="estimate-information__detail-list"></li>
												</ul>
											</div>
										</div>
										<!-- estimate-information__detail//end -->
										<div class="estimate-information__select">
											<div class="list-option">
												<div class="content-body bra0">
													<div class="radio-box row-2 clearfix">
														<div class="col-2 fl">
				                                            <span class="radio v7">
				                                            	<input type="radio" id="prmsDtcClsCd1" name="prmsDtcClsCd" checked value="2"  onchange="price();">
	                                               				<label for="prmsDtcClsCd1">2만Km 이하</label>
				                                            </span>
														</div>
														<!-- col//end -->
														<div class="col-2 fl">
				                                            <span class="radio v7">
				                                                <input type="radio" id="prmsDtcClsCd2" name="prmsDtcClsCd" value="3"  onchange="price();">
				                                                <label for="prmsDtcClsCd2">3만Km 이하</label>
				                                            </span>
														</div>
														<!-- col//end -->
													</div>
													<!-- radio-box//end -->
												</div>
												<!-- content-body//end -->
												<!-- 20170802//end -->
											</div>
										</div>
										<!-- estimate-information__select//end -->
									</div>
									<!-- estimate-information//end -->
								</div>
								<!-- form-group__body//end -->
							</div>
							<!-- form-group__list//end -->
						</div>
						<!-- form-group//end -->
					</fieldset>
				</article>
				<article>
					<div class="ticker-info ticker-info--direct">
						
						<!-- ticker-body//end -->
						<div class="ticker-head">
							<dl class="dl-horizontal">
								<dt>월 렌탈료</dt>
								<dd class="text-r"><strong id="totalRental">${String.format('%,d',rent.price)}</strong>원</dd>
								<dt class="fs-default">(총 차량 소비자가)</dt>
								<dd class="fs-default text-r">(<strong class="fs-default" id="totAmt">${String.format('%,d',rent.price*48)}</strong>원)</dd>
							</dl>
 							<div class="btn-box-all">
								<div class="btn-box-gray btn2">
									<a href="#none" onclick="openChatLayerPop()"><span>맞춤형 렌탈료</span><br>상담신청</a>
								</div>
										
								<div class="btn-box-red btn2">
									<a href="#none" onclick="direct();" id="btnDirectContract" ><span>무방문/무서류</span><br>다이렉트 계약</a>
								</div>
							</div>
							<script type="text/javascript">
								function direct(){
									if($('#article').is(":hidden"))
									$('#article').css("display","block");
									else
									$('#article').css("display","none");
								}
							</script>
							<!-- 180801 다이렉트 버튼 수정 끝 -->
							
						</div><!-- ticker-head//end -->
												
						
						<!-- ticker-head//end -->
									
						
					</div>
					<!-- ticker-info//end -->
				</article>
				<article>
					<div class="header-group estimate-type mab0">
						<h4>SK렌터카 서비스</h4>
					</div>
					
					<div class="estimate-notice bg-line1">
						<ul class="list-info v1">
							<!-- 191118 테슬라문구 추가 -->
							
							<li><span class="cl-point2">계약 종료 후 차량의 소유/반납 여부를 선택하실 수 있습니다</span></li>
							<li>월 렌탈료는 신용심사 결과, 담보조건, 담보율에 따라 변경될 수 있습니다.</li>
							<li>차량 이미지는 고객님의 이해를 돕기 위한 이미지로 실제 차량과 다를 수 있습니다.</li>
							<li>현재 재고 기준의 견적으로 바로 구매하시지 않는 경우 재고 소진으로 구매가 불가할 수 있습니다.</li>
							<li>견적을 저장하시면 <span class="cl-point2">MY렌터카 &gt; 장기CAR &gt; 견적정보</span>에서 견적비교를 하실 수 있습니다.</li>
							<li>차량 옵션은 제조사의 사정에 따라 변경될 수 있으며, 변경시 별도 연락을 드리겠습니다.</li>
							<!-- 180711 다이렉트 문구 추가 -->
							<li>SK렌터카 서비스 중 '용품' 혜택은 다이렉트 전용 제공 상품입니다.</li>		
							<li>약정 주행거리 초과 위약금: 1600CC미만(60원/km) , 2000CC미만(80원/km) , 2000CC이상(100원/km) , 수입차(200원/km) , 테슬라(450원/km)</li>					
						</ul>
					</div>
				</article>
				<article id="article" hidden><!-- 이용약관 -->
                    <div class="header-group">
                        <h3>이용약관</h3>
                    </div>
                    <!-- header-group//end -->
                    <div class="article-content">
                        <div class="terms-listbox">
							<p class="terms-listbox__text">SK렌터카㈜는 적법하고 공정한 방법으로 개인정보를 수집하며, 고객의 개인정보를 최우선으로 생각하여 안전하게 보유·관리하고 있습니다.</p>
							<div class="header-group brb0 mab0">
								<h4>개인정보 제공 활용 동의</h4>
							</div>
							<!-- header-group//end -->
							<div class="terms-list v3">
								<div class="terms-header">
									<h4>전체동의</h4>
									<span class="checkbox v2">
                                        <input type="checkbox" id="term-check-all" onclick="checkBox(); event.cancelBubble=true"/>
                                        <label class="label" for="term-check-all">모두 동의</label>
                                    </span>
								</div>
							</div>
							
							<!-- terms-list//end -->
							<div class="terms-list v3 list" onclick="btnSlide('a1');">
								<div class="terms-header subject">
									<h4>고유식별정보 수집 및 이용에 관한 동의 <strong class="cl-point1">(필수)</strong></h4>
									<span class="checkbox v2">
                                        <input id="term-check-1" type="checkbox"  name="is_check" onclick="boxCheck(); event.cancelBubble=true"/>
                                        <label class="label" for="term-check-1">동의</label>
                                    </span>
								</div>
<script type="text/javascript">
//모두 동의 체크박스
function checkBox(){
	//체크박스가 전부 체크일 시 체크박스를 풀고 아닐시 선택으로 바꾼다
	if($("input:checkbox[name=is_check]:checked").length == 5)
	$("input[name=is_check]:checkbox").attr("checked", false);
	else
	$("input[name=is_check]:checkbox").prop("checked", true);
}

function boxCheck(){
//다른 5개의 체크박스가 모두 선택됬을 시 모두동의 체크박스를 체크 아닐 시 반대
	if($("input:checkbox[name=is_check]:checked").length == 5)
		$("input[id='term-check-all']:checkbox").attr("checked", true);
	else
		$("input[id='term-check-all']:checkbox").attr("checked", false);
}


//이용약관 CSS
function btnSlide(id){
	//모든 약관을 숨긴다
	for(i=1; i < 7; i++){$('#a'+i).slideUp();}
	//약관이 숨겨져있을 경우 보여준다 아닐 시 반대
    if		($('#'+id).is(":visible")) $('#'+id).slideUp();
    else  	$('#'+id).slideDown();
}    
</script>
								<div class="terms-content notice" id="a1" >
									<ul class="terms-content__listbox">
										<li class="color_bold">
											<span class="wg-bold">수집항목</span>
											<ul class="list-info v2"><!-- 20180516 -->
												<li class="wg-bold">면허종류, 면허번호, 면허 만료일</li>
											</ul>
										</li>
										<li>
											<strong class="cl-bold">이용목적</strong>
											<ul class="list-info v2"><!-- 20180516 -->
												<li>서비스 이용에 따른 본인 식별 절차 및 차량 대여 자격 확인</li>
											</ul>
										</li>
										<li class="color_bold">
											<span class="wg-bold">보유 및 이용기간</span>
											<ul class="list-info v2"><!-- 20180516 -->
												<li class="wg-bold">계약에 따른 거래관계의 종료 후 1년</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
							
							<!-- terms-list//end -->
							<div class="terms-list v3 list" onclick="btnSlide('a2');">
								<div class="terms-header subject">
									<h4>개인정보의 수집 항목 및 이용목적 <strong class="cl-point1">(필수)</strong></h4>
									<span class="checkbox v2">
                                        <input type="checkbox" id="term-check-2" name="is_check"  onclick="boxCheck(); event.cancelBubble=true"/>
                                        <label class="label" for="term-check-2">동의</label>
                                    </span>
								</div>
								<div class="terms-content notice"  id="a2"  >
									<ul class="terms-content__listbox">
										<li>
											<strong class="cl-bold">수집항목</strong>
											<ul class="list-info v2"><!-- 20180516 -->
												<li>이름, 휴대폰번호, 생년월일, 이메일, 주소, 카드번호(신용카드 및 제휴 서비스카드 이용 시)</li>
											</ul>
										</li>
										<li>
											<strong class="cl-bold">이용목적</strong>
											<ul class="list-info v2"><!-- 20180516 -->
												<li>구매계약 이행 및 서비스 제공에 따른 요금 정산/기타 채권회수</li>
												<li>사고발생 시 손해배상 청구 및 보험처리</li>
											</ul>
										</li>
										<li class="color_bold">
											<span class="wg-bold">보유 및 이용기간</span>
											<ul class="list-info v2"><!-- 20180516 -->
												<li class="wg-bold">계약에 따른 거래관계의 종료 후 1년</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
							
							<!-- terms-list//end -->
							<div class="terms-list v3 list"  onclick="btnSlide('a3');">
								<div class="terms-header subject">
									<h4>자동차 표준 대여 약관 동의 <strong class="cl-point1">(필수)</strong></h4>
									<span class="checkbox v2">
                                        <input type="checkbox" id="term-check-3"  name="is_check"  onclick="boxCheck(); event.cancelBubble=true"/>
                                        <label class="label" >동의</label>
                                    </span>
								</div>
								<div class="terms-content notice" id="a3">
									<pre>
									제1장   총칙
									            
									제1조 (약관의 목적 및 적용)
									1. SK렌터카㈜(이하 "회사"라 한다)는 이 약관(이하 "본 약관"이라 한다)에 따라 대여자동차(이하 "렌터카"라 한다)를 임차인에게 임대하고 임차인은 이를 임차한다.
									2. 본 약관은 회사와 임차인(공동임차인 포함) 사이에 체결되는 자동차 단기대여 계약(서면, 온라인, 스마트폰, 태블릿 PC 기타 전자문서를 통해서 제공되는 계약을 포함하며, 이하 "대여계약"이라 한다)에 있어, 회사와 임차인의 권리와 의무에 관한 사항을 규정함을 목적으로 한다.
									3. 회사는, 법령에 반하지 않는 범위에서 특약을 정할 수 있으며, 특약한 때에는 그 특약이 우선한다. 단, 그 특약은 반드시 문서(전자문서 포함)에 기재되어야 한다.
									4. 회사는 약관의 규제에 관한 법률, 전자문서 및 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전자상거래 등에서의 소비자보호에 관한 법률(이하 “전자상거래법”이라 한다) 등 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있다.
									
									제2장   대여계약
									
									제2조 (예약 및 취소)
									1. 임차인은 렌터카를 임차할 때에 미리 차종, 임대차 개시일자 및 개시시각, 임차장소, 반환장소, 운전자 기타 임차조건을 명시하고 예약할 수 있으며, 회사는 렌터카의 보유범위 내에서 예약에 응한다.
									2. 전항의 예약이 있는 경우 회사는 대여예정요금의 10% 범위 내에서 예약금을 청구할 수 있다.
									3. 임차인이 제1항의 예약내용을 변경하고자 할 때에는 사전에 회사의 승낙을 받아야 한다.
									4. 임차인이 제1항에 의하여 예약한 임차개시 시각으로부터 1시간 이상 경과하여도 대여계약을 체결하지 않을 때에는 예약은 취소되는 것으로 한다. 이 경우 예약금은 반환하지 않는다.
									
									제3조 (대여계약의 체결)
									1. 회사는 대여할 수 있는 렌터카가 없을 때 및 임차인이 제3항 각 호에 해당할 때를 제외하고 임차인의 신청에 의하여 대여계약을 체결한다. 이 경우 임차인은 회사가 제공한 태블릿 PC 등 전자기기를 통하여 서명을 할 수 있으며, 전자서명을 완료한 경우 계약의 승낙으로 간주되어 대여계약이 성립한다.
									2. 대여계약의 체결은 대여계약서에 의하며, 대여계약서에는 제2조 제1항의 임차조건을 명시하여야 한다.
									3. 회사는 임차인이 다음 각 호에 해당할 때에는 대여계약의 체결을 거절할 수 있으며, 이 경우 지급받은 예약금을 반환한다.
									① 임차인(임차인이 아닌 자가 대여계약서상의 운전자인 경우에는 운전자를 말한다. 이하 이 조에서 같다)이 렌터카운전에 필요한 자격의 운전면허증을 소지하지 아니한 자와 만 21세 미만인 자. 다만, 사고발생의 빈도 및 보험적용요율 등을 감안하여 임차인의 연령 및 운전경력 등은 달리 정할 수 있다.
									② 신원확인이 불가능하거나 신원확인을 위한 회사의 질문이나 자료요구에 불응할 때
									③ 음주상태에 있을 때
									④ 마약, 각성제, 시너(신나) 등에 의한 중독상황이 의심되는 때
									⑤ 예약 당시 명시한 운전자와 렌터카 인수시의 운전자가 다를 때
									⑥ 과거 대여 시 대여요금 체납 이력이 있는 때
									⑦ 과거 대여 시 제18조 각 호 사항에 해당하는 행위를 한 이력이 있는 때
									⑧ 위 각 호에 준하는 사항으로서 대여계약의 체결을 거절할 만한 객관적인 사유가 있을 때
									
									제4조 (대여계약의 성립 등)
									1. 대여계약은 회사가 대여요금을 징수하고 임차인에게 렌터카를 인도한 때 효력이 발생한다. 이 때 예약금은 대여요금의 일부로 충당된다.
									2. 회사는 사고, 도난, 기타 회사의 귀책사유에 의하지 아니하는 사유로 인하여 예약차종의 렌터카를 대여할 수 없을 때에는 유사한 다른 차종의 렌터카(이하 ”대체렌터카”라 한다)를 대여할 수 있다.
									3. 전항에 의하여 대여하는 대체렌터카의 대여요금이 예약차종의 대여요금보다 비싸게 될 때에는 예약차종의 대여요금에 의하고 예약차종의 대여요금보다 싸게 될 때에는 당해 대체렌터카의 대여요금에 의한다.
									4. 임차인은 제2항에 의한 대체렌터카의 인수를 거절하고 예약을 취소할 수 있으며, 이 경우 회사는 임차인에게 예약금 전액을 반환한다.
									
									제5조 (대여계약의 해지)
									1. 회사는 임차인이 대여기간 중에 다음 각 호에 해당한 때에는 대여계약의 해지사유를 설명하고 즉시 대여계약을 해지하고 렌터카의 반환을 청구할 수 있다.
									① 임차인이 계약의 중요한 사항을 위반하여 계약을 유지하기 어려운 객관적인 사정이 존재할 때
									② 계약 당시 임차인이 제공한 개인정보, 운전자정보 등이 허위로 판명된 때
									③ 대여요금을 분할납부하기로 한 경우로서 대여기간 중 연체가 2기에 달한 때
									④ 임차인(임차인 아닌 자가 대여계약서상의 운전자인 경우에는 운전자를 말한다. 이하 이항에서 같다)의 운전면허가 취소 또는 정지된 때
									⑤ 임차인이 교통사고를 야기한 때
									⑥ 제3조 제3항 각 호에 해당하게 되었을 때
									⑦ 제18조의 금지행위를 한 때
									⑧ 음주운전을 한 때									
									2. 임차인은 다음의 경우에 계약을 해지할 수 있다.
									① 렌터카가 임차인에게 인도되기 이전의 하자로 인하여 사용 불가능하게 된 때(제23조 3항에 의한 조치를 받은 경우는 제외)
									② 임차인의 사정에 의하여 해지하는 때
									
									제6조 (불가항력 사유로 인한 대여계약의 중도종료)
									1. 렌터카의 대여기간 중에 천재지변, 기타 불가항력 사유로 인하여 렌터카의 사용이 불능하게 된 때에는 대여계약은 종료된 것으로 한다.
									2. 임차인은 전항에 해당하게 된 때에는 그 뜻을 회사에 연락하여야 한다.
									
									제7조 (중도해지)
									1. 임차인은 임차기간 중에라도 회사의 동의 하에 대여계약을 해지할 수 있다.
									2. 임차인의 귀책사유로 인하여 렌터카의 사고 또는 고장으로 대여기간 중에 반환한 때에는 대여계약은 해지된다.
									
									제8조 (임차조건의 변경)
									1. 대여계약의 성립 후 제2조 제1항의 임차조건을 변경하고자 할 때에는 미리 회사에 승낙을 받아야 한다.
									2. 회사는 변경된 임차조건에 따라 업무를 수행하기 어려운 경우에는 전항에 의한 임차조건의 변경을 승낙하지 않을 수 있다.
									3. 임차인이 임차기간을 연장하고자 하는 경우에는 변경 후의 임차기간에 해당하는 대여요금을 지불해야 한다.
									
									제3장   대여자동차
									
									제9조 (자동차의 종류)
									1. 회사가 대여할 수 있는 자동차는 대여 및 회사 홈페이지(www.skcarrental.com)에 대여용으로 게시된 자동차로 한다.
									2. 대여계약의 내용에 따라 렌터카에 네비게이션, 하이패스 단말기 등이 장착될 수 있고, 계약시점에 따라 공급제품이 변경될 수 있다.
									
									제10조 (보험가입 등)
									회사는 제3조 제2항에 의해 명시한 개시일자와 임차장소에 따라, 자동차손해배상보장법에 의한 책임보험과 자동차 종합보험(대인, 대물, 자손)에 가입되고 제15조에 부합하는 렌터카를 임차인에게 대여한다.
									
									제11조 (차량체크리스트작성 등)
									1. 회사는 임차인과 공동으로 점검표를 사용하여 인도 전 일상점검과 차체외관 및 차량운행에 필요한 기본공구의 적재여부 및 연료량을 확인한 다음 당해 렌터카를 대여한다.
									2. 회사는 전항의 확인에 있어 렌터카에 정비불량 등을 발견한 때에는 교환 등의 조치를 강구하고 그 내용을 기록∙유지하여야 한다.
									3. 회사는 렌터카를 인도한 때에는 자동차 임대계약서를 교부하고 주요내용을 설명하여야 한다.
									
									제12조 (운전자의 알선)
									1. 회사는 운전자를 알선하지 않는다. 다만, 법령의 규정에 의해 운전자를 알선할 수 있는 경우에는 임차인의 렌터카 사용에 불편이 없도록 성실한 운전자를 알선하여야 한다. 이때 알선 수수료는 받지 아니한다. 
									2. 제1항에 의하여 알선한 운전자의 신원은 회사가 보증하여야 한다.
									
									제4장   대여요금 등
									
									제13조 (대여요금 및 추가비용)
									1. 회사가 영수하는 대여요금은 회사가 게시한 대여요금표(회사의 홈페이지 및 인쇄물 등에 게시)를 기준으로 하며, 대여요금은 본 약관 제36조 차량손해면책제도 가입 수수료를 포함한다.
									2. 회사는 영업정책에 따라 회원, 임직원, 제휴사 등에 전항의 대여요금에 대해 별도의 인하 혜택을 제공하며, 탄력적으로 대여요금을 적용할 수 있다.
									3. 임차인은 임차인의 요구로 인하여 대여요금 외에 추가비용이 발생한 경우에는 그 추가비용을 부담하여야 한다.
									
									제14조 (요금의 수수방법)
									1. 임차인은 렌터카 인수 시에 소정의 예정대여요금을 선납한다.
									2. 사용기간 초과 등으로 선불요금에 부족이 있을 때에는 렌터카 반환 시에 정산한다.
									
									제5장   책임
									
									제15조 (정기점검의 의무 등)
									회사는 자동차관리법 제36조(자동차의 정비)의 정기점검 정비를 실시한 렌터카를 대여하여야 한다.
									
									제 16조 (임차인의 점검의무)
									1. 임차인은 임차기간 중 임차한 렌터카에 관하여, 매번 사용개시 전에 회사로부터 교부 받은 점검표에 의거 일상점검을 실시하여야 한다.
									2. 임차인은 제1항의 점검결과 이상이 발견된 경우에는 즉시 회사에 이를 통보하여야 한다.
									3. 임차인은 회사의 자동차 정기점검 요청 시 적극 협조하여야 한다.
									4. 임차인이 본 조의 점검의무를 불이행하여 회사 또는 제3자에게 손해가 발생한 경우, 임차인은 손해의 전부를 배상하고 회사를 면책시켜야 한다.
									
									제17조 (임차인의 관리책임)
									1. 임차인은 선량한 관리자의 주의의무를 가지고 렌터카를 사용하고 보관하여야 한다. 
									2. 전항의 관리 책임은 렌터카의 인도를 받은 시점부터 시작하여 회사에 반환한 시점에 끝난다.
									
									제18조 (금지행위)
									임차인은 렌터카의 임차기간 중에 다음의 행위를 하여서는 아니한다.
									1. 렌터카를 여객자동차운수사업 또는 이와 유사한 목적으로 사용하는 행위
									2. 렌터카 또는 렌터카에 장착된 부분품(네비게이션, 블랙박스, 하이패스 단말기 등)을 전대하거나 또는 담보에 제공하는 등 회사의 소유권을 침해하는 일체의 행위
									3. 렌터카의 차량번호를 위조 또는 변조하거나 렌터카를 개조 또는 개장하는 등 그 원상을 변경하는 행위
									4. 회사의 허락을 받지 아니하고 렌터카를 제3자의 운전연습에 제공하거나 각종시험 혹은 경기에 사용하거나 또는 다른 차를 견인하거나 견인에 준하는 행위
									5. 법령 또는 공서양속에 위반하여 렌터카를 사용하는 행위
									6. 대여계약서에 명시된 운전자 이외의 제3자 또는 무면허자에게 운전을 시키는 행위
									7. 운전자가 차량사고 후 특별한 사유(병원이송 등) 없이 사고처리(후속사고방지, 사고접수 등)를 하지 않고 사고현장을 이탈하는 행위
									8. 렌터카에 장착된 블랙박스에 기록된 영상을 해당 렌터카의 사고처리 목적 이외의 용도로 저장, 배포, 편집, 제공, 판매하는 등 관련 법령을 위반하는 일체의 행위
									9. 석유 및 석유대체연료 사업법 제2조 제10호의 규정에 의한 가짜석유제품을 렌터카의 연료로 사용하는 행위
									10. 위 각 호에 준하는 행위로 객관적으로 보아 그로 인하여 렌터카 또는 렌터카에 장착된 부분품(네비게이션, 블랙박스, 하이패스 단말기 등)을 손상시킬 우려가 있는 행위
									
									제19조 (배상책임)
									1. 임차인은 제18조의 해당되는 행위 또는 기타 임차인의 귀책사유로 인하여 회사 또는 제3자에게 손해를 끼쳤을 때에는 그 손해를 배상할 책임을 진다.
									2. 임차인이 교통법규위반 및 주정차 위반 등으로 인하여 부과 받은 과태료와 범칙금 등은 렌터카 반환 후에도 임차인이 부담하여야 한다.
									3. 제12조 제1항에 의하여 운전자를 알선 받은 임차인은, 임차인의 귀책사유가 없는 한, 제1항 및 제2항의 손해배상책임을 지지 아니한다.
									
									제6장   자동차사고 조치 등
									
									제20조 (사고처리) 
									1. 임차인은 렌터카에 또는 렌터카 운행으로 인한 사고가 발생한 때에는 관련 법령상의 조치를 취함과 동시에 다음의 정하는 바에 따라 처리하여야 한다.
									① 즉시 사고현황 등을 회사에 통보하여야 한다.
									② 당해 사고에 관하여 회사가 계약하고 있는 보험회사가 요청하는 서류 또는 증거의 제출에 협조하여야 한다.
									③ 당해 사고에 관하여 제3자와 합의를 할 때에는 미리 회사와 합의하여야 한다.
									④ 렌터카의 수리는 특별한 사유가 있는 경우를 제외하고 회사와 협의를 거쳐 정한 공장에서 시행하여야 한다.
									2. 임차인은 렌터카에 블랙박스(영상기록장치)가 장착된 경우, 렌터카의 사고처리 목적으로 기록된 사고영상을 회사 및 자동차보험 가입 보험회사, 기타 관계기관(경찰서 등)에서 요청 시 지체 없이 해당 영상을 원본 그대로 제공하여야 한다.
									3. 회사와 임차인은 각자 주어진 책임범위 내에서 사고해결을 위해 노력하고, 상호협조를 태만히 하여 상대방에게 손해를 입힌 경우에는 귀책사유에 따라 그 손해를 배상할 책임이 있다.
									4. 회사는 제1항 제4호에 따라 렌터카를 수리하는 경우 사전에 예상비용을 임차인에게 통지하고, 수리 후에는 소요된 비용을 임차인에게 청구한다.
									5. 임차인이 제1항 각 호의 어느 하나를 위반하거나 회사와 협의되지 아니한 곳으로 렌터카를 이동, 견인, 수리 등을 행하여 렌터카 운행에 지장이 초래되거나 재수리 등으로 추가비용이 발생하는 경우 이에 상응하는 비용은 임차인이 부담하여야 한다.
									
									제21조 (보험처리 등)
									1. 임차인(임차인 아닌 대여계약상 운전자 포함)은 사고발생 시 회사가 렌터카에 관하여 체결한 손해보험약관에 명시된 해석과 보상보장의 범위 내에서 보상∙보장(대인, 대물, 자손)의 혜택을 받는다. 다만, 다음 각 호의 경우와 보험회사 사고처리에 관련된 법규를 위반 시에는 보험보상의 일부 또는 전부를 받지 못한다.
									① 임차인의 고의 또는 중과실로 인한 손해
									② 무면허운전 사고로 인한 손해
									③ 렌터카를 여객자동차운수사업에 사용하거나 다시 제3자에게 전대하던 중 발생한 사고로 인한 손해
									④ 제3자의 수요에 응하여 렌터카를 사용하여 유상으로 여객을 운송 중 발생한 사고로 인한 손해
									⑤ 범죄를 목적으로 렌터카를 사용 중의 사고로 인한 손해
									⑥ 음주운전 중의 사고로 인한 손해
									⑦ 렌터카를 경기용이나 경기를 위한 연습용 또는 시험용으로 사용 중의 사고로 인한 손해
									⑧ 임차인(임차인과 동승자로 기록된 공동임차인 포함) 이외의 제3자가 렌터카를 운전하여 발생한 사고로 인한 손해
									⑨ 그 밖에 본 약관 및 관계법령을 위반하여 발생한 손해
									2. 종합보험 중 차량손해에 관한 보험가입은 임차인의 요청에 따라 선택할 수 있으며, 가입 시에는 보험약관에 의하여 사고 당시의 시가를 기준으로 실손해를 보상받는다. 다만, 임차인의 귀책사유로 인한 사고의 경우 제36조에서 정한 임차인 최대부담금 범위에서 임차인이 별도로 회사에 손해를 배상하여야 한다.
									3. 제2항의 차량손해보험에 가입하지 않았을 경우, 임차인의 귀책사유로 인한 손해가 발생하였을 때에는 사고차량의 수리비를, 수리가 불가능할 경우에는 사고 당시의 렌터카 시가를 기준으로 한 실손해를 임차인이 회사에 배상하여야 한다.
									4. 제1항 및 제2항의 보상금이 임차인이 부담하여야 할 손해배상금을 충당할 수 없을 때, 회사는 그 부족금 발생사유를 임차인에게 설명하고 손해범위 내에서 위 부족금을 청구할 수 있다.
									5. 대여계약이 종료되었음에도 임차인이 회사에 렌터카를 반환하지 않고 운행하다가 생긴 사고는 회사의 자동차보험 가입에도 불구하고 임차인이 손해배상책임을 져야 하며, 그 사고로 인하여 회사에 손해가 발생한 경우에는 임차인이 회사에 그 손해를 배상하여야 한다.
									
									제22조 (휴차손해부담)
									1. 임차인은 본인의 귀책사유로 인한 사고로 인하여 사고차량이 휴차할 경우에는, 수리 기간 중 휴차로 인한 회사의 실손해를 배상하여야 하고, 렌터카가 수리 불가능할 정도로 파손되거나 도난된 경우에는 렌터카의 재구매 및 등록 등에 소요되는 기간 동안의 영업손해를 배상하여야 한다.
									2. 회사는 전항에 의하여 임차인이 부담할 손해배상액을 정한 경우에는 회사의 평균 임차율 등을 감안한 객관적인 자료를 제시하여야 한다.
									3. 회사가 전항에 의한 객관적인 산정자료를 제시하지 않을 경우 임차인은 수리 기간 또는 재구매 및 등록에 소요되는 기간에 해당하는 대여요금의 50%를 부담한다. 이때 대여요금은 수리 기간 또는 재구매 및 등록에 소요되는 기간에 해당하는 1일 대여요금을 기준으로 산정하며, 이 때 대여요금의 기준은 사고가 발생한 날 회사 홈페이지(www.skcarrental.com)에 게시된 대여요금(제휴 할인이 되지 않은 요금)을 기준으로 한다.
									
									제23조 (고장 등의 조치)
									1. 임차인은 임차 기간 중 렌터카의 이상 또는 고장을 발견한 때에는 즉시 운전을 중지하고 회사에 연락함과 동시에 회사의 지시에 따라야 한다.
									2. 렌터카의 이상 또는 고장이 임차인의 고의 또는 과실에 의하는 경우에는 임차인은 렌터카의 인수 및 수리에 소요되는 비용을 부담하여야 한다.
									3. 렌터카의 인수 전의 하자로 인하여 렌터카가 사용 불가능하게 되었을 때에는 임차인은 회사로부터 대체렌터카의 제공 또는 이에 준하는 조치를 받을 수 있다.
									4. 임차인이 제3항에서 정하는 조치를 받을 수 없거나 받지 않은 경우에는 회사는 임차인에게 이미 지급 받은 대여요금을 임차인에게 반환한다.
									
									제24조 (불가항력 사유로 인한 면책)
									1. 천재지변 기타 불가항력 사유로 인하여 임차인이 임차기간 내에 렌터카를 반환할 수 없을 경우에는 회사는 그로 인하여 발생하는 손해에 관하여 임차인의 책임을 묻지 아니한다. 임차인은 이때 즉시 회사에 연락하고 회사의 요청에 협조하여야 한다.
									2. 천재지변 기타 불가항력 사유로 인하여 회사가 렌터카 또는 대체렌터카를 제공할 수 없을 때에는 임차인은 그로 인하여 발생하는 손해에 관하여 회사의 책임을 묻지 아니한다. 이때 회사는 즉시 임차인에게 그 사실을 통지하여야 한다.
									
									제7장   취소 환불
									
									제25조 (예약의 취소)
									1. 임차인은 제2조의 예약을 하고 임차인의 사정으로 예약을 취소한 때 또는 대여계약을 체결하지 아니한 때에는 다음 각 호에 의하여 해약수수료를 지불하여야 한다.
									① 임차예정 일시로부터 24시간 이전에 예약을 취소하는 경우에는 회사는 지체 없이 예약금을 임차인에게 반환하여야 한다.
									② 임차예정 일시로부터 직전 24시간 내에 예약을 취소하는 경우에는 회사는 임차인에게 예약금을 반환하지 아니한다.③ 회사는 예약금을 수령한 후 회사의 사정으로 예약을 취소하거나 대여계약을 체결하지 못할 경우에는 고객에게 사유를 설명하고 예약금을 반환한다.
									④ 예약을 한 후 천재지변 등 불가항력적인 사유로 인하여 계약을 체결할 수 없게 된 경우에는 회사는 예약금을 임차인에게 반환한다.
									
									제26조 (중도해약수수료)
									임차인이 제5조 제2항 제2호 또는 제7조에 따른 중도해지를 한 때에는, 회사는 임차인으로부터 미리 받은 대여요금 중 렌터카를 실제 반환한 시점을 기준으로 계산한 대여요금과 잔여기간 대여요금의 10%에 해당하는 금원을 공제한 잔액을 환불하여야 한다.

									제27조 (대여요금의 환불액)
									1. 제5조 제2항 제1호에 의하여 임차인이 대여계약을 해지한 때에는 영수한 대여요금의 전액
									2. 제6조 제1항에 의하여 대여계약이 종료한 때에는 미리 받은 대여요금에서 렌터카가 반환되는 때까지의 기간에 상당한 대여요금을 공제한 잔액
									3. 제5조 제2항 제2호의 임차인의 사정으로 대여계약을 해지할 때에는 미리 받은 대여요금에서 렌터카를 반환한 때까지의 요금과 잔여기간 대여요금의 10%에 해당하는 금원을 공제한 잔액
									(다만, 6개월 이상 장기계약의 경우 회사와 임차인은 회사의 손실을 고려하여 중도해지시의 수수료를 별도로 약정한다.)
									
									제8장 반환
									
									제28조 (렌터카의 확인 등)
									1. 임차인은 렌터카를 회사에 반환할 때 통상적 사용으로 인한 마모를 제외하고 인도를 받았을 때 확인한 상태로 반환하여야 한다.
									2. 회사는 렌터카 반환 시 임차인의 입회 하에 렌터카의 상태를 확인한다. 회사와 임차인은 렌터카 반환 시 잔여 연료량과 과∙부족분에 대한 연료 대금을 서로 정산한다. 다만, 회사가 연료탱크에 연료를 100% 채워 인도한 경우 임차인은 연료탱크에 연료를 100% 채워 반환한다.
									3. 회사는 렌터카를 반환 받을 때에는 임차인 입회 하에 렌터카 안의 임차인 또는 동승자의 유류품 잔류 유무를 확인한다.
									
									제29조 (렌터카의 반환시기 등)
									1. 임차인은 약정한 대여기간 종료시점 또는 대여계약 중도해지시점 또는 제6조 종료시점에 렌터카를 회사에 반환하여야 한다.
									2. 임차인이 제8조 제1항에 의하여 임차기간을 연장할 때에는 변경 후의 임차기간에 해당하는 대여요금을 지불하여야 한다.
									
									제30조 (렌터카의 반환장소 등)
									1. 임차인은 제3조 제2항에 의하여 명기한 반환장소에서 렌터카를 반환하여야 한다. 다만 제8조 제1항에 의하여 반환장소를 변경한 때에는 변경후의 반환장소에서 반환하여야 한다.
									2. 임차인의 사정으로 반환장소가 변경되어 회사가 부담하여야 할 비용이 발생한 경우에는, 임차인이 그 회송비용을 부담하여야 한다.
									
									제31조 (반환하지 않을 경우의 조치)
									1. 회사는 임차인이 제29조 제1항에서 정하는 반환시점으로부터24시간을 경과하여도 반환장소에 렌터카의 반환을 하지 아니하거나 회사의 반환 청구에 응하지 않을 때 또는 임차인의 소재가 불명한 때에는 렌터카 회수 및 손해보전에 필요한 모든 법적 조치를 취할 수 있다.
									2. 회사는 제1항에 해당되는 경우 렌터카의 소재를 확인하기 위하여 임차인에게 전화를 하거나 주소지를 방문하여 함께 거주하는 가족 및 친족 등에게 청취조사를 할 수 있으며, 차량위치정보시스템의 작동 등 필요한 조치를 취할 수 있다. 다만, 회사가 차량위치정보 확인이 가능한 자동차를 대여할 경우에는 렌터카 인도 전에 그 사실을 고객에게 고지하고 확인을 받아야 한다.
									3. 회사는 제2항에 따른 조치를 취하였음에도 렌터카와 임차인의 소재가 불명한 때에는 도난신고 등 필요한 조치를 취할 수 있다.
									4. 임차인은 제29조 제1항에서 정하는 반환시점에 차량을 반납하지 않을 경우(제24조 제1항의 경우는 제외), 일대여료의 200%를 반납지연일수로 곱한 금액을 지급하여야 한다.
									5. 회사는 다음 각 호의 어느 하나에 해당하는 임차인의 계약위반으로 인한 동종 또는 유사한 피해를 방지하기 위하여, 계약시 관련 법령에 따라 수집∙이용목적, 수집항목, 보유 및 이용기간 등이 기재된 별도의 “개인정보 수집이용동의서” 및 개인정보를 제공받는 자, 목적, 항목, 보유 및 이용기간 등이 기대된 별도의 “제3자 제공동의서”에 동의를 받아, 피해가 발생한 경우에 한하여 동종 사업자 및 사업자단체에 개인정보를 제공할 수 있다.
									① 임차인이 회사의 렌터카 반환요구에도 불구하고 정당한 사유 없이 렌터카를 반환하지 않거나 연락이 되지 않는 상태에서 렌터카 반환일로부터 익일 영업시간 내에 반환하지 않은 경우
									② 임차인이 대여요금을 연체하여 회사가 상당한 기간 동안 2회 이상 납부를 최고하였음에도 계속 연체하고 있는 경우. 단, 고객에게 부득이한 사유가 있는 경우는 제외
									③ 렌터카를 불법 매매 또는 개조한 경우
									④ 차량번호판 위조 또는 렌터카를 범죄에 사용하는 등 불법행위에 이용한 경우
									⑤ 렌터카를 전대, 담보제공 또는 매각하는 등 회사의 소유권을 침해하는 일체의 행위를 한 경우
									⑥ 교통사고 후 도주 또는 렌터카를 방치한 경우
									⑦ 렌터카를 여객자동차운수사업 또는 이와 유사한 목적으로 사용한 경우
									⑧ 대여계약서상의 운전자 이외의 자 또는 무면허자가 운전을 하다가 사고가 발생한 경우
									⑨ 렌터카를 제3자의 운전연습에 제공하거나 대여계약의 목적 이외의 각종 시험∙경기에 사용한 경우
									⑩ 다른 차를 견인하거나 견인에 준하는 용도로 렌터카를 사용한 경우
									⑪ 위 각 호에 준하는 행위로 회사에 중대한 손해를 발생시키는 경우
									6. 회사는 제5항에 따라 제공받은 고객의 정보를 고객으로부터 동의 받은 목적과 다른 목적으로 이용할 수 없다.
									7. 회사가 제1항 내지 제6항에 의한 업무를 처리하는 과정에서 고의 또는 과실로 고객에게 손해를 입힌 경우에는 배상책임을 부담한다.
									8. 임차인이 계약종료 후 차량을 미반납할 경우에는 회사는 임차인을 횡령으로 고소 후 차량을 말소 등록할 수 있다.
									
									제9장 보칙
									
									제32조 (지연손해금)
									회사와 임차인이 본 약관에 기초한 금전채무의 이행을 지체한 때에는, 상대방에게 연(24%)의 비율에 따른 지연손해금을 지급하여야 한다.
									
									제33조 (계약의 세칙)
									1. 회사는 본 약관에 준하여 따로 세칙을 정할 수 있다.
									2. 회사는 따로 세칙을 정한 때에는 이를 회사의 영업소 및 홈페이지에 게시함과 동시에 회사가 시행하는 팸플릿 및 요금표에 기재한 후 본 약관과 함께 임차인에게 설명하여야 한다. 이를 변경한 경우에도 같다.
									
									제34조 (국 영문의 해석)국문과 영문의 약관의 해석에 차이가 있을 시에는 국문약관에 따른다.
									
									제10장 특약
									
									제35조 (임차인의 연령 및 운전경력)
									회사는 임차인의 연령과 운전경력을 다음 각 항과 같이 제한할 수 있다.
									1. 임차인 연령 : 임차인이 승용 및 승합자동차를 임차하기 위해서는 만21세 이상이어야 한다.
									2. 운전경력 : 도로교통법상 유효한 운전면허증 소지자로서 승용자동차인 경우는 운전경력 1년 이상, 승합자동차인 경우는 운전경력 3년 이상이어야 한다.
									3. 전항의 운전경력은 임차인이 도로교통법상 유효한 운전면허증을 발급받은 날로부터 임차 개시일까지의 기간을 말한다.
									4. 대여차량의 운전자는 제1항, 제2항, 제3항의 조건을 모두 충족하여야 하며, 계약서에 표시된 운전자로 한다.
									
									제36조 (차량손해면책제도)
									1. 임차인은 회사에 소정의 수수료를 지불하고 대여계약 시 전면 ”차량손해면책”항의 ”가입”란에 서명함으로써 제21조 제2항의 차량손해배상책임으로부터 면책된다. 단, 임차인 최대 부담금 범위 내에서는 임차인이 이를 부담하여야 하고, 제2항에 해당하는 경우에는 차량손해면책제도가 적용되지 않는다. 차량손해면책은 “일반자차면책”, “완전자차면책”으로 구분되며, 임차인의 최대부담금의 한도는 다음과 같다.
									
									※ 수입차량의 경우 완전자차면책 가입 불가
									
									2. 임차인이 제18조에 명시된 금지행위를 하였을 경우에는 차량손해면책제도가 적용되지 않는다.
									
									제37조 (소송)
									대여계약에 의한 자동차 대여에 관하여 분쟁이 발행한 때에는 민사소송법에 의한 관할 법원을 제1심 법원으로 한다.
									
									제38조 (신용조회)
									회사는 임차인에 대한 신용도, 신용거래능력 등에 대하여 신뢰할 수 없는 사정이 있는 경우 이에 대한 판단을 위하여 임차인의 동의 하에 신용상태를 조회, 확인할 수 있다.
									
									제11장 위치 정보 및 개인 정보 수집 이용 등
									
									제39조 (차량위치정보의 수집)
									대여계약에 따라 회사가 임차인에게 대여하는 렌터카에는 렌터카의 위치정보를 수집할 수 있는 단말기가 부착되어 있으며, 회사는 다음 각 호의 사유가 발생하는 경우 단말기를 통하여 렌터카의 위치정보를 수집할 수 있다.
									1. 임차인의 신고 등으로 렌터카가 도난 분실되었음이 확인되는 경우
									2. 대여계약서 상에 기재된 반환시각에서 6시간을 경과하였음에도 불구하고 임차인이 사전통지 없이 렌터카를 반환하지 않은 경우
									
									제40조 (회사의 계약 거절)
									회사는 임차인이 계약사항을 불이행 하거나 채무를 이행하지 않는 동안, 고객 정보를 보유할 수 있고, 임차인의 대여계약 체결 또는 렌터카 인도 요구를 거절할 수 있다.
									
									제41조 (개인정보의 보호)
									1. 회사는 임차인의 개인정보를 대여계약 이행 및 임차인이 별도 동의한 목적 범위 내에서 업무 목적으로 사용할 수 있다.
									2. 임차인은 회사에 제공한 개인정보와 관련하여 변경사항이 있는 경우에는 지체 없이 회사에 그 변경사실을 통지하여야 하며, 이를 위반하여 발생한 일체의 손해에 대하여 회사는 어떠한 책임도 지지 않는다.
									3. 임차인은 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 회사는 이에 대해 지체 없이 필요한 조치를 취할 의무를 진다.
									4. 임차인이 오류의 정정을 요구한 경우에는 회사는 그 오류를 정정하고 잘못된 당해 개인정보를 지체 없이 파기한다.
									
									제42조 (블랙박스 설치/사용)
									1. 회사는 렌터카 또는 대체렌터카에 블랙박스(영상기록장치)를 기본으로 장착할 수 있다. 블랙박스는 사고 발생 시 사고 처리를 위한 정보(증거) 수집용으로만 사용되며, 임차인은 렌터카의 사고처리 목적으로 기록된 사고영상을 회사 및 자동차보험 가입 보험회사, 기타 관계기관(경찰서 등)에서 요청한 경우 해당 영상을 원본 그대로 제공하여야 한다.
									2. 임차인은 렌터카 또는 대체렌터카에 장착된 블랙박스에 기록된 영상을 렌터카의 사고처리 목적 이외의 용도로 저장, 배포, 편집, 제공, 판매하는 등 관련법령을 위반하는 일체의 행위를 해서는 안 된다.
									</pre>
								</div>
							</div>
							<!-- terms-list//end -->
							<div class="terms-list v3 list"   onclick="btnSlide('a4');" >
								<div class="terms-header subject">
									<h4>취소 및 위약금 규정 동의 <strong class="cl-point1">(필수)</strong></h4>
									<span class="checkbox v2">
                                        <input type="checkbox" id="term-check-4"  name="is_check"  onclick="boxCheck(); event.cancelBubble=true"/>
                                        <label class="label" for="term-check-4">동의</label>
                                    </span>
								</div>
								<div class="terms-content notice" id="a4">
									<ul class="list-info v1">
										<li>대여시간 24시간 이내 취소시 순수차량 대여요금의 10% 위약금이 발생합니다.</li>
										<li>대여시간 이후(NO-Show) 취소시 순수차량 대여요금의 10% 위약금이 발생합니다.</li>
										<li>대여시간에서 2시간 경과시 예약이 임의로 취소됩니다.</li>
									</ul>
								</div>
							</div>
							<!-- terms-list//end -->
							<!-- 190614 추가 -->
							<div class="terms-list v3 list selected"   onclick="btnSlide('a5');" >
								<div class="terms-header subject">
									<h4>대여자격 확인 동의 <strong class="cl-point1">(필수)</strong></h4>
									<span class="checkbox v2">
                                        <input type="checkbox" id="term-check-5"  name="is_check"  onclick="boxCheck(); event.cancelBubble=true"/>
                                        <label class="label" for="term-check-5">동의</label>
                                    </span>
								</div>
								<div class="terms-content notice" id="a5">
									<ul class="list-info v1">
										<li>승용차, 9인승 이하 차량 : 만 21세 이상, 2종 보통면허 이상, 운전경력 1년 이상(재취득포함)</li>
										<li>11인승 이상 차량 : 만 26세 이상, 1종 보통면허 이상, 운전경력 3년 이상(재취득포함)</li>
										<li>수입차 : 만 26세 이상, 운전경력 3년 이상(재취득포함)</li>
									</ul>
									<p class="cl-point1">* 운전자가 위의 대여자격조건에 맞지 않을 경우 현장에서 차량인수가 불가할 수 있습니다.</p>
								</div>
							</div>
							<!-- terms-list//end -->							
							<div class="terms-list v3 list">
								<div class="terms-header subject"  onclick="btnSlide('a6');">
									<h4 class="pal0">개인정보 위탁안내</h4>
								</div>
								<div class="terms-content notice" id="a6">
									<table class="tb-cnt">
										<caption>개인정보 위탁안내에 대한 표</caption>
										<colgroup>
											<col width="350px">
   											<col width="*">
										</colgroup>
										<thead>
										<tr>
											<th scope="col">수탁자</th>
											<th scope="col">처리 위탁 업무 내용</th>
										</tr>
										</thead>
										<tbody>
										<!-- 20180608 : s -->
										<tr>
											<td class="text-c">SK렌터카서비스(주)</td>
											<td>장기/중기/단기렌탈 계약 및 지점 운영업무 수행, 고객센터 운영, 당사 상품 및 서비스 안내 TM 
											(단, TM은 사전동의를 얻은 경우에 한함)</td>
										</tr>
										<tr>
											<td class="text-c">(주)한솔네트워크서비스, IH서비스, 광주경안 등<br> 120여 업체<br>
											<a href="#" class="btn-modal btn btn-small btn-line4" onclick="getCompanyPopList('20200701', '2020070101', 'SS');">자세히보기</a>
											</td>
											<td>단기렌탈 및 보험대차 서비스 제공</td>
										</tr>
										<tr>
											<td class="text-c">잡플러스, 라온HR, 파인스태프 등 10여 업체<br>
											<a href="#" class="btn-modal btn btn-small btn-line4" onclick="getCompanyPopList('20200701', '2020070101', 'SC');">자세히보기</a>
											</td>
											<td>영업점/고객센터 업무처리 및 고객상담, 계약 등</td>
										</tr>
										<tr>
											<td class="text-c">SK네트웍스(주)</td>
											<td>렌터카 차량 긴급출동 서비스</td>
										</tr>
										<tr>
											<td class="text-c">SK네트웍스(주) 스피드메이트 가맹점 : <br>강서공장 외 600여 개소<br>
												<a href="#" class="btn-modal btn btn-small btn-line4" onclick="getCompanyPopList('20200701', '2020070101', 'SM');">자세히보기</a></td>
											<td>렌터카 차량 수리</td>
										</tr>
										<tr>
											<td class="text-c">삼성화재서비스손해사정 주식회사 "애니카랜드"<br> 40여 개소<br>
												<a href="#" class="btn-modal btn btn-small btn-line4" onclick="getCompanyPopList('20200701', '2020070101', 'AC');">자세히보기</a></td>
											<td>렌터카 차량 수리</td>
										</tr>
										<tr>
											<td class="text-c">일급서해자동차정비(주) 외 150여 업체(전국)<br>
												<a href="#" class="btn-modal btn btn-small btn-line4" onclick="getCompanyPopList('20200701', '2020070101', 'CO');">자세히보기</a>
											</td>
											<td>렌터카 차량 수리</td>
										</tr>
										<tr>
											<td class="text-c">AJ 카리안서비스</td>
											<td>렌터카 일반수리/사고처리 대행, 렌터카 차량 검사 대행, 사고 시 긴급출동 대행</td>
										</tr>										
										<tr>
											<td class="text-c">SK 주식회사 C&amp;C, (주)AJ네트웍스, (주)알엔비소프트</td>
											<td>정보시스템 개발 및 유지/관리, 인프라 및 DB운영</td>
										</tr>
										<tr>
											<td class="text-c">SK인포섹(주)</td>
											<td>정보시스템 보안관리</td>
										</tr>
										<tr>
											<td class="text-c">(주)더홍, 미디어포스원</td>
											<td>SK렌터카, 빌리카 홈페이지 관리/운영</td>
										</tr>
										<tr>
											<td class="text-c">SCI평가정보(주)</td>
											<td>아이핀/휴대폰을 통한 본인확인</td>
										</tr>
										<tr>
											<td class="text-c">도로교통안전공단</td>
											<td>자동차운전면허 유효성 인증</td>
										</tr>
										<tr>
											<td class="text-c">FIRST DATA</td>
											<td>신용카드 결제(렌터카)</td>
										</tr>
										<tr>
											<td class="text-c">(주)다우기술</td>
											<td>SMS/MMS 발송 서비스 제공</td>
										</tr>
										<tr>
											<td class="text-c">(주)비즈톡</td>
											<td>알림톡/SMS/MMS/이메일 발송 서비스 제공</td>
										</tr>
										<tr>
											<td class="text-c">(주)넷퍼시</td>
											<td>eDM 발송 시스템 유지보수</td>
										</tr>
										<tr>
											<td class="text-c">에이블컴(주)</td>
											<td>보이는 ARS 서비스</td>
										</tr>
										<tr>
											<td class="text-c">(주)큐브세븐틴, 주식회사 얼리슬로스</td>
											<td>해피콜 시스템 공급</td>
										</tr>
										<tr>
											<td class="text-c">(주)세종텔레콤, 나래인터넷주식회사, LG유플러스</td>
											<td>080 수신거부 서비스 제공</td>
										</tr>
										<tr>
											<td class="text-c">(주)휴머스온</td>
											<td>PUSH 메세지 발송 서비스 제공</td>
										</tr>
										<tr>
											<td class="text-c">(주)스펙트라</td>
											<td>채팅상담 솔루션 제공</td>
										</tr>
										
										<!-- 20180608 : e -->
										</tbody>
									</table>
								</div>
							</div>
							<!-- terms-list//end -->
						</div>
						<!-- terms-listbox//end -->
                        <p class="msg-info v1">고객님께서는 동의를 거부할 권리가 있으나, 미 동의시 렌터카 서비스 이용이 불가능합니다.</p>
                    </div>
                    <!-- article-content//end -->
					<input placeholder="이름 입력" value=""><input placeholder="생년월일(8자리) 입력" value=""><input placeholder="휴대폰번호 (-없이)입력" value=""><br>
					                       <div class=" clearfix">
                        	<div class="email-input  col-1 maa0" id="alert-email"><!-- 20170705 : 경고 알럿 노출 될 경우 msg-alert 추가 부탁 드립니다. -->
                                <span class="col-3">
                                    <label><input oninput="carPrice();" type="text" placeholder="이메일 입력" class="checkEmail" name="emailId" id="emailId" value=""  maxlength="30"/></label>
                                </span>
                                <span class="hyphen col-3">
                                    <span class="text">@</span>
                                    <input oninput="carPrice();" type="text" placeholder="직접 입력" class="checkEmail" name="domain" id="email1" value=""  maxlength="30" />
                                </span>
                                <span class="select-box col-3">
                                    <select name="" id="email2" class="option01" onchange="emailInput(); carPrice();">
                                        <option value="">직접 입력</option>
	                                    	<option value="chol.com">chol.com</option>	
	                                    	<option value="dreamwiz.com">dreamwiz.com</option>	
	                                    	<option value="empal.com">empal.com</option>	
	                                    	<option value="freechal.com">freechal.com</option>	
	                                    	<option value="gmail.com">gmail.com</option>	
	                                    	<option value="hanafos.com">hanafos.com</option>	
	                                    	<option value="hanmail.net">hanmail.net</option>	
	                                    	<option value="hanmir.com">hanmir.com</option>	
	                                    	<option value="hitel.net">hitel.net</option>	
	                                    	<option value="hotmail.com">hotmail.com</option>	
	                                    	<option value="korea.com">korea.com</option>	
	                                    	<option value="lycos.co.kr">lycos.co.kr</option>	
	                                    	<option value="msn.com">msn.com</option>	
	                                    	<option value="nate.com">nate.com</option>	
	                                    	<option value="naver.com">naver.com</option>	
	                                    	<option value="netian.com">netian.com</option>	
	                                    	<option value="orgio.net">orgio.net</option>	
	                                    	<option value="paran.com">paran.com</option>	
	                                    	<option value="unitel.co.kr">unitel.co.kr</option>	
	                                    	<option value="yahoo.co.kr">yahoo.co.kr</option>	
	                                    	<option value="yahoo.com">yahoo.com</option>	
                                    </select>
                                </span>
                            </div>
                            <span class="msg-txt cl-point1" id="span-email"></span>
                        </div>
                        
  
                         <div class="">
                                <div class="address-input col-1">
                                    <span class="">
                                        <span class="">
                                            <label><input oninput="carPrice();"  type="number" class="readonly" readonly="readonly" placeholder="우편번호 검색"  placeholder="우편번호" name="zipcode" id="zipcode" value="${address[0]}" /></label>
                                        </span>
                                        <span class=" essential">
                                            <label><input oninput="carPrice();"  type="text" class="readonly" readonly="readonly" placeholder="주소 입력" name="address" id="address" value="${address[1]}" /></label>
                                        </span>
                                        <span class="">
                                            <label><input oninput="carPrice();"  type="text" placeholder="나머지 주소 입력"  name="addressDetail" id="addressDetail" maxlength="30" value="${address[2]}" onkeyup="checkingDtlAddr()" /></label>
                                        </span>
                                        <a href="#none" class="btn btn-default btn-fix2 fr" onclick="daumZipCode();" id="addrSearchBtn">우편번호 검색</a>
                                    </span>
                                    <span class="msg-txt cl-point1" id="span-addr"></span>
                                </div>
                            </div>
                            <div class="step-btn-box btn-box text-c">
                            
                            
                <a href="#" class="btn btn-line1 btn-large btn-fix2" >취소</a>
                <!-- 활성화 전에는 btn-color4 , 활성화 후에는 btn-color1로 셋팅 부탁 드립니다 -->
                <button type="submit" class="btn btn-color1 btn-large btn-fix2" onclick="nextPage();">다음</button>
            </div>
					                    
                </article>
			</div>
	</div>
	<!-- container//end -->
</div>


</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//주소를 가져오기 위한 검색
function daumZipCode(){
	new daum.Postcode({	
		oncomplete : function(data){
		//팝업에서 검색한 결과 항목을 클릭하였을 경우 실행할 코드를 작성하는 부분이다.

		//각주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = '';		//최종 주소
        var	extraAddr = '';		//조합형 주소 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if(data.userSelectedType == 'R'){	//도로명 주소를 선택할 경우
			fullAddr = data.roadAddress;
        } else {							//지번 주소를 선택한 경우
			fullAddr = data.jibunAddress;
        }

		//사용자가 선택한 주소가 도로명 타입일 때 조합한다.
		if(data.userSelectedType == 'R'){
			//법정동명이 있을 경우 추가한다.
			if(data.bname != ''){
				extraAddr += data.bname;
			}
			//건물명이 있을 경우 추가한다.
			if(data.buildingName != ''){
				extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
			}
			//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			fullAddr += (extraAddr != '' ? ' (' + extraAddr + ')' : '' );
		}

		//우편번호와 주소정보를 해당 필드에 넣는다.
		document.getElementById('zipcode').value 	= data.zonecode;	//5자리 새 우편 번호
		document.getElementById('address').value 	= fullAddr;		//주소

		//커서를 상세주소 입력 필드로 이동한다.
		document.getElementById('addressDetail').focus();

		}
  	}).open();
	
	
}


//이메일 선택 시 메일 값을 넣는다
function emailInput(){
	$('#email1').val($('#email2').val());
}
</script>
</html>
</layoutTag:layout>