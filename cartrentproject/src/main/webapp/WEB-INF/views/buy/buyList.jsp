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
<div class="container">

 	<h2 align=center>예약 목록</h2>
 	<form method="post" name="form1">
	<table class="table">
		<thead style="background: #e7e6d2 ;">
			<tr>
				<th style="background: #e3ddcb ;">회원 아이디</th>
				<th>계약기간</th>
				<th>회원 이름</th>
				<th>회원 주소</th>	
				<th>회원 전화번호</th>
				<th>상담 신청일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${buyList}" var="buy" >
			<tr>
				<td style="cursor: pointer;">${buy.id}</td>
				<td>${buy.month}개월</td>
				<td>${buy.name}</td>
				<td>${buy.address}</td>
				<td>${buy.tel}</td>
				<td>${buy.counseling_date}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
</div>
</body>
</html>
</layoutTag:layout>