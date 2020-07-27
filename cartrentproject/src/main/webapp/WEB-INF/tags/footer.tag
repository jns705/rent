<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="URL" value="${pageContext.request.requestURL}" />
 <c:if test="${URL.substring(36) != 'main.jsp'}">
	<footer>
	<div class="container-fluid footer col-md-12" style="padding: 0px; margin: 0px;">
		<div class="row">
			<div class="footer-menu">
				<ul class="footer-menu">
					<li><a href="/company/introduce">회사소개</a></li>
					<li><a href="/company/branch">지점안내</a></li>
					<li><a href="/single/standard">자동차대여약관</a></li>
					<li><a href="/single/shortRent">단기대여 요금기준</a></li>
					<li><a href="http://bpms.kemco.or.kr/transport_2012/car/car_choice.aspx?f=system" target="_blank">차종별 연비확인</a></li>
					<li><a href="/single/privacy" class="last">개인정보 취급방침</a></li>
				</ul>
			</div>
		</div>
		<div class="row footer-brand">			
			<div class="brand-info">
				<div class="col-md-4 text-right">
					<img src="http://localhost:8082/static/img/logo2.png" style="width:110px;float:right;margin-top: 10px;"/>
				</div>
	            <div class="col-md-5" style="margin-bottom:15px;">
	                <p>
	                    <span class="title">(주)솔렌트카</span><br/>
						서울특별시 종로구 종로12길 15 (코아빌딩1)<br/>
						사업자번호 : 123-45-67890<br/>
						통신판매업신고번호 : 제2020-서울영등포-1237호<br/>
						TEL : 대표)02-1111-1111 | 고객지원) 02-111-1111<br/>
						Copyrightⓒ 2020 by solrentcar. All rights reserved. 
	                </p>
	            </div>
	            <div class="col-md-3">
	            	<a href="https://www.facebook.com" target="_blank"><img src="http://localhost:8082/static/img/facebook.png" width="50" height="50" style="float:left"/></a>
	            	<a href="https://www.instagram.com" target="_blank"><img src="http://localhost:8082/static/img/instagram.png" width="50" height="50"  style="float:left"/></a>
	            	<a href="https://www.kakaocorp.com/" target="_blank"><img src="http://localhost:8082/static/img/kakao.png" width="50" height="50"  style="float:left"/></a>
	            </div>
			</div>
		</div>
	</div>
	</footer>
	</c:if>