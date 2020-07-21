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
</head>
<body>
<form method="post" name="form1">
<div class="container">

 	<h2 align=center>예약 목록</h2>
	<table class="table">
		<thead style="background: #e7e6d2 ;">
			<tr>
				<th style="background: #e3ddcb ;">회원 아이디</th>
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
		
			<c:forEach items="${buyList}" var="buy">
			<tr>
				<td onclick="location.href='${path}/buy/detail/${buy.buy_id}'" style="cursor: pointer;">${buy.id}</td>
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