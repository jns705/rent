<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
</head>
<body>
	
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>차량등록</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/admin/carInsertProc" method="get" >
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="car_name" size="10" placeholder="차량이름을 입력하세요"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">제조사</label>
					<div class="col-sm-4">
						<select class="form-control" name="manufacturer">
							<option value="현대">현대</option>
							<option value="기아">기아</option>
							<option value="삼성">삼성</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">배기량</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="exhaust_volume" size="10" placeholder="배기량을 입력하세요"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차종</label>
					<div class="col-sm-4">
						<select class="form-control" name="car_kind">
							<option value="소형">소형</option>
							<option value="준중형">준중형</option>
							<option value="중형">중형</option>
							<option value="대형">대형</option>
							<option value="RV">RV</option>
							<option value="화물">화물</option>
							<option value="친환경차">친환경차</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">연료</label>
						<div class="col-sm-4">
						<select class="form-control" name="fuel">
							<option value="휘발유">휘발유</option>
							<option value="경유">경유</option>
							<option value="전기">전기</option>
							<option value="전기+휘발유">전기+휘발유</option>
							<option value="LPG">LPG</option>
						</select>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">변속기</label>
					<div class="col-sm-4">
						<select class="form-control" name="transmission">
							<option value="자동">자동</option>
							<option value="수동">수동</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량가격</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_price" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">제조국가</label>
						<div class="col-sm-4">
						<select class="form-control" name="made_country">
							<option value="국산">국산</option>
							<option value="수입">수입</option>
						</select>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량연도</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_year" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비고</label>
						<div class="col-sm-8">
							<textarea cols="10" rows="10" class="form-control" name="content" size="10" placeholder="차량이름을 입력하세요"></textarea>
						</div>
				</div>
				
				<br><hr><br>
				
				
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