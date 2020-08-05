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
<h2 align=center>${detail.name}님의 예약 상세조회(${detail.id})</h2>
<div class="container">
	<table class="table">
	
		<tr>
			<th>예약 렌트 번호</th>
			<td align="left">${detail.rent_id}
				<input type="hidden" name="rent_id_${detail.buy_id}" value="${detail.rent_id }">
			</td>
		</tr>
		
		<tr>
			<th>예약 차량이름</th>
			<td align="left">${car.car_name}</td>
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
			<th>예약 날짜</th>
			<td align="left">${detail.buy_date}</td>
		</tr>
		
		<tr>
			<th>상담 신청일</th>
			<td align="left">${detail.counseling_date}</td>
		</tr>
		
		<tr>
			<th>신청 개월수</th>
			<td align="left">
				${detail.month}개월
			 	<button class="glyphicon glyphicon-star-empty" onclick="rentDay('${detail.buy_date}','${detail.month}')"></button>
			</td>
		</tr>
		
		<tr>
			<th>옵션명</th>
			<td align="left">${detail.option_name}</td>
		</tr>
		
		<tr id="end"></tr>
		
	</table>
<form method="post" name="form1" action="${path}/buy/delete/${detail.buy_id}">
	<div align="center">
	<!-- 
		<button class="btn btn-primary" onclick="location='${path}/buy/list'">목록</button>
		<button class="btn btn-danger" onclick="location='${path}/buy/delete/${detail.buy_id}'">삭제</button>
	 -->
		 <button class="btn btn-primary" formaction="${path}/buy/list">목록</button>
		<button class="btn btn-danger" type="submit">삭제</button>	
	</div>
</form>
</div>
</body>
<script>
function dateAddDel(sDate, nNum, type) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);
    
    if (type == "d") {
        d = new Date(yy, mm - 1, dd + nNum);
    }
    else if (type == "m") {
        d = new Date(yy, mm - 1, dd + (nNum * 31));
    }
    else if (type == "y") {
        d = new Date(yy + nNum, mm - 1, dd);
    }
 
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
 
    return '' + yy + '-' +  mm  + '-' + dd;
}
function rentDay(buy_date, month) {
	
	var today = new Date(buy_date);
	//ex) Fri Jun 15 2018 14:33:33 GMT+0900 (한국 표준시)
	today.toISOString();
	//ex) 2018-06-15T05:33:33.222Z
	var date = today.toISOString().slice(0, 10);
	//ex) 2018-06-15
	str = '';
	str += '<th>반납일</th>'
	str += '<td>'+dateAddDel(date, month, 'm')+'</td>';
	$('#end').html(str);
}

</script>
</html>
</layoutTag:layout>