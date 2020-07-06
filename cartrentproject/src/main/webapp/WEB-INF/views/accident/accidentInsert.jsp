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
		<form class="form-horizontal" action="${path}/accident/insertProc" method="post">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
				<div class="form-group">
					<label class="control-label col-sm-2">차</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="car_id" size="10" value=""/>
					</div>
				</div>
				
				 
				<fmt:formatDate value="${now }" pattern="yyyy" var="year" />
				<div class="form-group">
					<label class="control-label col-sm-2">사고날짜</label>
						<div class="col-lg-1">
							<select class="form-control" size="+1" name="date1">
							<c:forEach begin="${year-50}" end="${year}" var="i">
								<option value="${i}">${i}&nbsp;&nbsp;</option>
							</c:forEach>
							
							</select>
						</div>
						
						<div class="col-sm-1">
							<select class="form-control" name="date2">
							<c:forEach begin="1" end="12" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
						</div>
						
						<div class="form-group col-sm-1">
							<select class="form-control" name="date3">
							<c:forEach begin="1" end="31" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
						</div>
				</div>
				
								
				<div class="form-group">
					<label class="control-label col-sm-2">사고 내용</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="accident_content" size="10" placeholder="사고내용"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">사고 비용</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="accident_price" size="10" placeholder="사고비용"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">특이사항</label>
						<div class="col-sm-1">
							<textarea rows="10" cols="80" id="note"></textarea>
							<input type="hidden" value="" id="special_note" name="special_note">
						</div>
				</div>
				
				<div align="center">
					<button class="btn btn-lg" type="submit">등록</button>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>
</body>
<script>
	$('#note').keyup(function() {
		document.getElementById('special_note').value = $("#note").val();
	});
</script>
</html>
</layoutTag:layout>