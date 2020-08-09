<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
//문서 로딩시 스크롤값 얻기
$(document).scrollTop();
//실시간(현재) 스크롤값 얻기 (현재 스크롤값)
$(window).scroll(function () {
	var scrollValue = $(document).scrollTop();
	//스크롤 내릴때
	if(scrollValue != 0) {
		$('.extend').addClass('fixed');
		$('.serviceHide').removeClass('header-placeholder');
		$('.serviceLong').css({left : "300px"});
		$('.serviceShort').css({left : "-400px"});
		$('.gnb-listbox').css({"background-color" : "#f5f5f5"});
		$('#logoImg').attr('style', 'margin-top:-20px;');
	}else { //스크롤 맨위 (0)
		$('.extend').removeClass('fixed');
		$('.serviceHide').addClass('header-placeholder');
		$('.serviceLong').css({left : "auto", right : "50px"});
		$('.serviceShort').css({left : "40px", width : "100px"});
		$('.gnb-listbox').css({"background-color" : "#fff"});
		$('#logoImg').attr('style', 'margin-top:0px;');
	}
});
</script>
