<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트 리스트</title>
<style type="text/css">
	  thead td {
      position: sticky;
      top: -1px;
      background: red;
  }
</style>
</head>
<body>
	
	<br>
	<div align="center">
	<label class="control-label"><font size="+3"><b>렌트리스트</b></font></label><br><br>
	</div><br>
				<div class="container-fluid">
				
				<table class="table table-bordered table-hover table-striped naum">
					<thead>
						<tr align="center" class="info">
							<td>번호</td>
							<td>차량이름</td>
							<td>변속기</td>
							<td>연료</td>
							<td>차량가격</td>
							<td>색상</td>
							<td>주행거리</td>
							<td>지점</td>
							<td>예약여부</td>
							<td>차량번호</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${rent}" var="rent" varStatus="status">
						<tr align="center">
							<td width="10">${status.index+1}</td>
							<td onclick="location.href='${path}/admin/rentDetail/${rent.rent_id}'">${car[status.index].car_name}</td>
							<td>${car[status.index].transmission}</td>
							<td>${car[status.index].fuel}</td>
							<td>${String.format('%,d',car[status.index].car_price)}만원</td>
							<td>${rent.color}</td>
							<td>${rent.milage}</td>
							<td>${rent.location}</td>
							<td>${rent.situation}</td>
							<td>${rent.car_number}</td>
						</tr>
						</c:forEach>
							
					</tbody>
				</table>				
				
				<br><br><br>
				</div>
</body>
</html>
</layoutTag:layout>