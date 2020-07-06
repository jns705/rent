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
		<form class="form-horizontal" action="${path}/admin/optionProc" method="get">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				
<%-- 				<div class="form-group">
					<label class="control-label col-sm-2">차량 선택</label>
						<div class="col-sm-4">
						<select class="form-control" name="car_id">
							<c:forEach items="${list}" var="list">
								<option value="${list.car_id}" <c:if test="${car_id eq list.car_id}">selected</c:if> >${list.car_name}</option>
							</c:forEach>
						</select>
						</div>
				</div> --%>
				
				<div class="form-group">
					<label class="control-label col-sm-2">옵션</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="option_name" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
					<div class="form-group">
					<label class="control-label col-sm-2">가격</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="option_price" size="10" placeholder="차량이름을 입력하세요"/>
						</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">옵션내용</label>
						<div class="col-sm-8">
							<textarea cols="5" rows="5" class="form-control" name="option_content" placeholder="차량이름을 입력하세요"></textarea>
						</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-1 col-sm-2">
						<button class="btn">옵션등록</button>
					</div>
				</div>
				
				
				<br><br>
				</div>
			</div>
		</form>
				<div align="center">
					<button class="btn btn-lg" type="button" onclick="insertOption();">옵션등록</button>
				</div><br><br><br>
				
	</div>

</body>
<script type="text/javascript">
	function insertOption(){
		opener.option();
		window.close();
	}

</script>
	
</html>
</layoutTag:layout>