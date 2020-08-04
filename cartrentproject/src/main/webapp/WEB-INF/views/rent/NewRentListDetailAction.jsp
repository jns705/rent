<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<script type="text/javascript">
//유효성 검사
function checkForm(data){
	var ck = true;

if(!$('input:checkbox[id=term-check-all]').is(':checked')){
  var offset = $("#allcheck").offset();
  $('html, body').animate({scrollTop : offset.top-600}, 400);
	$('#sp').css('color','#f68121');
	alert("모든 항목에 동의를 하셔야 회원가입이 가능합니다.");
	return false;
}

var offset = $("[name=name]").offset();
$('html, body').animate({scrollTop : offset.top-170}, 400);

if($('[name=name]').val().length < 4){
	$('[name=name]').css('border-color','#f68121');
	$('[name=birthday]').css('border-left','1px solid #f68121');
	$('#span-name').html('이름은 세자리 이상 입력해주세요');
	ck = false;
}

if(!$('[name=name]').val()){
	$('[name=name]').css('border-color','#f68121');
	$('[name=birthday]').css('border-left','1px solid #f68121');
	ck = false;
}



if($('[name=birthday]').val().length != 8){
	$('[name=birthday]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	$('#span-birth').html('생년월일은 여덟자리를 입력해주세요');
	ck = false;
}
if(!$('[name=birthday]').val()){
	$('[name=birthday]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	ck = false;
}


if($('[name=tel]').val().length < 10){
	$('[name=tel]').css('border-color','#f68121');
	$('[name=tel]').css('border-left','1px solid #f68121');
	$('#span-mobile').html('전화번호는 9자리 이상 입력해주세요');
	ck = false;
}
if(!$('[name=tel]').val()){
	$('[name=tel]').css('border-color','#f68121');
	ck = false;
}

if(!$('[name=emailId]').val()){
	$('[name=emailId]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	ck = false;
}
if($('[name=emailId]').val().length < 5){
	$('[name=emailId]').css('border-color','#f68121');
	$('[name=emailId]').css('border-left','1px solid #f68121');
	$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	ck = false;
}

if(!$('[name=domain]').val()){
	$('[name=domain]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	ck = false;
}
if($('[name=domain]').val().length < 5){
	$('[name=domain]').css('border-color','#f68121');
	$('[name=domain]').css('border-left','1px solid #f68121');
	$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	ck = false;
}




if(!$('[name=addressDetail]').val()){
	$('[name=addressDetail]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	ck = false;
}if($('[name=addressDetail]').val().length < 5){
	$('[name=addressDetail]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	$('#span-address').html('주소는 5자리 이상 입력해주세요');
	ck = false;
}

if(!$('[name=address]').val()){
	$('[name=address]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	ck = false;
}if($('[name=address]').val().length < 5){
	$('[name=address]').css('border-color','#f68121');
	$('[name=addressDetail]').css('border-left','1px solid #f68121');
	$('#span-address').html('주소를 입력해주세요');
	ck = false;
}
$('.spamS').css('font-size','14px');

if(ck==true){
	if(data=='1'){
		$("#newCarForm").attr("action", "${path}/buy/newRent");
		$("#newCarForm").submit();
	}else
		formsol.submit();
}
}

//이름 검사(정규식)
function isNameCheck(input) {
	var var_normalize 	= /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;  //정규식
	if(var_normalize.test(input))	return false;
	else						 	return true;
}//End - function isNameCheck(inputVal)

//숫자정규식
function isNameCheckNum(input){	
	var checkNum = /^[0-9]*$/;
	if(!checkNum.test(input))return true;
	else false;
}
//영어숫자정규식
function engCheck(input){	
	var checkNum = /^[a-zA-Z0-9]*$/;
	if(!checkNum.test(input))return true;
	else false;
}


function idCheck(){
	if(!isNameCheck($('[name=name]').val())){
		$('[name=name]').val( $('[name=name]').val().substring(0,$('[name=name]').val().length-1));
	}
	if($('[name=name]').val().length < 4){
		$('[name=name]').css('border-color','#f68121');
		$('[name=birthday]').css('border-left','1px solid #f68121');
		$('#span-name').html('이름은 세자리 이상 입력해주세요');
	}else{
		$('[name=name]').css('border-color','#ddd');
		if($('[name=birthday]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
		$('[name=birthday]').css('border-left','1px solid #ddd');
		$('#span-name').html('');
	}
}
function birthCheck(){
	if(isNameCheckNum($('[name=birthday]').val())){
		$('[name=birthday]').val( $('[name=birthday]').val().substring(0,$('[name=birthday]').val().length-1));
	}if($('[name=birthday]').val().length != 8){
		$('[name=birthday]').css('border-color','#f68121');
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-birth').html('생년월일은 여덟자리를 입력해주세요');
	}else{
		$('[name=birthday]').css('border-color','#ddd');
		if($('[name=name]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
			$('[name=birthday]').css('border-left','1px solid #ddd');
		else $('[name=birthday]').css('border-left','1px solid #f68121');


		if($('[name=tel]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
			$('[name=tel]').css('border-left','1px solid #ddd');
		else $('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-birth').html('');
	}
}

function telCheck(){
	if(isNameCheckNum($('[name=tel]').val()) || $('[name=tel]').val().substring(0,1) != 0){
		$('[name=tel]').val( $('[name=tel]').val().substring(0,$('[name=tel]').val().length-1));
	}
	if($('[name=tel]').val().length < 10){
		$('[name=tel]').css('border-color','#f68121');
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-mobile').html('전화번호는 9자리 이상 입력해주세요');
	}else{
		$('[name=tel]').css('border-color','#ddd');
		if($('[name=birthday]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
		$('[name=tel]').css('border-left','1px solid #ddd');
		else  
		$('[name=tel]').css('border-left','1px solid #f68121');
		$('#span-mobile').html('');
	}
}

function emailCheck(){
	if(engCheck($('[name=emailId]').val())){
		$('[name=emailId]').val( $('[name=emailId]').val().substring(0,$('[name=emailId]').val().length-1));
	}
	if($('[name=emailId]').val().length < 5){
		$('[name=emailId]').css('border-color','#f68121');
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	}else{
			$('[name=emailId]').css('border-color','#ddd');
			if($('[name=domain]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
		$('[name=domain]').css('border-left','1px solid #ddd');
		$('#span-email').html('');
	}
}

function emailCheck1(){
	if(engCheck($('[name=domain]').val())){
		$('[name=domain]').val( $('[name=domain]').val().substring(0,$('[name=domain]').val().length-1));
	}
	if($('[name=domain]').val().length < 5){
		$('[name=domain]').css('border-color','#f68121');
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('이메일은 5자리 이상 입력해주세요');
	}else{
		$('[name=domain]').css('border-color','#ddd');
		if($('[name=emailId]').css('border-top') == '1.11111px solid rgb(246, 129, 33)')
		$('[name=domain]').css('border-left','1px solid #f68121');
		$('#span-email').html('');
	}
}
function addressCheck(){

	if($('[name=addressDetail]').val().length < 5){
		$('[name=addressDetail]').css('border-color','#f68121');
		$('[name=addressDetail]').css('border-left','1px solid #f68121');
		$('#span-address').html('상세주소는 5자리 이상 입력해주세요');
	}else{
		$('[name=addressDetail]').css('border-color','#ddd');
		if($('[name=address]').css('border-top') == '1.11111px solid rgb(246, 129, 33)')
		$('[name=addressDetail]').css('border-left','1px solid #f68121');
		$('#span-address').html('');
	}

	if($('[name=address]').val()){
		$('[name=address]').css('border-color','#ddd');
		if($('[name=addressDetail]').css('border-top') != '1.11111px solid rgb(246, 129, 33)')
		$('[name=addressDetail]').css('border-left','1px solid #ddd');
	}
	
}


</script>