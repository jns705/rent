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
	
	thead	 th{
		text-align: center;
	}
	
	.naum	{
		margin-left: 50px;
		padding-left: 0px;
		width: 1100px;
	}
</style>
<body>

	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>옵션, 사고이력</b></font></label><br><br>
			<div class="panel panel-default">
				<div id="container">
				<br><br><br>
				<div class="container">
				<table class="table table-bordered table-striped naum form-group">
					<thead>
						<tr>
							<th>옵션리스트</th>
							<th>가격</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${option}" var="option">
							<tr align="center">
								<td>${option.option_name}</td>
								<td>${option.option_price}</td>
								<td>${option.option_content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>		
				<form action="${path}/admin/rentInsertProc" method="get">
				<input class="hidden" name="rent_id" value="${id}">
				<div class="op col-sm-offset-1 col-sm-11" align="center"></div>
				
				<div align="center">
					<button class="btn btn-rg">옵션변경</button>
					<button type="button" class="btn btn-rg" onclick="addOption();">옵션추가</button>
				</div>
				
				</form>
				
				
				<br>
				<table class="table table-bordered table-striped naum  form-group">
					<thead>
						<tr>
							<th>사고내용</th>
							<th>발생비용</th>
							<th>사고날짜</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${accident}" var="accident">
							<tr align="center">
								<td>${accident.accident_content}</td>
								<td>${accident.accident_price}</td>
								<td>${accident.accident_date}</td>
								<td>${accident.special_note}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>	
				
				<div align="center">
					<button type="button" class="btn btn-rg">사고추가	</button>
				</div>
				
				</div>	
				
								
				<br><br>
				
				</div>
			</div>
	</div>

</body>
<script type="text/javascript">
function addOption(){
	window.open('${path}/admin/optionForm'
			,'left=200, top=170, width=900, height=250, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
}

option();

function option(){
	$.ajax({
		url 	: '/admin/optionList',
		type	: 'get',
		success : function(data){
			var str = "";
			$.each(data, function(key, value){
				str += '<div class="col-sm-3">' +
						'<input class="checkbox col-sm-1" type="checkbox" name="'+ value.option_name +'" value="'+ value.option_name +'" />' +
						'<label class="control-label col-sm-6">'+ value.option_name +'</label>'+
						'</div>';
			});
			$('.op').html(str);
		}
	});

}
</script>
</html>

</layoutTag:layout>