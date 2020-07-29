<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
var id = '${sessionScope.id}';
$(function() {
	str='';
	str += '<div class="gnb-localnav">';
	str += '<div class="gnb-wrapper">';
	str += '<div class="gnb-curent customer">';
	str += '<ul><li class="selected">';
	str += '<a id="P0401" href="#none" data-name="customer" data-role="true">고객센터</a>';
	str += '<div class="gnb-depth-layer">';
	str += '<ul><li>';
	str += '<a id="P040101" href="/rent/custcnte/notice/notice_list.do">공지사항</a>';
	str += '</li><li>';
	str += '<a id="P040102" href="/serviceCenter/customerConsultation">고객상담</a>';
	str += '</li><li>';
	str += '<a id="P040103" href="/serviceCenter/faq">자주찾는 질문</a>';
	str += '</li><li>';
	str += '<a id="P040104" href="/rent/custcnte/branch/shortBranch_list.do">지점안내</a>';
	str += '</li><li>';
	str += '<a href="/rent/custcnte/garage/skGarage_list.do">정비매장</a>';
	str += '</li><li>';
	str += '<a id="P040105" href="/rent/custcnte/html/form_download.do">양식다운로드</a>';
	str += '</li></ul></div></li></ul></div>';

	//위에 str 없으면 화면 깨짐
	
	str += '<div class="gnb-local-depth"><ul><li>';
	str += '<a id="P040101" href="/serviceCenter">공지사항</a>';
	str += '</li><li>';
	str += '<a id="P040102" href="/serviceCenter/customerConsultation">고객상담</a>';
	str += '</li><li>';
	str += '<a id="P040103" href="/serviceCenter/faq">자주찾는 질문</a>';
	str += '</li><li>';
	str += '<a href="${path}/qna/list">QNA</a>';
	str += '</li><li>';
	
	if( id == 'master') {
		str += '<a id="P040104" href="${path}/serviceCenter/noticeInsertForm">공지사항 글쓰기</a>';
		str += '</li><li>';
		str += '<a id="P040105" href="${path}/serviceCenter/faqInsertForm">자주찾는 질문 글쓰기</a>';
		str += '</li></ul>';
	}
	
	str += '</div></div></div>';
	$(".service").html(str);
});

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
	}else { //스크롤 맨위 (0)
		$('.extend').removeClass('fixed');
		$('.serviceHide').addClass('header-placeholder');
		$('.serviceLong').css({left : "auto", right : "0px"});
		$('.serviceShort').css({left : "60px", width : "100px"});
		$('.gnb-listbox').css({"background-color" : "#fff"});
	}
});

</script>
