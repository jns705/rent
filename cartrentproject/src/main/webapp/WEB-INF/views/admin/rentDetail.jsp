<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트 상세정보</title>
</head>
<style>
	#container label{
		text-align: left;
	}
</style>
<body>

	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>차량정보</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/admin/carInsertProc" method="get" >
			<div class="panel panel-default">
				<div id="container">
				<br><br><br>
				<table class="table">
					<thead>
						<tr>
							<th>옵션리스트</th>
							<th>가격</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${option}" var="option">
							<tr>
								<td>${option.option_name}</td>
								<td>${option.option_price}</td>
								<td>${option.option_content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>		
				
				<table class="table">
					<thead>
						<tr>
							<th>사고내용</th>
							<th>발생비용</th>
							<th>사고날짜</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${option}" var="option">
							<tr>
								<td>${option.option_name}</td>
								<td>${option.option_price}</td>
								<td>${option.option_content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>		
				
								
				<br><br>
				
				</div>
			</div>
		</form>
	</div>

</body>
</html>

</layoutTag:layout>