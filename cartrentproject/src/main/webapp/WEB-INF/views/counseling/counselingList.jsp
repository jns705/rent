<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 목록 페이지</title>
<style>
tbody tr:hover {
	background-color : #F5F0C5;
}
</style>
</head>
<body>
<div class="container">

 	<h2 align=center>상담 목록</h2>
 	<form method="post" name="form1">
 	<div align="right">
 		<button formaction="${path}/counseling/list" >전체</button>
 		<button formaction="${path}/counseling/searchList/상담 대기중" >상담 대기중</button>
 		<button formaction="${path}/counseling/searchList/상담완료" >상담완료</button>
 		<button formaction="${path}/counseling/searchList/예약완료" >예약완료</button>
 	</div>
	<table class="table">
		<thead style="background: #e7e6d2 ;">
			<tr>
				<th style="background: #e3ddcb ;">회원 아이디</th>
				<th>차량 이름</th>
				<th>렌트 아이디</th>
				<th>계약기간</th>
				<th>회원 이름</th>
				<th>회원 주소</th>	
				<th>회원 전화번호</th>
				<th>상담 신청일</th>
				<th>상담 상태</th>
				<th style="background: #e3ddcb ;">삭제</th>		
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${counselingList}" var="couList" varStatus="i" >
			<tr>
				
				
				<td onclick="location.href='${path}/counseling/detail/${couList.counseling_id}'" style="cursor: pointer;">${couList.id}</td>
				
				<td>${car[i.index]}</td>
				<c:if test="${couList.rent_id != null}">
				<td onclick="location.href='${path}/rent/rentListDetail/${couList.rent_id}'" style="cursor: pointer;">${couList.rent_id}<input type="hidden" name="rent_id_${couList.counseling_id}" value="${couList.rent_id}"></td>
				</c:if>
				<c:if test="${couList.rent_id eq null }">
				<td>${couList.rent_id}<input type="hidden" name="rent_id_${couList.counseling_id}" value="${couList.rent_id}"></td>
				</c:if>
				
				<td>${couList.month}개월</td>
				<td>${couList.name}</td>
				<td>${couList.address}</td>
				<td>${couList.tel}</td>
				<td>${couList.counseling_date}</td>
				<td>${couList.counseling_situation}</td>
				<td onclick="counselingDelete(${couList.counseling_id})" style="cursor: pointer;"><span class="glyphicon glyphicon-trash"></span></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
		<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">									<!-- &lt; 는 기호(<)의 코드값이다  -->
			<a href="/counseling/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/counseling/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">				<!-- &gt; 는 기호(>)의 코드값이다  -->
			<a href="/counseling/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
	</form>
</div>
</body>
<script>
function counselingDelete(counseling_id) {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/counseling/delete/"+counseling_id;
		document.form1.submit();
	}
}
</script>
</html>
</layoutTag:layout>