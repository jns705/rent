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
<title>QNA 목록 페이지</title>
</head>
<body>
 <div class="container">
 	<h2>게시글 목록</h2>
 	<button class="btn btn-primary" onclick="location.href='${path}/qna/insert'">QNA 쓰기</button>
 	<table class="table table-hover table-bordered">
 		<thead>
 			<tr>
 				<th>No</th>
 				<th>제목</th>
 				<th>작성자</th>
 				<th>작성날짜</th>
 				<th colspan="2">수정/삭제</th>
 			</tr>
 		</thead>
 		<tbody>
 		<c:forEach items="${qnaList}" var="qna">
 			<tr><c:set var="pwd" value="${qna.qne_password }"/>
 				<c:choose>
 				<c:when test="${pwd != null && pwd != '' }">
 					<td onclick="pwdcheck(${pwd}); page(${qna.qna_id})">${qna.qna_id}</td>
 				</c:when>
 				<c:otherwise>
 					<td onclick="location.href='${path}/qna/detail/${qna.qna_id}'">${qna.qna_id}</td>
 				</c:otherwise>
 				</c:choose>
 				
 				<c:choose>
 					<c:when test="${pwd != null && pwd != '' }">
						<td colspan="2" align="center">비밀글입니다.</td>
 					</c:when>
 					<c:otherwise>
		 				<td>${qna.subject}</td>
		 				<td>${qna.writer}</td>
	 				</c:otherwise>
 				</c:choose>
 				<td>${qna.qna_date}</td>
 				<td align="center"><a href="${path}/qna/update" class="btn btn-success">수정</a></td>
 				<td align="center"><a href="${path}/qna/delete/${qna.qna_id}" class="btn btn-danger">삭제</a></td>
 			</tr>
 		</c:forEach>	
 		</tbody>
 	</table>
 </div>
</body>
<script>
var check = 0;

function pwdcheck(e) {
	var pwd = e;
	var input = prompt("비밀번호를 입력해주세요");
	if(pwd == input) {
		alert("정답");
		check = 1;
	}else {
		alert("비밀번호가 틀렸습니다.");
	}
}

function page(e) {
	if(check == 1) {
		location.href='${path}/qna/detail/'+e;
	}else {
		return false;
	}
	
	
}
</script>
</html>
</layoutTag:layout>