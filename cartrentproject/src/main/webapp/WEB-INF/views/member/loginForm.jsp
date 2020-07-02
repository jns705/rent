<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솔렌트카 로그인 페이지</title>
</head>
<body>
	<c:if test="${sessionScope.id != null}">
		<script type="text/javascript">
			location.href='${path}/main';
		</script>
	</c:if>
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>s이메일 로그인${sessionScope.wd}</b></font></label><br>
	<label class="control-label">본인 견적이력 확인 / 상담요청 내역 확인 / 월렌트 예약용</label><br><br><br>
		<form class="form-horizontal" action="${path}/member/loginProc" method="get">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				<div class="form-group">
					<label class="control-label col-sm-2">아이디</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="id" size="10" placeholder="아이디를 입력하세요"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="password" size="10" placeholder="비밀번호를 입력하세요"/>
					</div>
					<div class="col-sm-3">
						<button class="btn btn-lg">로그인</button>
					</div>
				</div>
				
				<div align="center">
					<h4 id="insert" onclick="location.href='${path}/member/insertForm'">간편 회원가입</h4>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>
</body>
</html>
</layoutTag:layout>