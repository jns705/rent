	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청</title>
<%@ include file="serviceHeader.jsp" %>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
</head>
<body>
</body>
<div id="content">
    <div id="container">
        <div class="breadcrumbs">
            <h2 class="tit">자주 찾는 질문</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>고객센터</span>
                <span class="cl-bold">자주 찾는 질문</span>
            </div>
        </div>
        <!-- breadcrumbs//end -->
        <style>.col-9 {width: 10%!important;}</style> <!-- 다이렉트 추가 -->
        <div class="tab-menu v4 common-section">
            <ul class="unlink">
                <li class="col-9 selected" data-value="">
                    <a href="#" onclick="getSubList('');">전체</a>
                </li>
                <li class="col-9 " data-value="i110">
                    <a href="#" onclick="getSubList('i110');">다이렉트</a>
                </li>
                <li class="col-9 " data-value="b110">
                    <a href="#" onclick="getSubList('b110');">단기</a>
                </li>
                <li class="col-9 " data-value="c110">
                    <a href="#" onclick="getSubList('c110');">중고차장기</a>
                </li>
                <li class="col-9 " data-value="e110">
                    <a href="#" onclick="getSubList('e110');">전기차</a>
                </li>
                <li class="col-9 " data-value="f110">
                    <a href="#" onclick="getSubList('f110');">멤버십</a>
                </li>
                <li class="col-9 " data-value="g110">
                    <a style="letter-spacing:-1px;" href="#" onclick="getSubList('g110');">긴급출동/사고</a>
                </li>
                <li class="col-9 " data-value="h110">
                    <a href="#" onclick="getSubList('h110');">공통</a>
                </li>
            </ul>
        </div>
        
        <form name="frm" id="frm" action="#" method="post">
        	<input type="hidden" id="pageNo" name="pageNo" value="1">
        	<input type="hidden" id="rowPerPage" name="rowPerPage" value="10">
        	<input type="hidden" id="boardWrtwClfCd" name="boardWrtwClfCd" value="">
        	
            <div class="question-search-field clearfix">
                <div class="fl">
                    <a href="/serviceCenter/customerConsultation" class="btn btn-line4 btn-fix125">고객상담</a>
                </div>
                <div class="input-field fr">
                    <div class="input-row clearfix">
                        <span class="input fl">
                            <label><input type="text" id="schWord" name="schWord" value="" placeholder="검색어를 입력해 주세요."></label>
                        </span>
                        <button class="btn btn-default btn-fix1 fr" onclick="getClientNoticeList();">검색하기</button>
                    </div>
                </div>
            </div>
        </form>
		        
	        <div class="accordion-type">
	           	        <!-- for문 이용해서 list랑 notice 옆에 _i값 넣어서 하면될듯 -->
		            <div class="list selected"> <!-- 선택되면 list 옆에 selected <-생김 -->
		                <div class="subject">
		                    <a href="#none">
		                        <span class="cl-point1">구분 [단기]</span>
		                        <strong>제목 유류비 환불은 몇 일이 소요되나요?</strong>
		                    </a>
		                </div>
		                <div class="notice" style="display: block;"> <!--  none는 닫힘 block 열림 -->
		                    <div class="word">
		                        <p>내용<img src="https://image.speedmate.com/rentcar/real/notice/20200402_faq.png">&nbsp; </p>
		                    </div>
		                </div>
		            </div>
		            
	        </div>
<div class="paging">
</div>
    </div>
</div>



</html>
</layoutTag:layout>