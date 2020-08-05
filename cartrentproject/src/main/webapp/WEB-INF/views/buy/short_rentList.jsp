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
<link rel="stylesheet" href="http://localhost:8082/static/css/ss.css" type="text/css" /> 
<link rel="stylesheet" href="http://localhost:8082/static/css/total.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <meta charset="UTF-8">
    <title>솔렌터카</title>
</head>



<form action="/buy/short_rentProc" name="insertForm" method="get">
<div id="content">
    <div id="container"  style="margin-top:40px;">
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
                	<a href="/counseling/short_rent?sL=제주지점">제주예약</a>
                </li>
                <li class="col-3">
                    <a href="/counseling/short_rent">내륙예약</a>
                </li>
                <li class="col-3 selected" >
		            	<a href="/buy/short_rentList">예약확인</a>
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
                       <span>예약/결제완료</span>
                   </span>
                </li>
            </ul>
        </div>
        <!-- tab-reservation-step//end -->
<style>
th{
 border-left: none !important;
 }
 
 td{
 	border-bottom: 1px solid #ddd;
 }
</style>
                 <article>                
                		<div class="header-group">
                        <h3>예약 확인 <p><span class="cl-point1">기간·지점·차량</span>은 순서와 관계없이 <span class="cl-point1">선택 예약이 가능</span>합니다.</p></h3><!-- 20180402 -->
                    </div>
                    <table class="tb-cnt cnt-center">
                <caption><span class="cl-point1">${sessionScope.id}</span>님 상담 리스트</caption>
                <thead>
                <tr>
                 			<th  style="border-left: none;">고객 아이디</th>
                 			<th  style="border-left: none;">고객 이름</th>
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
            <div class="under-tab">
                <ul class="list-info v1">
                    <li>대여자격 기준에 적합하지 않은 면허증을 소지하신 경우 대여가 취소 될 수 있으니 이점 유념하여 주시기 바랍니다.</li>
                    <li>대여 당일 운전면허증 미 지참 시 차량 대여가 불가하오니, 꼭 지참 후 방문부탁드립니다.</li>
                    <li>상담 신청 후 24시간 이내로 유선연락이 가오니 이점 유념하여 주시기 바랍니다.</li>
                </ul>
            </div>
                </article>
                
              </div>
          </div>
          
      </form>
      
<script type="text/javascript">
	function check(data){
		$('#modal-nomember-check').css('display','block');
		if(data == 'close') $('#modal-nomember-check').css('display','none');
	}

	function goConfirm(){
		myform.submit();
	}
</script>
      <div id="modal-nomember-check" class="modal-pop" style="display: none;">
    <div class="modal-box">
        <div class="modal-header">
            <a href="#" id="closeaa" class="modal-close" onclick="check('close');">레이어 닫기</a>
            <h3>비회원 예약확인 </h3>
        </div>
        <!-- modal-header//end -->
        <form name="myform" id="myform" method="post" action="/member/checkId">
            <article>
                <p class="text-c">등록하신 이름, 휴대폰 번호를 입력 하시면 확인 가능합니다.</p>
                <div class="input-field field-large">
                    <div class="input-row">
                    <span class="input essential input-large" id="span-nm">
                        <strong class="check">필수</strong>
                        <label><input type="text" placeholder="이름을 입력해주세요." class="onlyKorEng" name="name" id="nm" onkeyup="nmTest();"></label>
                    </span>
                    <span class="msg-txt cl-point1" id="msg-nm">이름을 입력해주세요.</span>
                    </div>
                    <div class="input-row">
                    <span class="input essential input-large" id="span-hpNo">
                        <strong class="check">필수</strong>
                        <label><input type="number" placeholder="휴대폰 번호를 입력해주세요.(-생략)" class="onlyNumber" name="tel" id="hpNo" onkeyup="hpNoTest();"></label>
                    </span>
                    <span class="msg-txt cl-point1" id="msg-hpNo">휴대폰 번호를 입력해주세요.</span>
                    </div>
                </div>
                <div class="btn-box" id="div-btn">
                    <button type="button" class="btn btn-color1 btn-large btn-block" onclick="goConfirm();">예약확인</button>
                </div>
            </article>
        </form>
    </div>
    <!-- modal-box//end -->
</div>
<style>
.inputt{
	width: 500;
    height: 50;
    padding: 10px 20px;
    border: 1px solid #ddd;
}
</style>
</body>
</html>
</layoutTag:layout>