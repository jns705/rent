<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<c:if test="${sessionScope.id == null}"><c:set var="id" value="${Buy[0].name}"/></c:if>
<c:if test="${sessionScope.id != null}"><c:set var="id" value="${sessionScope.id}"/></c:if>
<div id="content">
    <div id="container"  style="margin-top:40px;">
<div class="breadcrumbs">
            <h2 class="tit">고객 구매 리스트</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>장기렌터카</span>
                <span class="cl-point2">고객 구매 리스트</span>
            </div>
</div>
        
         <div class="tab-menu v1">
            <ul class="unlink tTab" id="reservMenu">

                        	<c:if test="${sessionScope.id == null}">
            	<li class="col-4 selected">
                	<a href="/buy/userBuyList?tel=${Buy[0].tel}">구매 리스트</a>
                </li>
                <li class="col-4 ">
                    <a href="/counseling/userList?tel=${Buy[0].tel}">상담 리스트</a>
                </li>
                </c:if>
                <c:if test="${sessionScope.id != null}">
            	<li class="col-4 selected">
                	<a href="/buy/userBuyList">구매 리스트</a>
                </li>
                <li class="col-4 ">
                    <a href="/counseling/userList">상담 리스트</a>
                </li>
                </c:if>
             </ul>
        </div>
<article>
            <table class="tb-cnt cnt-center" style="border-top : 1px solid #eb444b">
                <caption><span class="cl-point2">${id}</span>님 구매 리스트</caption>
                <colgroup>
                    <col width="400px">
                    <col width="200px">
                    <col width="">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">차량 이름</th>
                    <th scope="col">고객 이름</th>
                    <th scope="col">구매 일시</th>
                    <th scope="col">개월 수</th>
                    <th scope="col">신청 현황</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${Buy}" var="list" varStatus="status">
                <tr <c:if test="${map[status.index] != '신차'}"> onclick="location.href='/rent/rentListDetail/${list.rent_id}'"</c:if>
                	<c:if test="${map[status.index] eq '신차'}"> onclick="location.href='/rent/NewRentListDetail/${list.rent_id}'"</c:if>>
                    <td>${Car[status.index].car_name}</td>
                    <td>${list.name}</td>
                    <td><fmt:formatDate value="${list.buy_date}" var="date" pattern="yyyy-MM-dd"/>${date}</td>
                    <td>${list.month}</td>
                    <td>${situation[status.index]}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="under-tab">
                <ul class="list-info v1">
                    <li><span class="cl-point2">구매 취소</span>를 원하시면 <span class="cl-point2">고객센터</span>에 문의해주시기 바랍니다.</li>
                    <li>구매 확정이 되어야 렌트가 가능합니다.</li>
                    <li>대여자격 기준에 적합하지 않은 면허증을 소지하신 경우 대여가 취소 될 수 있으니 이점 유념하여 주시기 바랍니다.</li>
                    <li>대여 당일 운전면허증 미 지참 시 차량 대여가 불가하오니, 꼭 지참 후 방문부탁드립니다.</li>
                </ul>
            </div>
</article>
</div>
</div>
</body>
</html>
</layoutTag:layout>