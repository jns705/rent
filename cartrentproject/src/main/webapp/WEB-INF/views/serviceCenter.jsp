<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<%@ include file="service/serviceHeader.jsp" %>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
	<meta charset="UTF-8">
	<title>렌트의 기준 - 솔렌트카</title>
</head>
<body>
<div id="content">
    <div id="container">
        <div class="breadcrumbs">
            <h2 class="tit">공지사항</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>고객센터</span>
                <span class="cl-bold">공지사항</span>
            </div>
        </div>
        <!-- breadcrumbs//end -->
        <form name="frm" id="frm" action="#" method="get">
        	<input type="hidden" id="pageNo" name="pageNo" value="1">
        	<input type="hidden" id="rowPerPage" name="rowPerPage" value="10">
        	<input type="hidden" id="searchBoardSeqNo" name="searchBoardSeqNo" value="">
        	        
            <div class="notice-search-field clearfix">
                
                <div class="input-field fr">
                    <div class="input-row clearfix">
                        <span class="select-box fl">
							<select id="schKind" name="schKind" class="option01 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
								<option value="" selected="selected">전체</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
							</select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 142px;"><span class="selection"><span class="select2-selection select2-selection--single option01" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-schKind-container"><span class="select2-selection__rendered" id="select2-schKind-container" title="전체">전체</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                        </span>
                        <span class="input fl">
                            <label><input id="schWord" name="schWord" type="text" value="" placeholder="검색어를 입력해 주세요."></label>
                        </span>
                        <button class="btn btn-default btn-fix1 fr" onclick="getClientNoticeList();">검색하기</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="notice-global-list">
			            <table class="tb-cnt tb-my cnt-center">
			                <caption>공지사항 리스트</caption>
			                <colgroup>
			                    <col width="90px">
			                    <col width="185px">
			                    <col width="*">
			                    <col width="185px">
			                </colgroup>
			                <thead>
			                <tr>
			                    <th scope="col">번호</th>
			                    <th scope="col">구분</th>
			                    <th scope="col">제목</th>
			                    <th scope="col">등록일</th>
			                </tr>
			                </thead>
			                <tbody>					
					                <tr>
					                    <td>214</td>
					                    <td>단기렌터카</td>
					                    <td class="text-l pal0" onclick="location.href='${path}/serviceCenter/noticeDetail'">
					                    	 20년 제주 여름 성수기 기간 제휴할인율 변경 안내
					                    	<span class="ico ico-new">N</span>
					                    </td>
					                    <td>
											2020-07-24				                    
					                    </td>
					                </tr>
			                </tbody>
			            </table>						
            <!-- tb-cnt//end -->
        </div>
        <!-- notice-global-list//end -->
<!-- paging -->
<div class="paging">
		<a href="#" onclick="getPList(1, 10); return false;" class="first" title="첫 쪽으로 이동"></a>
		<a href="#none" class="prev" title="이전 쪽으로 이동"></a>
				<span><a href="#" class="selected" onclick="getPList(1, 10); return false;">1</a></span>
			
		<a href="#" onclick="getPList(2, 10); return false;" class="next" title="다음 쪽으로 이동"></a>
		
		<a href="#" onclick="getPList(22, 10); return false;" class="last" title="마지막 쪽으로 이동"></a>
		
	
</div>
<!-- //paging -->
        <!-- paging//end -->
    </div>
    <!-- container//end -->
</div>
</body>
</html>
</layoutTag:layout>