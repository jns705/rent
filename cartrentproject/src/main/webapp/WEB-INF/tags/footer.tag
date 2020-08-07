<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="URL" value="${pageContext.request.requestURL}" />
 <c:if test="${URL.substring(36) != 'main.jsp'}">
	<footer id="footer">
    <div class="footer-wrapper">
        <div class="footer-link">
            <nav id="cscenter-info">
                <span class="cscenter">KS렌터카 고객센터&nbsp;&nbsp;1522-3111</span>
                <div class="timetable">
                    <span>일반상담 : 월~금 09:00~18:00(토요일 및 공휴일 휴무)</span>
                    <span>사고접수 : 24시간 운영</span>
                </div>
            </nav><!--//20170522 수정-->
        </div>
        <div class="footer-info">
            <h1>SK렌터카</h1>
            <div class="footer-menu">
             	<ul>
                    <li><a href="/main">회사소개</a></li>
                    <li><a href="#">Sales Partner 모집</a></li><!-- /rent/intro/html/sm_info.do -->
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#" class="btn-modal">이메일무단수집거부</a></li>
                    <li><a href="/serviceCenter">고객센터</a></li>
                    <li><a href="#">사이트맵</a></li>
                </ul>
            </div>
            <div class="site-info">
                <address>주소 : 서울 종로구 종로12길 15 코아빌딩1</address>
                <span>상호명 : KS렌터카(주)</span>
                <span>대표이사 : 신정민</span>
                <span>사업자번호 : 112-51-65184</span>
                <span>통신판매업신고 : 구로구청 제2105-022354</span> 
                <span>TEL : 1522-3111</span>
            </div>
            <p class="copyright">Copyright ⓒ KS렌터카  All Rights Reserved.</p>
        </div>
    </div>
</footer>
	</c:if>