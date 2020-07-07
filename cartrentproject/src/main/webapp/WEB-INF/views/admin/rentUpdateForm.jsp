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
		<form class="form-horizontal" action="${path}/admin/rentUpdateProc" method="post" >
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 선택</label>
					<div class="col-sm-4">
						<select class="form-control car" name="car_id" onchange="carChange();">
						<c:forEach items="${car}" var="car">
							<option value="${car.car_id}" <c:if test="${rent.car_id eq car.car_id}">selected</c:if> >${car.car_name}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">색상 선택</label>
					<div class="col-sm-4">
						<select class="form-control select" name="color">
							
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">주행거리</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="milage" size="10" value="${rent.milage}"/>
						<input class="hidden colorRent" value="${rent.color}">
						<input class="hidden colorRent" name="rent_id" value="${rent.rent_id}">
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">지점 위치</label>
					<div class="col-sm-4">
						<select class="form-control" name="location">
							<option value="서울지점" <c:if test="${rent.location eq '서울지점'}">selected</c:if> >서울지점</option>
							<option value="인천지점" <c:if test="${rent.location eq '인천지점'}">selected</c:if> >인천지점</option>
							<option value="대구지점" <c:if test="${rent.location eq '대구지점'}">selected</c:if> >대구지점</option>
							<option value="부산지점" <c:if test="${rent.location eq '부산지점'}">selected</c:if> >부산지점</option>
							<option value="제주지점" <c:if test="${rent.location eq '제주지점'}">selected</c:if> >제주지점</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">최대 개월 수</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="max_month" size="10" value="${rent.max_month}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">일일 가격</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="price" size="10" value="${rent.price}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="car_number" size="10" value="${rent.car_number}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비고	</label>
						<div class="col-sm-8">
							<textarea cols="10" rows="10" class="form-control" name="special_note">${rent.special_note}</textarea>
						</div>
				</div>
				
				
				<div align="center">
					<button class="btn btn-lg">렌트수정</button>
				</div><br><br><br>
				
				</div>
			</div>
 		</form>
			</div>
</body>
<script type="text/javascript">

	option();

	function option(){
		$.ajax({
			url 	: '/admin/optionList',
			type	: 'get',
			success : function(data){
				var str = "";
				$.each(data, function(key, value){
					str += '<div class="col-sm-1">' +
							'<input class="checkbox col-sm-2" type="checkbox" name="'+ value.option_name +'" value="'+ value.option_name +'" />' +
							'<label class="control-label col-sm-2">'+ value.option_name +'</label>'+
						'</div>';
				});
				$('.op').html(str);
			}
		});
	}



	function carChange(){
		var car_id = $('.car').val();
		var color =  $('.colorRent').val();
		$.ajax({
			url 	: '/admin/getColor',
			data	: {'car_id' : car_id},
			type	: 'get',
			success : function(data){
				var str = "";
				$.each(data, function(key, value){
					str += '<option value="'+ value.color+'"';
					if(value.color == color) str += ' selected ';
					str += '>' + value.color +'</option>';
				});
				$('.select').html(str);
			},
			error 	: function(data){alert("gd");}
		});
	}

	function addOption(){
		window.open('/admin/optionForm'
				,'left=200, top=170, width=900, height=250, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
		return;
	}

	carChange();
</script>
</html>
</layoutTag:layout>