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
<title>QNA 작성 페이지</title>
</head>
<body>
	<div class="container">
	<h2>QNA 작성</h2>
	<form class="form-horizontal" action="${path}/qna/insertProc" method="post">
		
		<div class="form-group">
			<label for="writer">작성자</label>
			<input type="text" class="form-control" id="writer" name="writer" placeholder="이름을 입력하십시오.">
		</div>
	
		<div class="form-group">
			<label for="subject">제목</label>
			<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하십시오.">
		</div>
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="4" cols="100" class="form-control" id="content" name="content" placeholder="내용을 입력하십시오."></textarea>
		</div>

		<div class="form-group pwd" id="pwd">
			<div id="pwevt">
				<!--
				<label for="qne_password">비밀번호</label>
				<input type="password" class="form-control masked" id="qne_password" name="qne_password" placeholder="비밀번호를 입력하세요">
				<button type="button" id="eye"><span class="glyphicon glyphicon glyphicon-eye-open" ></span></button>
				-->
			</div>
		</div>
				
		<input type="checkbox" id="check_yn">
		<label>비밀글로 작성</label><br>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>
		
</div>
</body>
<script>
var str ='';
	str += '<div id="pwevt">';
    str += '<label for="qne_password">비밀번호</label>';
    str += '<input type="password" class="form-control" id="qne_password" name="qne_password" placeholder="비밀번호를 입력하세요">';
    str += '</div>';

	$(document).ready(function(){
	    $("#check_yn").change(function(){
	        if($("#check_yn").is(":checked")){
	            $(".pwd").html(str);       
	        }else{
	            $('#pwevt').remove();
	        }
	    });
	});

</script>
</html>
</layoutTag:layout>