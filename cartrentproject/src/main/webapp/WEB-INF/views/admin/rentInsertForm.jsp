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
	<label class="control-label"><font size="+3"><b>렌트등록</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/admin/rentInsertProc" method="get" >
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 선택</label>
					<div class="col-sm-4">
						<select class="form-control" name="car_id">
						<c:forEach items="${car}" var="car">
							<option value="${car.car_id}">${car.car_name}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">주행거리</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="milage" size="10" placeholder="주행거리를 입력하세요"/>
					</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">지점 위치</label>
					<div class="col-sm-4">
						<select class="form-control" name="car_kind">
							<option value="서울지점">서울지점</option>
							<option value="인천지점">인천지점</option>
							<option value="대구지점">대구지점</option>
							<option value="부산지점">부산지점</option>
							<option value="제주지점">제주지점</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차종</label>
					<div class="col-sm-4">
						<select class="form-control" name="car_kind">
							<option value="중형·소형승용(LPG)">중형·소형승용(LPG)</option>
							<option value="대형승용(LPG)">대형승용(LPG)</option>
							<option value="소형승용/경승용(가솔린,디젤)">소형승용/경승용(가솔린,디젤)</option>
							<option value="쌍용">쌍용</option>
							<option value="중형승용(가솔린,디젤)">중형승용(가솔린,디젤)</option>
							<option value="대형승용(가솔린,디젤)">대형승용(가솔린,디젤)</option>
							<option value="RV">RV</option>
							<option value="화물/승합">화물/승합</option>
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
							<option value="전기+휘발유">전기+휘발유</option>
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
				
				<!-- 옵션창은 라디오 버튼으로 추가로 만들 예정 -->
				
				<br><hr><br>
				<div class="form-group">
					<label class="control-label col-sm-2">옵션</label>
						<div class="col-sm-4">
						<select class="form-control" name="made_country">
							<option value="국산">국산</option>
							<option value="수입">수입</option>
						</select>
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