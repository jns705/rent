<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
//숫자 세자리 , 찍는 함수
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
			var str = '';
			$.each(data.rentList, function(key, value){
				str+= '<a href="#"><div class="form-group" onclick="location.href=\'${path}/rent/rentListDetail/'+ value.rent_id +'\'"><div style="padding-bottom: 30px;" class="col-sm-6"><table class="table table-bordered">';
				str+= '<tr><td width="200">&nbsp;<img src ="'+ value.rent_url + '" width="160" height="90"></td>';
				str+= '<td width="320">'+ value.car_name +'</td></tr>';
				str+= '<tr><td>소비자가 : '+ numberFormat(value.car_price*10000) +'원</td>';
				str+= '<td>월 렌탈료 : '+ numberFormat(value.price) +'원</td></tr>';
				str+= '<td colspan=2><div><ul class="col-sm-6">';
				str+= '<li>차량등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ value.reg_date.substring(0,4)+'년</li>';
				str+= '<li>계약기간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;최대 '+ value.max_month+'개월</li>';
				str+= '</ul><ul class="col-sm-6">';
				str+= '<li>주행거리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ value.milage +'Km</li>';
				str+= '<li>지역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	'+ value.location +'</li></ul></div></td>';
				str+= '</table></div></div></a>';
			});
				if(data.count > 1 ){
				str+= '</div><br><br><div class="col-sm-12">';
				str+= '<button class="col-sm-12 btn" id="moreBtn" type="button" onclick="more('+ data.count +');">더보기&nbsp;<span class="glyphicon glyphicon-menu-down"></span></button></div>';
				}
				
				$('#total').html('검색결과 (총 '+data.total+'건)');
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


