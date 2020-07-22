<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
//숫자 세자리 , 찍는 정규식
function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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

//버튼 클릭시 효과 & 값 입력
function cc(index, data){
	var data1 = $('.'+ data + index).html();
	if($('.'+ data + index).attr('class').match('selected_red_font')==null){
		$('.'+ data + index).addClass('selected_red_font selected_red');
		$('#a' + data1).val(data1);
		
		$('.'+data).attr('class', data);
		$('.'+data).val('');
	}else{
		$('.'+ data + index).attr('class', data + index);
		$('#a' + data1).val('');
	}
}

//전체 버튼 클릭 시 다른 값 제거
function ac(data){
	var temp = '';
	if($('.'+data).attr('class').match('selected_red_font')==null){
		$('.'+data).addClass('selected_red_font selected_red');
		
		for(i = 0 ; i < 6; i++){
			$('.'+ data + i).attr('class', data + i);
			$('#a' + $('.'+ data + i).html()).val('');
		}
	}else{ 
		$('.'+data).attr('class', data);
	}
}

//최종 데이터 조회
function searchForm(click){
	if(click != 'click') $('[name=limit]').val('');
	var forms = $('.listForm').serialize();
		
	$.ajax({
		url  : '/rent/rentListProc',
		data : forms,
		traditional : true,
		type : 'get',
		success : function(data){
			var str = '<div class="result_bigbox" id="result_bigbox_list" style="margin:0px">';
			$.each(data.rentList, function(key, value){
				str += '<a href="#"><div class="result_box" onclick="location.href=\'/rent/rentListDetail/'+ value.rent_id +'\'">'+
				'<div class="car-list__sticker joonggo">중고차</div>'+
			'<div class="result_box_top ">'+
					'<div class="result_img user_car">'+
							'<img src="'+value.rent_url+'" alt="기아자동차 2017 K7 2.4 GDI[가솔린] 리미티드" class="user_img">'+
						'<span class="car_number">'+ value.car_number +'</span>'+
					'</div>'+
				'<div class="result_top_right">'+
					'<p>'+ value.manufacturer +'</p>'+
					'<p style="width: 200px;">'+ value.car_name +'</p>'+
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
				'<div class="howmany_box" style="font-size: 12px; background-color: f5f5f5;'+ 
				'z-index: -5">'+
					'<span class="howmany_box_span">현재 <span class="cl-point2 fontbold">'+ 
					+ value.standby_personnel +'</span>명의 고객님이 상담 진행 중입니다.</span>'+
				'</div>'+
		'</div></a>';
				
			});
				if(data.count > 1 ){
				str+= '</div></div><div class="col-sm-12" style="padding:0px; border:none !important;">';
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


