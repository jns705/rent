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
<style type="text/css">
tbody td#a:hover {
	background-color : #F5F0C5;
</style>
</head>
<body>
	<div class="container">
 	<h2>게시글 목록</h2>
 	
 	<table class="table table-hover table-bordered">
 		<thead>
 			<tr>
 				<th>사고 아이디</th>
 				<th>사고난 자동차</th>
 				<th>사고날짜</th>
 				<th>사고내용</th>
 				<th>사고비용</th>
 				<th>특이사항</th>
 			</tr>
 		</thead>
 		<tbody>
 		<c:forEach items="${accident}" var="acc" >
 			<tr>
 				<td>${acc.accident_id}</td>
 				<td id="a" style="cursor: pointer;" onclick="location.href='/admin/rentDetail/${acc.rent_id}'">${acc.rent_id}</td>
 				<td>${acc.accident_date}</td>
 				<td>${acc.accident_content}</td>
 				<td>${acc.accident_price}</td>
 				<td>${acc.special_note}</td>
 			</tr>
 		</c:forEach>	
 		</tbody>
 	</table>
 </div>
 
</body>
</html>
</layoutTag:layout>