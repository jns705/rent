<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<head>
<style>
th{text-align: center;}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <meta charset="UTF-8">
    <title>솔렌터카</title>
</head>



<form action="/buy/short_rentProc" name="insertForm" method="get">
<div id="content">
    <div id="container">
        <div class="breadcrumbs">
            <h2 class="tit">단기렌터카 예약/확인<a href="#modal-login-global" class="btn-modal btn-tooltip" style="display:none;" id="reservLogin"></a></h2>
            <div class="clearfix">
                <span>홈</span>
                <span>단기렌터카</span>
                <span>단기렌터카 예약/확인</span>
            </div>
        </div>
        <!-- breadcrumbs//end -->
        <div class="tab-menu v1">
            <ul class="unlink tTab" id="reservMenu">
                <li class="col-3 ">
                	<a href="/rent/rentcar/short_rent_reservation_new_jeju.do">제주예약</a>
                </li>
                <li class="col-3">
                    <a href="/rent/rentcar/short_rent_reservation_new.do">내륙예약</a>
                </li>
                <li class="col-3 selected" >
		            	<a href="/rent/rentcar/short_rent_reservation_confirm.do">예약확인</a>
                </li>
            </ul>
        </div>
        <!-- tab-menu//end -->
        <div class="tab-reservation-step">
            <ul class="clearfix">
                <li class="fl col-3 complete">
                    <span>
                        <strong>1</strong>
                        <span>예약/약관동의</span>
                    </span>
                </li>
                <li class="fl col-3 complete">
                    <span>
                        <strong>2</strong>
                        <span>할인/결제</span>
                    </span>
                </li>
                <li class="fl col-3 ing">
                   <span>
                       <strong>3</strong>
                       <span>예약/결제완료</span>
                   </span>
                </li>
            </ul>
        </div>
        <!-- tab-reservation-step//end -->
                <article>                
                	<div class="header-group">
                        <h3>예약 확인 <p><span class="cl-point1">기간·지점·차량</span>은 순서와 관계없이 <span class="cl-point1">선택 예약이 가능</span>합니다.</p></h3><!-- 20180402 -->
                    </div>
                        	<table class="table table-hover table-striped">
                        		<tr>
                        			<th>고객 아이디</th>
                        			<th>고객 이름</th>
                        			<th>차량 이름</th>
                        			<th>출발 지점</th>
                        			<th>반납 지점</th>
                        			<th>시작 날짜</th>
                        			<th>반납 날짜</th>
                        			<th>신청 날짜</th>
                        			<th>신청 현황</th>
                        		</tr>
                        		<c:forEach items="${Buy}" var="Buy" varStatus="status">
                        		<tr class="tr" align="center">
                        			<td style="vertical-align: middle;">${Buy.id}</td>
                        			<td style="vertical-align: middle;">${Buy.name}</td>
                        			<td style="vertical-align: middle;">${Car[status.index].car_name}</td>
                        			<td style="vertical-align: middle;">${SRent[status.index].start_location}</td>
                        			<td style="vertical-align: middle;">${SRent[status.index].end_location}</td>
                        			<td style="vertical-align: middle;">${SRent[status.index].start_date}<br><span class="cl-point1">${SRent[status.index].start_time}</span></td>
                        			<td style="vertical-align: middle;">${SRent[status.index].end_date}<br><span class="cl-point1">${SRent[status.index].end_time}</span></td>
                        			<td style="vertical-align: middle;"><fmt:formatDate value="${Buy.buy_date}" var="date" pattern="yyyy-MM-dd"/>${date}</td>
                        			<td style="vertical-align: middle;">${situation[status.index]}</td>
                        		</tr>
                       			</c:forEach>
                        	</table>
                </article>
                
              </div>
          </div>
      </form>

</body>
</html>
</layoutTag:layout>