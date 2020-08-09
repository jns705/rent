<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date" scope="request" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true" scope="request" />

<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<style>
.inputTime{
    padding-left: 10px;
	text-align:center !important;
	font-size:17px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-right:none;
    height: 42px;
    border-radius: 0;
}
</style>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
<%@ include file="service/serviceHeader.jsp" %>
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
        <form name="frm" id="frm" action="#" method="get">
            <div class="notice-search-field clearfix">

                <div class="input-field fr">
                    <div class="input-row clearfix" style="width:501px;">
                        <span class="select-box fl">
							<select id="schKind" name="moKind" class="option01 inputTime" tabindex="-1" aria-hidden="true">
								<option value="전체"  <c:if test="${moKind eq '전체' || moKind eq null}">selected="selected"</c:if>>전체</option>
								<option value="제목"  <c:if test="${moKind eq '제목'}">selected="selected"</c:if>>제목</option>
								<option value="내용"  <c:if test="${moKind eq '내용'}">selected="selected"</c:if>>내용</option>
							</select>
                        </span>
                        <span class="input fl">
                            <label><input id="schWord" name="moVal" type="text" value="" placeholder="검색어를 입력해 주세요."></label>
                        </span>
                        <button class="btn btn-default btn-fix1 fr" onclick="getClientNoticeList();" style="background-color: F68121;">검색하기</button>
                        <c:if test="${sessionScope.id eq 'master'}">
                        <button class="btn btn-default btn-fix1 fr" onclick="getClientNoticeList();">작성하기</button>
                        </c:if>	
                        
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
				                <c:forEach items="${list}" var="list" varStatus="status">
					                <tr>
					                    <td>${SSize - status.index - (showNum*(number-1))}</td>
					                    <td>${list.division}</td>
					                    <td class="text-l pal0" onclick="location.href='${path}/serviceCenter/noticeDetail/${list.no}?number=${index}&moVal=${moVal}&moKind=${moKind}'">
					                    	 ${list.subject}
					                    <!-- 날짜를 계산하기 위한 수치화 -->
										<fmt:parseNumber var="reg_date" value="${list.reg_date.time / (1000*60*60*24)}" integerOnly="true"/>
				                    	 <!-- 7일 전이면 N을 붙인다 -->
				                    	 <c:if test="${today < reg_date + 8}"> 
				                    	 <span class="ico ico-new">N</span> 
				                    	 </c:if>
					                    </td>
					                    <td>${list.reg_date}</td>
					                </tr>
				                    </c:forEach>
			                </tbody>
			            </table>						
            <!-- tb-cnt//end -->
        </div>
        <!-- notice-global-list//end -->
<!-- paging -->
<div class="paging">
		<a href="/serviceCenter?number=1&moVal=${moVal}&moKind=${moKind}"class="first" title="첫 쪽으로 이동"></a>
		<c:if test="${startNum == 1}"> <c:set var="sn" value="1"/> </c:if>
		<c:if test="${startNum != 1}"> <c:set var="sn" value="${startNum-listNum}"/> </c:if>
		<a href="/serviceCenter?number=${sn}&moVal=${moVal}&moKind=${moKind}" class="prev" title="이전 쪽으로 이동"></a>
		
		<c:forEach begin="${startNum}" end="${startNum + listNum-1}" var="index">
			<c:if test="${pagingSize >= index}">
				<span><a href="/serviceCenter?number=${index}&moVal=${moVal}&moKind=${moKind}" class="<c:if test="${number==index }">selected</c:if> " >${index}</a></span>
			</c:if>
		</c:forEach>
			
		<c:if test="${SSize/listNum < startNum +1}"> <c:set var="sn" value="${pagingSize}"/> </c:if>
		<c:if test="${SSize/listNum > startNum +1}"> <c:set var="sn" value="${startNum+listNum}"/> </c:if>
		<c:if test="${SSize/listNum <= listNum}"> <c:set var="sn" value="${pagingSize}"/> </c:if>
		<a href="/serviceCenter?number=${sn}&moVal=${moVal}&moKind=${moKind}" class="next" title="다음 쪽으로 이동"></a>
		 
		<a href="/serviceCenter?number=${pagingSize}&moVal=${moVal}&moKind=${moKind}" onclick="getPList(22, 10); return false;" class="last" title="마지막 쪽으로 이동"></a>
		
	
</div>
<!-- //paging -->
        <!-- paging//end -->
    </div>
    <!-- container//end -->
</div>
</body>
</html>
</layoutTag:layout>