<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 페이지</title>
<%@ include file="serviceHeader.jsp" %>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
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
        <!-- 페이징 -->
		<form name="frm" id="frm" action="/rent/custcnte/notice/notice_list.do" method="get">
        	<input type="hidden" id="pageNo" name="pageNo" value="1">
        	<input type="hidden" id="rowPerPage" name="rowPerPage" value="10">
        	<input type="hidden" id="schWord" name="schWord" value="">
        	<input type="hidden" id="schKind" name="schKind" value="">
        	<input type="hidden" id="searchBoardSeqNo" name="searchBoardSeqNo" value="">
        </form>
        <!-- breadcrumbs//end -->
        <div class="view-type v2">
            <div class="view-header">
                <h4><span class="cl-point1">[공통] 구분</span> 제목 </h4><!-- 이벤트 카테고리가 지점일 경우 cl-point5, 특별일 경우 cl-point2, 장기렌터카일 경우 cl-point2 -->
                <span class="time">2020-07-28 등록날짜</span>
            </div>
            <!-- view-header//end -->
            <div class="view-content">
            	내용
                <p>안녕하세요.<br>SK렌터카를 이용해주시는 고객 여러분께 감사 드립니다. </p><p>&nbsp;</p><p>시스템 점검 작업으로 인해 아래와 같이 서비스가 일시 중단됨을 알려드립니다.<br>해당 작업은 상황에 따라서 중단 시간과 범위는 변경될 수 있습니다.</p><p>&nbsp;</p><p>=============================================================</p><p>&nbsp;</p><p><span style="color: rgb(255, 0, 0);">[ 중단 일시 ]</span></p><p><span style="color: rgb(255, 0, 0);">- 1차 : 2020년 7월 31일(금) 21:00 ~ 8월 1일(토) 07:00<br>- 2차 : 2020년 8월 5일(수) 21:00 ~ 8월 6일(목) 07:00</span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(255, 0, 0);"><br></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(255, 0, 0);">[ 중단 내용 ]</span></span></p><p><span style="color: rgb(255, 0, 0);">SK렌터카 시스템&nbsp;통합에 따른&nbsp;점검 작업</span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(255, 0, 0);"><br></span></span></p><p><span style="color: rgb(255, 0, 0);"><span style="color: rgb(255, 0, 0);">[ 중단 범위 ]</span></span></p><p><span style="color: rgb(255, 0, 0);">전체 서비스 이용 불가</span></p><p>&nbsp;</p><p>* 기타 문의 사항 :&nbsp; SK렌터카 고객센터 (1599-9111)</p><p>&nbsp;</p><p>=============================================================</p><p>&nbsp;</p><p>서비스 이용에 불편을 끼쳐드려 대단히 죄송합니다. <br>보다 안정적이고 편리한 서비스 제공을 위하여 더욱 노력하는 SK렌터카가 되겠습니다.</p><p>감사합니다.&nbsp;</p><p>&nbsp;</p>
            </div>
            <!-- view-content//end -->
            
            <!-- view-paging//end -->
            <!-- view-paging//end -->
            
        </div>
        <!-- view-type//end -->
        <div class="btn-box text-c">
        	<c:if test="${sessionScope.id eq 'master'}">
        		<a href="${path}/serviceCenter/noticeUpdateForm" class="btn btn-danger btn-fix3 btn-large">수정</a>
        	</c:if>
            <a href="${path}/serviceCenter" class="btn btn-default btn-fix3 btn-large">목록</a>
        </div>
        <!-- btn-box//end -->
    </div>
    <!-- container//end -->
</div>

</body>
</html>
</layoutTag:layout>