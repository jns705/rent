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
select {
    width: 150px; /* 원하는 너비설정 */
    padding: .8em .5em; /* 여백으로 높이 설정 */
    font-family: inherit;  /* 폰트 상속 */
    background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
    border: 1px solid #999;
    border-radius: 0px; /* iOS 둥근모서리 제거 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
input {
	border: 1px solid #999;
	padding: .8em .5em;
}
#btnSearch{
	border: 1px solid #999;
	padding: .8em .5em;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="/buy/list?nowPage=${paging.nowPage}&cntPerPage="+sel+"&buyKind=${map.buyKind}&buySearch=${map.buySearch}";
	}
</script>
</head>
<body>
<div class="container">

 	<h2 align=center>예약 목록</h2>
 <form action="#" method="get">
 	<div style="float: left;">
	 	<select name="buyKind">
	 		<option value="all"  <c:if test="${map.buyKind eq 'all'}">selected</c:if> >전체</option>
	 		<option value="id" <c:if test="${map.buyKind eq 'id'}">selected</c:if> >회원 아이디</option>
	 		<option value="name" <c:if test="${map.buyKind eq 'name'}">selected</c:if> >회원 이름</option>
	 		<option value="tel" <c:if test="${map.buyKind eq 'tel'}">selected</c:if> >회원 전화번호</option>
	 	</select>
	 	
	 	<span>
	 		<input type="text" name="buySearch" placeholder="검색어 입력" value="">
	 	</span>
	 	<button id="btnSearch">검색</button>
 	</div>
 		<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
 </form>
<form method="post" name="form1">
	<table class="table">
		<thead style="background: #e7e6d2 ;">
			<tr>
			<th>buy_id</th>
				<th style="background: #e3ddcb ;">회원 아이디</th>
				<th>차량이름</th>
				<th>렌트아이디</th>
				<th>계약기간</th>
				<th>회원 이름</th>
				<th>회원 주소</th>	
				<th>회원 전화번호</th>
				<th>구매현황</th>
				<th>구매 날짜</th>
				<th>예약 취소</th>
			</tr>
		</thead>
		
		<tbody>
		
			<c:forEach items="${buyList}" var="buy" varStatus="i">
			<tr>
				<td>${buy.buy_id}</td>
				<td onclick="location.href='${path}/buy/detail/${buy.buy_id}'" style="cursor: pointer;">${buy.id}</td>
				<td>${car[i.index]}</td>
				<td onclick="location.href='${path}/rent/rentListDetail/${buy.rent_id}'" style="cursor: pointer;">${buy.rent_id}<input type="hidden" name="rent_id_${buy.buy_id}" value="${buy.rent_id }"></td>
				<td>${buy.month}개월</td>
				<td>${buy.name}</td>
				<td>${buy.address}</td>
				<td>${buy.tel}</td>
				<td>${buy.buy_situation}</td>
				<td>${buy.buy_date}</td>
				<td><a onclick="buyDelete(${buy.buy_id})"><span class="glyphicon glyphicon-trash"></span></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">									<!-- &lt; 는 기호(<)의 코드값이다  -->
			<a href="/buy/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/buy/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}&buyKind=${map.buyKind}&buySearch=${map.buySearch}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">				<!-- &gt; 는 기호(>)의 코드값이다  -->
			<a href="/buy/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</form>
	
	
</div>

</body>
<script>
function buyDelete(buy_id) {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/buy/delete/"+buy_id;
		document.form1.submit();
	}
}
</script>
</html>
</layoutTag:layout>