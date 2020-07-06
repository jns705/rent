<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>색상 등록</title>
</head>
<body>
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>색상 옵션 등록</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/admin/carColorProc" method="post" enctype="multipart/form-data">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 선택</label>
						<div class="col-sm-4">
						<select class="form-control" name="car_id">
							<c:forEach items="${list}" var="list">
								<option value="${list.car_id}" <c:if test="${car_id eq list.car_id}">selected</c:if> >${list.car_name}</option>
							</c:forEach>
						</select>
						</div>
				
					<div class="col-sm-2">
						<button class="btn">이미지등록</button>
					</div>
				
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 색상</label>
						<div class="col-sm-4">
							<input type="text" class="form-control color" name="color" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">차량 이미지</label>
						<div class="col-sm-3">
							<input type="file" class="form-control image" name="files">
						</div>
				</div>
				
				<div>
					<table class="table">
						<thead>
							<tr class="info">
								<th align="center">색상</th>
								<th align="center">파일이름</th>
								<th align="center">사진</th>
							</tr>
						</thead>
						<tbody class="image">
						</tbody>
					</table>
				</div>
				

				
				
				<br><br>
				</div>
			</div>
		</form>
				<div align="center">
					<button class="btn btn-lg" type="button" onclick="location.href='${path}/admin/optionForm/${car_id}'">옵션등록</button>
				</div><br><br><br>
				
	</div>

</body>

	<script type="text/javascript">
		$('[name=car_id]').change(function(){
			var car_id = $('[name=car_id]').val();
			$.ajax({
				url 	: '${path}/admin/colorList',
				data    : {'car_id' : car_id},
				type 	: 'get',
				success : function(data){
					var str = "";
					$.each(data, function(key, value){
						str += '<tr><td>'+ value.color +'</td><td>'+ value.color_image.substring(32);
						str += '</td><td><img src="'+ value.color_url + value.color_image + '"with=150 height=70></td></tr>';
					});
					$('.image').html(str);
				},
				error   : function(data){alert("오류");}
			});
		});
	</script>
</html>
</layoutTag:layout>