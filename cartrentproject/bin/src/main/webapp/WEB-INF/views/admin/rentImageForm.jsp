<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록</title>
</head>
<body>
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>렌트 사진 등록	</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/admin/rentImageProc" method="post" enctype="multipart/form-data">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">렌트번호</label>
						<div class="col-sm-4">
							<input readonly type="text" class="form-control color" name="color" size="10" value="${car.car_name} / ${rent.car_number}"/>
							<input class="hidden" name="rent_id" value="${rent.rent_id}"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">이미지명</label>
						<div class="col-sm-4">
							<input type="text" class="form-control color" name="rent_image" size="10" placeholder="렌트이미지명을 입력하시오"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">렌트 이미지</label>
						<div class="col-sm-3">
							<input type="file" class="form-control image" name="files">
						</div>
						
					<div class="col-sm-offset-2 col-sm-2">
						<button class="btn">이미지등록</button>
					</div>
				</div>
				
				<div>
					<table class="table">
						<thead>
							<tr class="info">
								<th>파일명</th>
								<th >파일이름</th>
								<th>사진</th>
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
				
	</div>

</body>

	<script type="text/javascript">
	option();
	function option(){
		var rent_id = $('[name=rent_id]').val();
		$.ajax({
			url 	: '${path}/admin/rentImageList',
			data    : {'rent_id' : rent_id},
			type 	: 'get',
			success : function(data){
				var str = "";
				$.each(data, function(key, value){
					str += '<tr align=center><td>'+ value.rent_image +'</td><td>'+ value.rent_url.substring(72);
					str += '</td><td><img src="' + value.rent_url + '"with=150 height=70></td></tr>';
				});
				$('.image').html(str);
			},
			error   : function(data){alert("오류");}
		});
	}
		$('[name=car_id]').change(function(){
			option();
		});
	</script>
</html>
</layoutTag:layout>