<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 상담 리스트</title>
</head>
<body>
<c:if test="${sessionScope.id == null}"><c:set var="id" value="${couList[0].name}"/></c:if>
<c:if test="${sessionScope.id != null}"><c:set var="id" value="${sessionScope.id}"/></c:if>
<div id="content">
    <div id="container">
<div class="breadcrumbs">
            <h2 class="tit">고객 구매 리스트</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>장기렌터카</span>
                <span class="cl-point2">고객 상담 리스트</span>
            </div>
</div>
        
         <div class="tab-menu v1">
            <ul class="unlink tTab" id="reservMenu">
            	<li class="col-4">
                	<a href="/buy/userBuyList?tel=${tel}">구매 리스트</a>
                </li>
                <li class="col-4 selected">
                    <a href="/counseling/userList?tel=${tel}">상담 리스트</a>
                </li>
            </ul>
        </div>
<article>
            <table class="tb-cnt cnt-center" style="border-top : 1px solid #eb444b">
                <caption><span class="cl-point2">${id}</span>님 상담 리스트</caption>
                <colgroup>
                    <col width="400px">
                    <col width="200px">
                    <col width="">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">차량</th>
                    <th scope="col">고객 성함</th>
                    <th scope="col">신청 날짜</th>
                    <th scope="col">신청 개월</th>
                    <th scope="col">현재 상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${couList}" var="list" varStatus="status">
                <tr>
                    <td>${carName[status.index]}</td>
                    <td>${list.name}</td>
                    <td>${list.counseling_date}</td>
                    <td>${list.month}</td>
                    <td>${list.counseling_situation}</td>
                </tr>
                </c:forEach>
                </tbody>
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
</body>
</html>
</layoutTag:layout>