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
  </style>
</head>
<body>
	<div class="container">
 	<h2>게시글 목록</h2>
 	
 	<table class="table">
 		<thead>
 			<tr class="scrollLocation">
 				<th>사고 아이디</th>
 				<th>사고난 자동차</th>
 				<th>사고날짜</th>
 				<th>사고내용</th>
 				<th>사고비용</th>
 				<th>특이사항</th>
 			</tr>
 		</thead>
 		<tbody class="listToChange">
 		<!--
 		<c:forEach items="${accident}" var="acc" > 
 			<tr>
 				<td class="scrolling" data-accident_id="${acc.accident_id}">${acc.accident_id}</td>
 				<td id="a" style="cursor: pointer;" onclick="location.href='/admin/rentDetail/${acc.rent_id}'">${acc.rent_id}</td>
 				<td>${acc.accident_date}</td>
 				<td>${acc.accident_content}</td>
 				<td>${acc.accident_price}</td>
 				<td>${acc.special_note}</td>
 			</tr> 
 		</c:forEach>
 		-->
 		</tbody>
 	</table>
 </div>
 
</body>
<script>
var now = 1;	//시작
var cntPerPage = 10;	//화면에 보여줄 갯수

$(function() {
	loadNext();
});

//스크롤이 발생하면
$(window).scroll(function(){
	
	//$(window).scrollTop() == $(document).height() - $(window).height() 화면비율이 이상해서?? 한번밖에안됨
	//100%에서 한번 , 250% 한번,  500% 한번
	//$(document).height() <= $(window).scrollTop() + $(window).height() 스크롤 내리면 중간위치에서 실행 

	//페이지 끝 도착?
	if($(document).height() <= $(window).scrollTop() + $(window).height()){
		now+=1;		//now를 1증가시킨다.
		loadNext();	//사고목록들을 가져온다 cntPerPage만큼
	}
});

function loadNext(){
	$.ajax({
    type: 'get',
    url: '/accident/pagingList?nowPage='+now+'&cntPerPage='+cntPerPage,
    success: function(data){
        var str = '';
    	$.each(data, function(key, value){
	    	str += '<tr>';
        	str += '<td class="scrolling" data-accident_id="'+value.accident_id+'">'+ value.accident_id +'</td>';
        	str += '<td id="a" style="cursor: pointer;" onclick="location.href=\'/admin/rentDetail/'+value.rent_id+' \'">'+ value.rent_id +'</td>';
        	str += '<td>'+ value.accident_date +'</td>';
        	str += '<td>'+ value.accident_content +'</td>';
        	str += '<td>'+ value.accident_price +'</td>';
        	str += '<td>'+ value.special_note +'</td>';
        	str += '</tr>';
			// \'/admin/rentDetail/${acc.rent_id}\'
    	});
        	$('.listToChange').append(str);
    }
        
  });
}
</script>
</html>
</layoutTag:layout>