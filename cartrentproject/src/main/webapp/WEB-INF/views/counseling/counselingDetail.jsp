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
<title>상담 상세 페이지</title>
<style>
tbody tr:hover {
	background-color : #F5F0C5;
}
</style>
</head>
<body>
<h2 align=center>${detail.name}님의 상담 상세조회(${detail.id})</h2>
<div class="container">
	<form method="post" name="form1">
	<table class="table">
	
		<tr>
			<th>상담 렌트 번호</th>
			<td align="left">${detail.rent_id}</td>
		</tr>
		
		<tr>
			<th>회원 아이디</th>
			<td align="left">${detail.id}</td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td align="left">${detail.name}</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td align="left">${detail.address}</td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td align="left">${detail.tel}</td>
		</tr>
		
		<tr>
			<th>상담 신청일</th>
			<td align="left">${detail.counseling_date}</td>
		</tr>
		
		<tr>
			<th>신청 개월수</th>
			<td align="left">${detail.month}개월</td>
		</tr>
		
		<tr>
			<th>옵션명</th>
			<td align="left">${detail.option_name}</td>
		</tr>
		
		<tr>
			<th>상담상태</th>
			<td>
				<input type="hidden" name="counseling_situation" id="counseling_situation" value="${detail.counseling_situation}">
				<input type="hidden" name="counseling_id" value="${detail.counseling_id}">
				<input type="hidden" name="rent_id" value="${detail.rent_id}">
				<input type="hidden" name="rent_id_${detail.counseling_id}" value="${detail.rent_id}">
				<select id="sit" onchange="situationUpdate(this.value);">
					<option value="상담 대기중" >상담 대기중</option>
					<option value="상담완료" >상담완료</option>
					<option value="예약완료" >예약완료</option>
				</select>
				<button class="glyphicon glyphicon-refresh" formaction="${path}/counseling/update" onclick="alert('수정완료')"></button>
			</td>
		</tr>
		
	</table>
	<div align="center">
		<button class="btn btn-primary" formaction="${path}/counseling/list">목록</button>
		<button class="btn btn-danger" onclick="counselingDelete(${detail.counseling_id})">삭제</button>
	</div>
	</form>
</div>
</body>
<script>
$(function() {
	document.getElementById('sit').value = document.getElementById('counseling_situation').value;
});

function counselingDelete(counseling_id) {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/counseling/delete/"+counseling_id;
		document.form1.submit();
	}
}

function situationUpdate(situation) {
	document.getElementById('counseling_situation').value = situation;
}
</script>
</html>
</layoutTag:layout>