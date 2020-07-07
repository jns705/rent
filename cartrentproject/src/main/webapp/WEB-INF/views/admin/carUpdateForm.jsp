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
		<form class="form-horizontal" action="${path}/admin/carUpdateProc" method="get" >
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="car_name" size="10" value="${car.car_name}"/>
						<input type="text" class="hidden" name="car_id" size="10" value="${car.car_id}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">제조사</label>
					<div class="col-sm-4">
						<select class="form-control" name="manufacturer">
							<option value="현대" <c:if test="${car.manufacturer eq '현대'}">selected</c:if> >현대</option>
							<option value="기아" <c:if test="${car.manufacturer eq '기아'}">selected</c:if> >기아</option>
							<option value="삼성" <c:if test="${car.manufacturer eq '삼성'}">selected</c:if> >삼성</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">배기량</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="exhaust_volume" size="10" value="${car.exhaust_volume}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차종</label>
					<div class="col-sm-4">
						<select class="form-control" name="car_kind">
							<option value="소형" <c:if test="${car.car_kind eq '소형'}">selected</c:if> >소형</option>
							<option value="준중형" <c:if test="${car.car_kind eq '준중형'}">selected</c:if> >준중형</option>
							<option value="중형" <c:if test="${car.car_kind eq '중형'}">selected</c:if> >중형</option>
							<option value="대형" <c:if test="${car.car_kind eq '대형'}">selected</c:if> >대형</option>
							<option value="화물" <c:if test="${car.car_kind eq '화물'}">selected</c:if> >대형</option>
							<option value="RV" <c:if test="${car.car_kind eq 'RV'}">selected</c:if> >RV</option>
							<option value="친환경차" <c:if test="${car.car_kind eq '친환경차'}">selected</c:if> >친환경차</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">연료</label>
						<div class="col-sm-4">
						<select class="form-control" name="fuel">
							<option value="휘발유"<c:if test="${car.fuel eq '휘발유'}">selected</c:if> >휘발유</option>
							<option value="경유"<c:if test="${car.fuel eq '경유'}">selected</c:if> >경유</option>
							<option value="전기"<c:if test="${car.fuel eq '전기'}">selected</c:if> >경유</option>
							<option value="전기+휘발유"<c:if test="${car.fuel eq '전기+휘발유'}">selected</c:if> >전기+휘발유</option>
							<option value="LPG"<c:if test="${car.fuel eq 'LPG'}">selected</c:if> >LPG</option>
						</select>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">변속기</label>
					<div class="col-sm-4">
						<select class="form-control" name="transmission">
							<option value="자동"<c:if test="${car.transmission eq '자동'}">selected</c:if> >자동</option>
							<option value="수동"<c:if test="${car.transmission eq '수동'}">selected</c:if> >수동</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량가격</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_price" size="10" value="${car.car_price}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">제조국가</label>
						<div class="col-sm-4">
						<select class="form-control" name="made_country">
							<option value="국산"<c:if test="${car.made_country eq '국산'}">selected</c:if> >국산</option>
							<option value="수입"<c:if test="${car.made_country eq '수입'}">selected</c:if> >수입</option>
						</select>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량연도</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_year" size="10" value="${car.car_year}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비고</label>
						<div class="col-sm-8">
							<textarea cols="10" rows="10" class="form-control" name="content" placeholder="차량이름을 입력하세요">${car.content}</textarea>
						</div>
				</div>
				
				<br><hr><br>
				
				
				<br><br>
				<div align="center">
					<button class="btn btn-lg">차량수정</button>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>
</body>
</html>
</layoutTag:layout>