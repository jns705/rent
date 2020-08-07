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
header img{margin-top:0px;}
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
		<div class="container" style="padding-left: 0px; width: 1014px;">
		<div class="tab-menu v1">
            <ul class="unlink tTab" id="reservMenu">
            	<li class="col-3 selected">
                	<a href="/rent/NewRentList">신차 렌트카</a>
                </li>
                <li class="col-3 ">
                    <a href="/rent/rentList">중고차 렌트카</a>
                </li>
                <li class="col-3" >
		           <a href="/buy/memberCheckForm?check=1">예약 확인</a>
                </li>
            </ul>
        </div>
	</div>
	
	
<input class="hidden" name="limit" value="">
	<article id="artcleCarModlList" >
				<div class="header-group clearfix">
						<h3>
							검색 결과<span class="result_span" id="total"></span>
						</h3>
					<div class="select-col result_kind_new">
						<span class="select-box"> 
							<select name="orderBy" onchange="searchForm();" class="form-control ">
								<option value="0">낮은 가격 순</option>
								<option value="1">높은 가격 순</option>
								<option value="2">짧은 주행거리 순</option>
								<option value="3">최근 등록 순</option>
								<option value="4">인기 순</option>
							</select>
						</span>
					</div>
				</div>
				
<div class="quick-top off" style="z-index: 1000">
    <a href="#top" id="aaaaaa" class="btn-top">TOP</a>
</div>
<style>
.quick-top.off {    
top: auto;
    bottom: 235px !important;
    height: 70px;
    position: fixed;
    top: 93%;
    right: 50%;
    margin-right: -580px;
}

</style>
				
		<div id="aa"></div>
		
		
		
		</article>
	</div>
</form>
		<br><br>	
</div>
</body>
<script type="text/javascript">


searchForm();
//최종 데이터 조회
function searchForm(click){
	if(click != 'click') $('[name=limit]').val('');
	var forms = $('.listForm').serialize();
		
	$.ajax({
		url  : '/rent/newRentListProc',
		data : forms,
		traditional : true,
		type : 'get',
		success : function(data){
			var str = '<div class="result_bigbox" id="result_bigbox_list" style="margin:0px">';
			$.each(data.rentList, function(key, value){
				str += '<a href="#"><div class="result_box" onclick="location.href=\'/rent/NewRentListDetail/'+ value.rent_id +'\'">'+
				'<div class="car-list__sticker special">신차</div>'+
			'<div class="result_box_top ">'+
					'<div class="result_img user_car">'+
							'<img src="'+value.color_url+ value.color_image +'" alt="기아자동차 2017 K7 2.4 GDI[가솔린] 리미티드" class="user_img">'+
						'<span class="car_number">'+ value.car_number +'</span>'+
					'</div>'+
				'<div class="result_top_right">'+
					'<p><span class="hotdeal_sticker top-2">Hot Deal</span>'+ value.manufacturer +'</p>'+
					'<p style="width: 200px;">'+
						value.car_name +'</p>'+
						'<ul class="sticker_box">'+
							'<li class="sticker_membership">멤버십</li>'+
						'</ul>'+
					'<ul class="result_rental">'+
						'<li style="font-size: 14px; margin-top: 70px;">렌탈료</li>'+
						'<li>'+
							'<span class="result_rental_price"  style="margin-top: 68px;">'
							+ numberFormat(value.price) +'<font size="-1">원~</font></span>'+
						'</li><li></li>'+
					'</ul>'+
				'</div>'+
				'<ul class="normal_price" style="width: 500px !important;">'+
					'<li style="font-size: 14px;">금  액</li>'+
					'<li><span>'+ numberFormat(value.car_price*10000) +'</span>원</li>'+
				'</ul>'+
			'</div>'+
			'<div class="result_box_bottom" style="height	: 114px;">'+
				'<div class="result_bottom">'+
					'<ul class="result_bottom_left_ul_dot">'+
						'<li>차량등록</li>'+
						'<li>주행거리</li>'+
					'</ul>'+
					'<ul class="result_bottom_left_ul">'+
						'<li> '+ value.reg_date.substring(0,4)+'년 </li>'+
						'<li> '+ value.milage +'km </li>'+
					'</ul>'+
				'</div>'+
				'<div class="result_bottom">'+
					'<ul class="result_bottom_left_ul_dot">'+
						'<li>계약기간</li>'+
						'<li>지역</li>'+
					'</ul>'+
					'<ul class="result_bottom_left_ul">'+
							'<li>'+ value.max_month+'개월</li>'+
							'<li>'+ value.location +'</li>'+
					'</ul>'+
				'</div>'+
			'</div>'+
		'</div></a>';
				
			});
				if(data.count > 1 ){
				str+= '</div><br><br><div class="col-sm-12" style="padding:0px;">';
				str+= '<button class="col-sm-12 btn" id="moreBtn" type="button" onclick="more('+ data.count +');">더보기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></button></div>';
				}
				
				$('#total').html('(총 '+data.total+'건)');
			$('#aa').html(str);
		}
	});
}

//더보기 버튼 클릭 시 
function more(count){
	$('[name=limit]').val(count-1);
	searchForm('click');
}




							
</script>

</html>
</layoutTag:layout>