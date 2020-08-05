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
<title>상담 목록 페이지</title>
<style>
tbody tr:hover {
	background-color : #F5F0C5;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/buy/list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
</head>
<body>
<form method="post" name="form1">
<div class="container">

 	<h2 align=center>예약 목록</h2>
 	
 	<div style="float: left;">
	 	<select name="buyKind">
	 		<option value="all">전체</option>
	 		<option value="id">회원 아이디</option>
	 		<option value="name">회원 이름</option>
	 		<option value="tel">회원 전화번호</option>
	 	</select>
	 	
	 	<span>
	 		<input type="text" name="buySearch" placeholder="검색어 입력">
	 	</span>
	 	<button onclick="">검색</button>
	 	
 	</div>
 		<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<table class="table">
		<thead style="background: #e7e6d2 ;">
			<tr>
			<th>buy_id</th>
				<th style="background: #e3ddcb ;">회원 아이디</th>
				<th>차량이름</th>
				<th>렌트아이디</th>
				<th>계약기간</th>
				<th>회원 이름</th>
				<th>회원 주소</th>	
				<th>회원 전화번호</th>
				<th>구매 날짜</th>
				<th>예약 취소</th>
			</tr>
		</thead>
		
		<tbody>
		
			<c:forEach items="${buyList}" var="buy" varStatus="i">
			<tr>
				<td>${buy.buy_id}</td>
				<td onclick="location.href='${path}/buy/detail/${buy.buy_id}'" style="cursor: pointer;">${buy.id}</td>
				<td>${car[i.index]}</td>
				<td onclick="location.href='${path}/rent/rentListDetail/${buy.rent_id}'" style="cursor: pointer;">${buy.rent_id}<input type="hidden" name="rent_id_${buy.buy_id}" value="${buy.rent_id }"></td>
				<td>${buy.month}개월</td>
				<td>${buy.name}</td>
				<td>${buy.address}</td>
				<td>${buy.tel}</td>
				<td>${buy.buy_date}</td>
				<td><a onclick="buyDelete(${buy.buy_id})"><span class="glyphicon glyphicon-trash"></span></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">									<!-- &lt; 는 기호(<)의 코드값이다  -->
			<a href="/buy/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/buy/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">				<!-- &gt; 는 기호(>)의 코드값이다  -->
			<a href="/buy/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
</div>

</form>
</body>
<script>
function buyDelete(buy_id) {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/buy/delete/"+buy_id;
		document.form1.submit();
	}
}
</script>
</html>
</layoutTag:layout>