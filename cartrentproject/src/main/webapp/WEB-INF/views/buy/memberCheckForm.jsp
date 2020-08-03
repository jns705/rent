<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
      	<c:if test="${sessionScope.id != null and check == 0}">
      		<script type="text/javascript">
				location.href="/buy/short_rentList";
      		</script>
      	</c:if>
      	<c:if test="${sessionScope.id != null and check == 1}">
      		<script type="text/javascript">
				location.href="/counseling/userList";
      		</script>
      	</c:if>
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
<c:if test="${check == 1}"><c:set var="temp" value="장기"/></c:if>
<c:if test="${check == 0}"><c:set var="temp" value="단기"/></c:if>
<form action="/buy/short_rentProc" name="insertForm" method="get">
<div id="content">
    <div id="container">
        <div class="breadcrumbs">
            <h2 class="tit">${temp}렌터카 예약/확인<a href="#modal-login-global" class="btn-modal btn-tooltip" style="display:none;" id="reservLogin"></a></h2>
            <div class="clearfix">
                <span>홈</span>
                <span>${temp}렌터카</span>
                <span class="cl-point<c:if test="${check == 1}">2</c:if><c:if test="${check == 0}">1</c:if>">${temp}렌터카 예약/확인</span>
            </div>
        </div>
        <!-- breadcrumbs//end -->
        <c:if test="${check == 0}">
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
        </c:if>
        <c:if test="${check == 1}">
        <div class="tab-menu v1">
            <ul class="unlink tTab" id="reservMenu">
            	<li class="col-3">
                	<a href="/rent/NewRentList">신차 렌트카</a>
                </li>
                <li class="col-3">
                    <a href="/rent/rentList">중고차 렌트카</a>
                </li>
                <li class="col-3 selected" >
		           <a href="/buy/memberCheckForm?check=1">예약 확인</a>
                </li>
            </ul>
        </div>
        </c:if>
        <!-- tab-menu//end -->
        
      	<c:if test="${sessionScope.id == null}">
        <style>
        .reserve-check li {width: 430px;}
		</style>
      	<article>
            <div class="article-content">
                <div class="reserve-check">
                    <ul class="clearfix">
                        <li>
                            <p>회원으로 예약하셨나요?</p>
                            <span>로그인을 하시면 예약내역 확인이 가능합니다.</span>
				            	<a href="/member/loginForm" class="btn btn-color<c:if test="${check == 1}">2</c:if><c:if test="${check == 0}">1</c:if> btn-fix3 btn-large">회원 예약확인</a>
                        </li>
                        <li>
                            <p>비회원으로 예약하셨나요?</p>
                            <span>이름, 휴대폰 번호로 확인이 가능합니다.</span>
                            <a href="#modal-nomember-check" class="btn btn-color<c:if test="${check == 1}">2</c:if><c:if test="${check == 0}">1</c:if> btn-fix3 btn-large btn-modal" onclick="check();">비회원 예약확인</a>
                        </li>
                    </ul>
                </div>
            </div>
        </article>
        </c:if>

                
              </div>
          </div>
          
      </form>
      
<script type="text/javascript">
	function check(data){
		$('#modal-nomember-check').css('display','block');
		if(data == 'close') $('#modal-nomember-check').css('display','none');
	}

	function checka(data, data1){
		if(data == 'name'){
			if(!$('[name=name]').val()){
	        	$('#msg-nm').css('font-size','0px');
	        	$('[name=name]').css('border-color','');
	        	$('#msg-hpNo').css('font-size','0px');
	        	$('[name=tel]').css('border-color','');
	        	
		$('#msg-nm').css('font-size','15px');
    	$('#msg-nm').css('margin-top','10px');
    	$('[name=name]').css('border-color','#eb444b');
    	if(data1 == 'a')
        	$('[name=name]').css('border-color','#f68121');
		}
		}
		if(data == 'tel'){
        	$('#msg-nm').css('font-size','0px');
        	$('[name=name]').css('border-color','');
        	$('#msg-hpNo').css('font-size','0px');
        	$('[name=tel]').css('border-color','');
			
			if(!$('[name=tel]').val()){
    	$('#msg-hpNo').css('font-size','15px');
    	$('#msg-hpNo').css('margin-top','10px');
    	$('[name=tel]').css('border-color','#eb444b');
    	if(data1 == 'a')
        	$('[name=tel]').css('border-color','#f68121');
		}
		}
	}
</script>


        <c:if test="${check == 1}">
        <script type="text/javascript">

		//영역밖 클릭 시
		$('html').click(function(e) { 
			if(!$(e.target).hasClass("name")) { 
				if(!$(e.target).hasClass("btn-block")) { 
		        	$('#msg-nm').css('font-size','0px');
		        	$('[name=name]').css('border-color','');
				}
			} 
			if(!$(e.target).hasClass("tel")) { 
				if(!$(e.target).hasClass("btn-block")) { 
		        	$('#msg-hpNo').css('font-size','0px');
		        	$('[name=tel]').css('border-color','');
				}
			} 
		});


        //전체 유효성 검사
        function goConfirm(){
        if(!$('[name=name]').val()){
			checka('name')
        	return false;
        }
        if(!$('[name=tel]').val()){
			checka('tel')
	        	return false;
        } 

    	
        $('#myform').attr("action", "/member/checkId1");
        myform.submit();
        }	
        </script>
        </c:if>
        <c:if test="${check == 0}">
        <script type="text/javascript">
        function goConfirm(){ 
            if(!$('[name=name]').val()){
    			checka('name','a')
            	return false;
            }
            if(!$('[name=tel]').val()){
    			checka('tel','a')
    	        return false;
            } 

            myform.submit(); 
        }


        </script>
        </c:if>
        
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
                        <label><input type="text" placeholder="이름을 입력해주세요." class="onlyKorEng name" name="name" id="nm" onfocus="checka('name' <c:if test="${check!=1}">, 'a'</c:if>);" ></label>
                    </span>
                    <span style="color:<c:if test="${check == 1}">#eb444b !important;</c:if>" class="msg-txt 	cl-point1" id="msg-nm">이름을 입력해주세요.</span>
                    </div>
                    <div class="input-row">
                    <span class="input essential input-large" id="span-hpNo">
                        <strong class="check">필수</strong>
                        <label><input type="number" placeholder="휴대폰 번호를 입력해주세요.(-생략)" class="onlyNumber tel" name="tel" id="hpNo" onfocus="checka('tel' <c:if test="${check!=1}">, 'a'</c:if> );"></label>
                    </span>
                    <span style="color:<c:if test="${check == 1}">#eb444b !important;</c:if>"  class="msg-txt cl-point1" id="msg-hpNo">휴대폰 번호를 입력해주세요.</span>
                    </div>
                </div>
                <div class="btn-box" id="div-btn">
                    <button type="button" class="btn btn-color<c:if test="${check == 1}">2</c:if><c:if test="${check == 0}">1</c:if> btn-large btn-block" onclick="goConfirm();">예약확인</button>
                </div>
            </article>
        </form>
    </div>
    <!-- modal-box//end -->
</div>
<style>
.modal-pop {
	position:fixed;
	box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px, rgba(0,0,0,0.5) 2px 2px 3px 3px;
	z-index : 10000;
}

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