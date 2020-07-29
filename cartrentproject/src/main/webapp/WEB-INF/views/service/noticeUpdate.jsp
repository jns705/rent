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
<style type="text/css">
select {
	width: 200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
 }
</style>
</head>
<body>

<div id="content">
    <div id="container">
        <div class="breadcrumbs">
            <h2 class="tit">공지사항 수정</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>고객센터</span>
                <span class="cl-bold">공지사항 수정</span>
            </div>
        </div>
        <!-- breadcrumbs//end -->
        <div class="view-type v2">
            <div class="view-header">
                <h4><span class="cl-point1">
					<select name="division" id="division">
						<option value="공통">공통</option>
						<option value="장기렌터카">장기렌터카</option>
						<option value="단기렌터카">단기렌터카</option>
					</select>					
                </span> <input type="text" class="form-control" id="subject" name="subject" value="제목"> </h4><!-- 이벤트 카테고리가 지점일 경우 cl-point5, 특별일 경우 cl-point2, 장기렌터카일 경우 cl-point2 -->
                <span class="time">2020-07-28 등록날짜</span>
            </div>
            <!-- view-header//end -->
            <div class="view-content">
                 <textarea class="form-control" rows="10" id="content" name="content">내용</textarea>
            </div>
            <!-- view-content//end -->
            
            
        </div>
        <!-- view-type//end -->
        <div class="btn-box text-c">
       		<a href="#" class="btn btn-danger btn-fix3 btn-large">수정</a>
            <a href="${path}/serviceCenter" class="btn btn-primary btn-fix3 btn-large">목록</a>
        </div>
        <!-- btn-box//end -->
    </div>
    <!-- container//end -->
</div>

</body>
</html>
</layoutTag:layout>