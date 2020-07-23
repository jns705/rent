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
  <style>
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table td {
  	 	background-color : #ffffff;
    }
    .table caption{caption-side: bottom; display: none;}
    .content {
    	height: 200px;
    }
  </style>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
</head>
<body>
	<div class="container">
 	<h2>게시글 목록</h2>
 	
 	<table class="table">
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
 			<tr id="data-container">
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
        <div id="pagination"></div>
 </div>
 <div class="content"></div>
 
 
</body>
<script>
$(function () {
    let container = $('#pagination');
    container.pagination({
        dataSource: [
            {name: "hello1"},
            {name: "hello2"},
            {name: "hello3"},
            {name: "hello4"},
            {name: "hello5"},
            {name: "hello6"},
            {name: "hello7"},
            {name: "hello8"},
            {name: "hello9"},
            {name: "hello10"},
            {name: "hello11"},
            {name: "hello12"},
            {name: "hello13"},
            {name: "hello14"},
            {name: "hello15"},
            {name: "hello16"},
            {name: "hello17"},
        ],
        callback: function (data, pagination) {
            var dataHtml = '';

            $.each(data, function (index, item) {
            	   dataHtml += '<tr>';
                dataHtml += '<td>' + item.name + '</td>';
                dataHtml += '</tr>';
            });

         

            $("#data-container").html(dataHtml);
        }
    })
})
</script>
<script>
//글목록의 개수
var count = ${count};
var pageNum = 1; //페이지 변수를 1로 초기화
var currentPage = Integer.parseInt(pageNum);

//pageSize : 화면에 표시할 글목록의 개수
var pageSize = 5;

//startRow : 현 페이지 글목록에 표시할 시작 글번호를 설정하는 부분이다. 시작 글 번호를 가지고 있다.
var startRow = (currentPage - 1) * pageSize +1;

//endRow : 현 페이지 글목록에 표시할 마지막 글번호를 설정하는 부분이다. 마지막 글 번호를 가지고 있다.
int endRow = currentPage * pageSize;
var number = count - (currentPage-1*pageSize); //화면 좌측의 일련번호

function pageMove(pg) {
	
	$.ajax({
	    url : '/accident/list',
	    type : 'post',
	    data : {'startRow':startRow},
	    	   {'pageSize':pageSize},
	    dataType :  'JSON',
	    success: function() {
			var page = pg;
			updatePaging("pageMove", page, count, perPgLine, 3);
		},
		error : function(e) {
			alert(e);
		}
	});
	
}


$(function () {
	pageMove(pageNum);
});
</script>
</html>
</layoutTag:layout>