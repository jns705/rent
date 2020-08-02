<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 리스트</title>
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
	<label class="control-label"><font size="+3"><b>차량리스트</b></font></label><br><br>
	</div><br>
				<div class="container-fluid">
				
				<table class="table table-bordered table-hover table-striped naum">
					<thead>
						<tr align="center" class="info">
							<td>번호</td>
							<td>차량이름</td>
							<td>제조사</td>
							<td>차종</td>
							<td>배기량</td>
							<td>연료</td>
							<td>변속기</td>
							<td>차량가격</td>
							<td>제조국가</td>
							<td>모델연도</td>
							<td>기타사항</td>
							<td>정보수정</td>
							<td>색상수정</td>
							<td>삭제</td>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${list}" var="list" varStatus="status">
						<tr align="center">
							<td width="10">${status.index+1}</td>
							<td>${list.car_name}</td>
							<td>${list.manufacturer}</td>
							<td>${list.car_kind}</td>
							<td>${String.format('%,d',list.exhaust_volume)}CC</td>
							<td>${list.fuel}</td>
							<td>${list.transmission}</td>
							<td>${String.format('%,d',list.car_price)}만원</td>
							<td>${list.made_country}</td>
							<td>${list.car_year}</td>
							<c:if test="${list.content.length() > 20 }">
							<td onclick="location.href='${path}/admin/carDetail/${list.car_id}'">${list.content.substring(0,20)}...</td>
							</c:if>
							<c:if test="${list.content.length() <= 20 }">
							<td onclick="location.href='${path}/admin/carDetail/${list.car_id}'">${list.content}</td>
							</c:if>
							<td><button class="btn" onclick="location.href='/admin/carUpdateForm/${list.car_id}'">정보수정</button></td>
							<td><button class="btn" onclick="location.href='/admin/colorInsertForm/${list.car_id}'">색상수정</button></td>
							<td><button class="btn btn_danger" onclick="location.href='/admin/carDeleteProc/${list.car_id}'">삭제</button></td>
						</tr>
						</c:forEach>
							
					</tbody>
				</table>				
				
				<br><br><br>
				</div>
</body>
</html>
</layoutTag:layout>