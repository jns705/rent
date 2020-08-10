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
		<form class="form-horizontal" action="${path}/admin/rentInsertProc" method="post" >
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 선택</label>
					<div class="col-sm-4">
						<select class="form-control car" name="car_id" onchange="colorChange();">
						<c:forEach items="${car}" var="car">
							<option value="${car.car_id}">${car.car_name}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">색상 선택</label>
					<div class="col-sm-4">
						<select class="form-control select" id='colorSelect' name="color">
							
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">주행거리</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="milage" size="10" placeholder="주행거리를 입력하세요"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">지점 위치</label>
					<div class="col-sm-4">
						<select class="form-control" name="location">
							<option value="서울지점">서울지점</option>
							<option value="인천지점">인천지점</option>
							<option value="대구지점">대구지점</option>
							<option value="부산지점">부산지점</option>
							<option value="제주지점">제주지점</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">최대 개월 수</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="max_month" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">일일 가격</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="price" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_number" size="10" placeholder="차량번호를 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비고	</label>
						<div class="col-sm-8">
							<textarea cols="10" rows="10" class="form-control" name="special_note"  placeholder="차량이름을 입력하세요"></textarea>
						</div>
				</div>
				
				<div align="center">
					<button class="btn btn-lg">렌트등록</button>
				</div><br><br><br>
				
				</div>
			</div>
 		</form>
			</div>
</body>
<script type="text/javascript">

	colorChange();
	//색상 변경 AJAX
	function colorChange(){
		var car_id = $('.car').val();
		$.ajax({
			url 	: '/admin/getColor',
			data	: {'car_id' : car_id},
			type	: 'get',
			success : function(data){
				var str = "";
				$.each(data, function(key, value){
					str += '<option>'+ value.color +'</option>';
				});
				$('#colorSelect').html(str);
			},
			error 	: function(data){alert("gd");}
		});
	}
</script>
</html>
</layoutTag:layout>