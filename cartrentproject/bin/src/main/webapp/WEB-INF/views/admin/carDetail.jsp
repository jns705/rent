<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 상세정보</title>
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
				<div class="container" id="container">
				<br><br><br>
				<div class="form-group">
					<div class="col-sm-offset-1">
					<label class="control-label col-sm-1"><font size="3"><b>제조사</b></font></label>
					<label class="control-label col-sm-2"><font size="3"><b>${detail.manufacturer}</b></font></label>
					<label class="control-label col-sm-1"><font size="3"><b>배기량</b></font></label>
					<label class="control-label col-sm-2"><font size="3"><b>${detail.exhaust_volume}</b></font></label>
					<label class="control-label col-sm-1"><font size="3"><b>색상</b></font></label>
					<div class="col-sm-1">
						<select class="form-control">
							<c:forEach items="${color}" var="color">
								<option>${color.color}</option>
							</c:forEach>
						</select>
					</div>
					<label class="control-label col-sm-1"><font size="3"><b>옵션</b></font></label>
					<div class="col-sm-1">
						<select class="form-control">
							<c:forEach items="${option}" var="option">
								<option>${option.option_name}</option>
							</c:forEach>
						</select>
					</div>
					</div>
				</div>
								
				<div class="form-group">
					<div class="col-sm-offset-1" align="center">
					<label class="control-label col-sm-1"><font size="3"><b>차종</b></font></label>
					<label class="control-label col-sm-2"><font size="3"><b>${detail.car_kind}</b></font></label>
					<label class="control-label col-sm-1"><font size="3"><b>연료</b></font></label>
					<label class="control-label col-sm-2"><font size="3"><b>${detail.fuel}</b></font></label>
					</div>
				</div>
								
				<div class="form-group">
					<div class="col-sm-offset-1" align="left">
					<label class="control-label col-sm-1"><font size="3"><b>변속기</b></font></label>
					<label class="control-label col-sm-2" style="text-align: left;"><font size="3"><b>${detail.transmission}</b></font></label>
					<label class="control-label col-sm-1"><font size="3"><b>차량가격</b></font></label>
					<label class="control-label col-sm-2" style="text-align: left;"><font size="3"><b>${String.format('%,d',detail.car_price)}원</b></font></label>
					</div>
				</div>
								
				<br><br>
				<div align="center">
					<button class="btn btn-lg">차량등록</button>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>

</body>
</html>
</layoutTag:layout>