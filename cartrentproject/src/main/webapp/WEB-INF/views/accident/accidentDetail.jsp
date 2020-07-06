<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="now" class="java.util.Date" />
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 홈페이지</title>
</head>
<body>
	
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>사고이력 등록</b></font></label><br><br>
	<a class="btn btn-danger" href="${path}/accident/list">사고목록들</a>
		<form class="form-horizontal" action="${path}/accident/update" method="post">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">차</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="car_id" size="10" value=""/>
					</div>
				</div>
				 
				 
				<div class="form-group">
					<label class="control-label col-sm-2">사고 아이디</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="accident_id" size="10" value="${detail.accident_id}" readonly/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">사고 날짜</label>
					<div class="col-sm-4">
						<input type="date" name="accident_date" value="${detail.accident_date}">
					</div>
				</div>
								
				<div class="form-group">
					<label class="control-label col-sm-2">사고 내용</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="accident_content" size="10" value="${detail.accident_content}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">사고 비용</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="accident_price" size="10" value="${detail.accident_price}"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">특이사항</label>
						<div class="col-sm-1">
							<textarea rows="10" cols="80" id="note"></textarea>
							<input type="hidden"id="special_note" name="special_note" value="${detail.special_note}">
						</div>
				</div>
				
				<div align="center">
					<button class="btn btn-warning" type="submit">수정</button>
					<button class="btn btn-danger" onclick="location.href='/accident/delete/${detail.accident_id}'">삭제</button>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#note').val(document.getElementById('special_note').value);
	});

	$('#note').keyup(function() {
		document.getElementById('special_note').value = $("#note").val();
	});
	
</script>
</html>
</layoutTag:layout>