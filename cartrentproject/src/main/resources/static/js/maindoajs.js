/**
 * 
 */

//윈도우 크기 바뀔 때 마다
$(document).ready(function(){
    $(window).resize(resizeContents);
    resizeContents();
});

function resizeContents() {
    $(".main").height($(window).height());$("#section-1").width($(window).width());
    $('.main').css("background-size", $(window).width()+50+"px "+ $(window).height() + "px");
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