<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
function selectList(value) {
	//클릭하면 기존에 있던 seleted 와 display를 초기화시키고
		$('.list').removeClass('selected');
		$('.notice').css("display","none");
	//클릭한 메뉴를 seleted , display block 해준다
		$('.'+value).addClass('selected');
		$('.'+value).children('.'+value+'a').css("display","block");
}

function getPList(paging) {
	//페이징 숫자를 누르면 기존의 선택한 것들을 다 초기화한다.
	$('.p').removeClass('selected');
	$('.'+paging).addClass('selected');
	$('.list').removeClass('selected');
	$('.notice').css("display","none");

	//페이징 1버튼 누르면
	if(paging == "paging1") {
		//p1을 보여주고 나머지는 가려준다
		$('.p1').removeClass('hidden');
		$('.p2').addClass('hidden');
		$('.p3').addClass('hidden');
	//페이징 2버튼 누르면
	}else if(paging == "paging2") { 
		//p2을 보여주고 나머지는 가려준다
		$('.p2').removeClass('hidden');
		$('.p1').addClass('hidden');
		$('.p3').addClass('hidden');
	//페이징 3버튼 누르면	
	}else if(paging == "paging3") {
		//p3을 보여주고 나머지는 가려준다
		$('.p3').removeClass('hidden');
		$('.p1').addClass('hidden');
		$('.p2').addClass('hidden');
	}
	
}
</script>