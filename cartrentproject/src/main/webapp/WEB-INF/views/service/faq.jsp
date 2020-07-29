	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>

<%//DB안만들고 script, jquery 로구현 %>

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
        	
            <div class="question-search-field clearfix">
                <div class="fl">
                    <a href="/serviceCenter/customerConsultation" class="btn btn-line4 btn-fix125">고객상담</a>
                </div>
            </div>
		        
	        <div class="accordion-type">
					
					<!-- a1 a2...선택시 selected 와 block를 넣어주기 위한 class 이름 -->
					<!-- p1 p2... 페이징을 위한 class 이름 -->  
					
					<!-- 1111111111111111111111111111111111111111111111111111111111111 -->      	        
		            <div class="list a1"> <!-- 선택되면 list 옆에 selected <-생김 -->
		            
		            <!-- 페이징 1 제목 -->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a1');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>유류비 환불은 몇 일이 소요되나요?</strong>
		                    </a>
		                </div>
		            <!-- 페이징 1 제목 -->
		                		            
					<!-- 페이징 2 제목 -->
		                <div class="subject p2 hidden">
		                    <a href="#none" onclick="selectList('a1');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>금연 차량을 대여하고 싶습니다</strong>
		                    </a>
		                </div>
		            <!-- 페이징 2 제목 -->
		            
		           <!-- 페이징 3 제목 -->
		                <div class="subject p3 hidden">
		                    <a href="#none" onclick="selectList('a1');">
		                        <span class="cl-point1">[다이렉트]</span>
		                        <strong>신용심사는 어떻게 받아야 하나요?</strong>
		                    </a>
		                </div>
		            <!-- 페이징 3 제목 -->
		                
		               
		                <div class="notice a1a" style="display: none;"> <!--  none는 닫힘 block 열림 -->
		                
		                <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p><img src="https://image.speedmate.com/rentcar/real/notice/20200402_faq.png">&nbsp; </p>
		                    </div>
		                <!-- 페이징 1 내용-->
		                      		                
		                <!-- 페이징 2 내용-->
		                    <div class="word p2 hidden">
		                        <p><img src="https://image.speedmate.com/speedimg/rentcar/real/notice/200306_faq04.png"></p>
		                    </div>
		                <!-- 페이징 2 내용-->  
		                
		                <!-- 페이징 3 내용-->
		                    <div class="word p3 hidden">
		                        <p></p><p>SK렌터카 계약 앱에서 정보제공동의 / 이름, 주민번호 입력 후 아래 기관에 신용정보를 조회하며,&nbsp; 공인인증서 인증 및 safekey 발급이 필요합니다. 해당 정보는 조회를 위해서만 사용되며 저장되지 않습니다.<br>&nbsp;&nbsp;</p><p>&nbsp; &nbsp;&nbsp; -&nbsp; 민원24 : 주민등록등본 <br>&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; 홈텍스 : 납세내역, 소득증명, 사업자등록 <br>&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; 건강보험관리공단 : 자격득실내역<br>&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; 경찰청 : 운전면허증&nbsp;</p><p></p>
		                    </div>
		                <!-- 페이징 3 내용-->  
		                
		                </div>
		            </div>
		            <!-- 22222222222222222222222222222222222222222222222222222222222222 -->
		            <div class="list a2">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a2');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>분실물(유실물) 발생 시 어떻게 해야 하죠?</strong>
		                    </a>
		                </div>
		             <!-- 페이징 1 제목-->  
		             
		             <!-- 페이징 2 제목-->
		             <div class="subject p2 hidden">
		            	 <a href="#none" onclick="selectList('a2');">
		             		<span class="cl-point1">[단기]</span>
		             	 	<strong>반려동물과 동승이 가능한가요?</strong>
		              	</a>
		             </div>
		             <!-- 페이징 2 제목-->
		               
		             <!-- 페이징 3 제목-->
		             <div class="subject p3 hidden">
		            	 <a href="#none" onclick="selectList('a2');">
		             		<span class="cl-point1">[다이렉트]</span>
		             	 	<strong>선수금 조건으로는 다이렉트 계약이 불가한가요?</strong>
		              	</a>
		             </div>
		             <!-- 페이징 3 제목--> 
		             
		                <div class="notice a2a" style="display: none;">
		                
		               <!-- 페이징 1 내용-->  
		                    <div class="word p1">
		                        <p></p><p><strong><span style="color: rgb(0, 0, 0);">[분실물 확인 요청 방법]</span></strong></p><p>&nbsp;</p><p>단기렌터카를 대여한 지점으로 즉시 연락하여 확인 요청<br>* 예약자명, 반납일자, 차종, 차량번호를 확인해주시면 빠른 확인이 가능합니다.</p><p>&nbsp;</p><p>※ 분실 시 책임 및 보상이 불가하니,&nbsp; 반드시 차량 반납 전 두고내리시는 물건이 없는 지 꼭! 확인 부탁드립니다.&nbsp;</p><p></p>
		                    </div>
		               <!-- 페이징 1 내용--> 
		               
		               <!-- 페이징 2 내용--> 
						<div class="word p2 hidden">
							<p></p><p>SK렌터카에서는 다른 이용 고객에게 위해(알레르기 등)를 끼칠 우려가 있어 반려동물의 동승을 허용하지 않는 점 양해부탁드립니다.&nbsp;</p><p></p>
		                </div>   
		               <!-- 페이징 2 내용--> 
		               
		               <!-- 페이징 3 내용--> 
		                <div class="word p3 hidden">
		                  	<p></p><p>선수금 조건계약은 다이렉트 계약은 현재 불가하며 추후 검토 예정입니다.&nbsp;</p><p></p>
		                </div>
		               <!-- 페이징 3 내용--> 
		                       
		                    
		                </div>
		            </div>
		            
		            <!-- 3333333333333333333333333333333333333333333333333 -->
		            <div class="list a3">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a3');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong> 비회원 예약 확인/취소 방법이 궁금해요.</strong>
		                    </a>
		                </div>
		             <!-- 페이징 1 제목-->  
		             
		             <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a3');">
							<span class="cl-point1">[다이렉트]</span>
		                   <strong>기본정비 포함 항목이 무엇인가요?</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a3');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>필수 옵션 금액은 렌탈료에 포함되어 있는 건가요?</strong>
						</a>
					</div>
		             <!-- 페이징 3 제목-->  
		             
		                <div class="notice a3a" style="display: none;">
		                
		                 <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p> <img src="https://image.speedmate.com/speedimg/rentcar/real/notice/200306_faq01.png"></p>
		                    </div>
		                 <!-- 페이징 1 내용-->
		                 
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p><img src="https://image.speedmate.com/speedimg/rentcar/real/notice/basic_img.png"></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>차량 트림별 필수 옵션 금액은 렌탈료에 포함되며, 추가 선택 옵션 지정 시 렌탈료가 추가됩니다.<br>(견적내기 화면 하단에 실시간 가격이 표시됩니다.)&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                    
		                </div>
		            </div>
		            
		            <!-- 4444444444444444444444444444444444444444444444 -->
		            <div class="list a4">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a4');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>대여지점과 반납지점이 다를 경우 어떻게 해야하나요?</strong>
		                    </a>
		                </div>
		             <!-- 페이징 1 제목-->
		             
		            <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a4');">
							<span class="cl-point1">[단기]</span>
		                    <strong>일정이 변경되어 예약을 변경하고 싶어요.</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a4');">
							 <span class="cl-point1">[다이렉트]</span>
		                     <strong>SK렌터카 앱에서는 계약이 불가한가요?</strong>
						</a>
					</div>
		            <!-- 페이징 3 제목-->  
		             
		                <div class="notice a4a" style="display: none;">
		                
		                 <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p></p><p>SK렌터카 내륙지점 이용 시 사전 예약을 통해 '편도 반납서비스' 이용이 가능합니다.</p><p>&nbsp;</p><p>※ 단, 현행 관계법 상 차량 등록 지역 외 대여 영업을 할 수 없어 편도 반납 시 회차 거리에 따른 편도수수료가 별도 부과됩니다.</p><p>&nbsp;</p><p>자세한 사항은 SK렌터카 고객센터(1599-9111)로 문의 주시면 친절히 안내해 드리겠습</p>니다. <p>&nbsp;</p><p>예시 : 서울 서대문지점에서 차량 대여 후 부산지점에 차량 반납 가능 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (회차 거리에 따른 편도수수료 발생)&nbsp;</p><p></p>
		                    </div>
		                 <!-- 페이징 1 내용-->
		                
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p></p><p>예약 변경은 SK 렌터카 홈페이지에서 변경을 원하시는 일정에 차량 대여 가능 여부 확인 후 재 예약으로 진행해주셔야 하며,</p><p>재 예약 진행 후 기존 예약 내역은 취소 부탁드립니다.</p><p>실시간으로 예약이 진행되고 있어 재 예약 진행 시 반드시 이용 가능 여부를 먼저 확인 부탁드립니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>SK렌터카 앱에서 견적내기 후 SK렌터카 계약앱에서 계약 진행이 가능합니다. <br>(SK렌터카 계약앱 다운로드 안내 SMS가 발송됩니다.)&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                
		                 
		                </div>
		            </div>
		            
		            <!-- 555555555555555555555555555555555555555555555555555 -->
		            <div class="list a5">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a5');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>전 연령 차량도 대여 할 수 있나요?</strong>
		                    </a>
		                </div>
		             <!-- 페이징 1 제목-->  
		             
		            <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a5');">
					       <span class="cl-point1">[단기]</span>
		                   <strong>회원 예약 확인/취소 방법이 궁금해요.</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a5');">
							 <span class="cl-point1">[다이렉트]</span>
		                     <strong>차량 출고까지 얼마나 걸리나요?</strong>
						</a>
					</div>
		             <!-- 페이징 3 제목-->    
		                
		                <div class="notice a5a" style="display: none;">
		                
		                <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p></p><p>SK렌터카는 전 연령차량은 보유 및 대여하고 있지 않습니다. </p><p>차량 사고는 자칫 인명 피해로 이어질 수 있어 고객의 안전을 위해 차종 별 대여 가능 자격을 규정하였으며, 차량 별 대여자격은 'SK렌터카 홈페이지&gt;단기렌터카&gt;단기렌터카안내&gt;'대여자격'에서 확인하실 수 있습니다.&nbsp;</p><p></p>
		                    </div>
		                <!-- 페이징 1 내용-->    
		                
		                		                 
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p>  <img src="https://image.speedmate.com/speedimg/rentcar/real/notice/200306_faq02.png"></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>SK렌터카 온라인/모바일 접속 &gt; MY렌터카 &gt;발주현황 &gt; 탁송예정일 확인<br>&nbsp;* 발주현황 확인은 계약이 완료된 이후부터 확인가능합니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                
		                    
		                </div>
		            </div>
		            
		            <!-- 6666666666666666666666666666666666666666666666666666666666 -->
		            <div class="list a6">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a6');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>제2운전자 등록은 어떻게 하나요?</strong>
		                    </a>
		                </div>
		             <!-- 페이징 1 제목-->
		             
		            <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a6');">
							<span class="cl-point1">[단기]</span>
		                    <strong>단기렌터카 예약은 어떻게 하나요?</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a6');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>견적 취소는 어떻게 하나요?</strong>
						</a>
					</div>
		            <!-- 페이징 3 제목-->  
		             
		                <div class="notice a6a" style="display: none;">
		                
		                <!-- 페이징 1 내용--> 
		                    <div class="word p1">
		                        <p></p><p><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; mso-bidi-font-family: 굴림; mso-ansi-language: EN-US; mso-fareast-language: KO; mso-bidi-language: AR-SA;">제2운전자 등록은 예약/결제 완료 후 별도 알림톡 또는 문자로 안내됩니다. </span></p><p></p>
		                    </div>
		                 <!-- 페이징 1 내용-->   
		                 		                 
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p> <img src="https://image.speedmate.com/speedimg/rentcar/real/notice/200306_faq03.png"></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>유효기간은 견적 작성일로부터 15일 이며, 계약 미진행 시 자동 삭제됩니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                  
		                </div>
		            </div>
		            <!-- 7777777777777777777777777777777777777777777777777777777777777777 -->
		            <div class="list a7">
		            
		         	 	<!-- 페이징 1 내용-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a7');">
		                        <span class="cl-point1">[단기]</span>
		                        <strong>유아용품을 대여하려면 어떻게 해야 하나요?</strong>
		                    </a>
		                </div>
		           		<!-- 페이징 1 내용-->
		           		
		            <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a7');">
							<span class="cl-point1">[단기]</span>
		                    <strong>주중/주말 대여료 적용 기준이 궁금합니다.</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a7');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>로그인 해야지만 견적이 가능한가요?</strong>
						</a>
					</div>
		             <!-- 페이징 3 제목-->  
		           
		                <div class="notice a7a" style="display: none;">
		                
		                <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p></p><p>유아용품은 SK렌터카 제주지점 이용 시에만 대여 가능합니다.</p><p>&nbsp;</p><p>'카시트/유모차 등의 유아용품은 협력업체인 "제주아이"(<a href="http://www.jeju-i.com">http://www.jeju-i.com</a>)를 통해 예약이 가능합니다.</p><p>&nbsp;</p><p>유아용품 예약문의 : 제주아이 (☏ 064-748-7799)</p><p>&nbsp;</p><p></p>
		                    </div>
		                <!-- 페이징 1 내용-->
		                
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p></p><p>.<img src="https://image.speedmate.com/rentcar/real/notice/200224_faq.jpg"></p><p></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>렌탈료 견적산출을 위해 회원가입이 필요합니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                
		                </div>
		            </div>
		            
		            <!-- 8888888888888888888888888888888888888888888888888888888888888888888 -->
		            <div class="list a8">
		            
		            <!-- 페이징 1 제목 -->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a8');">
		                        <span class="cl-point1">[다이렉트]</span>
		                        <strong>사고가 나면 수리는 어떻게 진행되나요?</strong>
		                    </a>
		                </div>
		            <!-- 페이징 1 제목 -->
		            
		           <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a8');">
						   <span class="cl-point1">[다이렉트]</span>
		                   <strong>견적 저장 후 확인은 어떻게 하나요?</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a8');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>수입차는 렌트 안되나요?</strong>
						</a>
					</div>
		            <!-- 페이징 3 제목-->  
		                
		                <div class="notice a8a" style="display: none;">
		                
		                <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p></p><p><strong>사고시 수리진행 순서</strong></p><p><strong><br></strong></p><p>1. 사고접수 (고객센터 : 1599-9111)</p><p>2. 담당자 배정</p><p>3. 공장 입고</p><p>4. 선견적 및 사고 부위 확인</p><p>5. 수리 승인</p><p>6. 수리 완료</p><p>7. 회수 요청</p><p>8. 면책금 납부 확인 (국산차 : 30만원 / 수입차 : 50만원)</p><p>9. 고객인도</p><p>&nbsp;</p><p>※ 면책금 미납부시 출고 진행이 어렵습니다. </p><p>&nbsp;</p><p></p>
		                    </div>
		                <!-- 페이징 1 내용-->  
		                		                 
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p></p><p>SK렌터카 로그인 후 MY렌터카에서 견적확인을 하실 수 있습니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	<p></p><p>수입차는 추후 추가할 예정입니다.&nbsp;</p><p>&nbsp;</p><p>수입차&nbsp;구매문의는 아래 페이지에 남기시면 연락드리겠습니다.</p><p><a href="${path}/serviceCenter/customerConsultation">http://localhost:8082/serviceCenter/customerConsultation</a></p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                    
		                </div>
		            </div>
		            
		            <!-- 999999999999999999999999999999999999999999999999999999999999999999999999 -->
		            <div class="list a9">
		            
		             <!-- 페이징 1 제목-->
		                <div class="subject p1">
		                    <a href="#none" onclick="selectList('a9');">
		                        <span class="cl-point1">[다이렉트]</span>
		                        <strong>사고시 면책금은 얼마인가요?</strong>
		                    </a>
		                </div>
		              <!-- 페이징 1 제목-->   
		              
		           <!-- 페이징 2 제목--> 
					<div class="subject p2 hidden">
						<a href="#none" onclick="selectList('a9');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>핫딜 차량만 따로 모아서 볼 수는 없나요?</strong>
						</a>
					</div>
		             <!-- 페이징 2 제목-->  
		             
		             <!-- 페이징 3 제목--> 
		            <div class="subject p3 hidden">
						<a href="#none" onclick="selectList('a9');">
							<span class="cl-point1">[다이렉트]</span>
		                    <strong>자동차 견적은 어떻게 받아볼 수 있나요?</strong>
						</a>
					</div>
		            <!-- 페이징 3 제목-->  
		                
		                <div class="notice a9a" style="display: none;">
		                
		                 <!-- 페이징 1 내용-->
		                    <div class="word p1">
		                        <p></p><p>차종이 상관없이 사고건당 납부금액 입니다.</p><p>&nbsp;</p><p>국산차 : 사고건당 30만원</p><p>수입차 : 사고건당 50만원</p><p>&nbsp;</p><p>&nbsp;</p><p></p>
		                    </div>
		                 <!-- 페이징 1 내용--> 
		                 		                 
		                  <!-- 페이징 2 내용--> 
		                   	<div class="word p2 hidden">
		                   		<p></p><p>원하시는 키워드를 AI검색창에 입력하시면 차량정보를 확인 하실 수 있습니다.&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 2 내용--> 
		                   
		                  <!-- 페이징 3 내용--> 
		                    <div class="word p3 hidden">
		                    	 <p></p><p>1. SK렌터카 온라인/모바일 접속<br>2. 회원가입 또는 기존고객 로그인(렌탈료 견적산출을 위해 회원가입 및 로그인 필요)<br>3. Car&amp;Life 배너에서 다이렉트 견적 아이콘 클릭<br>4. A.I 추천 또는 차량 직접 선택 클릭 후 검색<br>5. 원하시는 차량과 트림을 정하시고 견적내기 클릭<br>&nbsp;&nbsp; (상세차량 및 옵션선택, 렌트조건을 선택 시 하단에 월렌탈료 실시간 확인 가능)&nbsp;</p><p></p>
		                    </div>
		                  <!-- 페이징 3 내용-->  
		                    
		                </div>
		            </div>
		            
	        </div>
	        
	        <div class="paging">
				<span><a href="#" class="p paging1 selected" onclick="getPList('paging1');">1</a></span>
				<span><a href="#" class="p paging2" onclick="getPList('paging2');">2</a></span>
				<span><a href="#" class="p paging3" onclick="getPList('paging3');">3</a></span>
			</div>
	        
	        
    </div>
</div>
</body>
<%@ include file="faqAction.jsp" %>
</html>
</layoutTag:layout>