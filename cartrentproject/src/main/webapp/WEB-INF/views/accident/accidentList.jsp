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
 		<tbody>
 		<c:forEach items="${accident}" var="acc" >
 			<tr class="listToChange">
 				<td class="scrolling" data-accident_id="${acc.accident_id}">${acc.accident_id}</td>
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
 <div class="content"></div>
 
</body>
<script>

var lastScrollTop = 0;
var easeEffect = 'easeInQuint';

// 스크롤 이벤트 최초 발생
$(window).scroll(function() {

	var currentScrollTop = $(window).scrollTop();

	//다운 스크롤인 상대
	if(currentScrollTop - lastScrollTop > 0) {
		//down-scroll : 현재 게시글 다음의 글을 불러온다
		console.log("down-scrool");
	
	// 현재 스크롤의 위치가 화면의 보이는 위치보다 크다면
	if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
		
		//class가 scrolling인 것의 요소중 마지막인 요소 선택한 다음 그것의 data-accident_id값 받아온다
		//즉, 현재 뿌려진 게시글의 마지막 accident_id값 읽어옴 (다음 데이터를 가지고 오기 위해 필요함)
		var lastId = $(".scrolling:last").attr("data-accident_id");
			// ajax로 서버에 게시물 데이터 요청
			$.ajax({
				type: 'post',
				url : '${path}/accident/scrollDown',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					accident_id : lastId
				}),
				success : function(data) {
					var str = '';
					
					//받아온 데이터가 ""이거나 null이 아닌경우에 DOM handling을 해준다.
					if(data != "") {
						//서버로부터 받아온 data가 list이므로 이 각각의 원소에 접근하려면 each문 써야한다.
						$(data).each(
							//새로운 데이터를 갖고 html코드형태의 문자열을 만들어준다.
								function(key, value) {
									str += '<tr class'+'"listToChange"'+'>';
									str += '<td class='+'"scrolling"'+'data-accident_id="'+value.accident_id+'">'+value.accident_id+'</td>';
									str += '<td id="a" style="cursor:pointer;" onclick="location.href=\'/admin/rentDetail/'+value.rent_id+' \' ">'+value.rent_id+'</td>';
									str += '<td>'+value.accident_date+'</td>';
									str += '<td>'+ value.accident_content+'</td>';
									str += '<td>'+ value.accident_price+'</td>';
									str += '<td>'+ value.special_note+'</td>';
									str += '</tr>';
									
						}); //each
						//이전까지 뿌려졌던 데이터를 비워주고 <th>헤더 바로 밑에 위에서 만든 str을 뿌려준다.
						$(".listToChange").empty(); //셀렉터 태그 안의 모든 텍스트를 지움
						$(".scrollLocation").after(str);
					}else{ //if : data!= null
						//만약 서버로 부터 받아온 데이터가 없으면 아무것도 하지않는다
						alert("더 불러올 데이터가 없습니다.");
					}//else
					
				}//succes
				
			}); //ajax

			//여기서 class가 listToChange인 것중 가장 처음인 것을 찾아서 그 위치로 이동
			var position = $(".listToChange:first").offset(); //위치값

			//이동 위로부터 position.top px 위치로 스크롤 하는 것 500ms 동안 애니메이션이 이루어짐
			$('html,body').stop().animate({scrollTop : position.top},600,easeEffect);
			
	}//if: 현재 스크롤의 top 좌표가 > (게시글을 불러온 화면 height - 윈도우창의 height)되는 순간

		//lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
		lastScrollTop = currentScrollTop;
	}// 다운스크롤인 상태
	
	
	// 업 스크롤인 상태
	else{
		//up-scroll: 현재 게시글 이전의 글을 불러온다.
		console.log("up-scroll");

		//2.현재 스크롤의 top 좌표가 0이 되는 순간
		if($(window).scrollTop() <= 0) {

			//3.class가 scrolling인 것의 요소 중 첫 번째 요소를 선택한 다음 그것의 data-accident_id 값을 받아온다
			//즉, 현재 뿌려진 게시글의 첫 번째 id값을 읽어온다.
			var firstId = $(".scrolling:first").attr("data-accident_id");

			//4.ajax를 이용하여 현재 뿌려진 게시글의 첫 번째 accident_id를 서버로 내보내 데이터를 가져온다
			$.ajax({
				type : 'post',
				url : '${path}/accident/scrollUp',
				headers: {
					"Content-Tyep" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					accident_id : firstId
				}),
				success : function(data) {
					var str = "";
					
					//5. 받아온 데이터가 ""&&null이 아닐경우 DOM handling 해줌
					//이때 서버에서 값이 없으면 null을 던질줄 알았는데 ""를 던진다고함 (data!="" 로해야함)
					//이건 아마 컨트롤러의 리턴타임이 @ResponseBody로 json던져지는데 이떄 아무것도 없는게 ""로 날아오는것같다고함
					if(data != "") {
						//6. 서버로 부터 받아온 data가 list이므로 각각의 원소에 접근하려면 each문 써야함
						$(data).each(
							function(key, value) {
								str += '<tr class'+'"listToChange"'+'>';
								str += '<td class='+'"scrolling"'+'data-accident_id="'+value.accident_id+'">'+value.accident_id+'</td>';
								str += '<td id="a" style="cursor:pointer;" onclick="location.href=\'/admin/rentDetail/'+value.rent_id+' \' ">'+value.rent_id+'</td>';
								str += '<td>'+value.accident_date+'</td>';
								str += '<td>'+ value.accident_content+'</td>';
								str += '<td>'+ value.accident_price+'</td>';
								str += '<td>'+ value.special_note+'</td>';
								str += '</tr>';
								
						}); //each
						//8. 이전까지 뿌려졌던 데이터 비워주고 <th>헤더 바로 밑에 위에서 만든 str 뿌려주기
						$(".listToChange")/empty(); 
						$(".scrollLocation").after(str);
						
						
					}else {//if : data != ""
						alert("더 불러올 데이터가 없습니다.");
					}//else
				}//success
			});//ajax

			//스크롤 다운이벤트때 ajax통신이 발생하지 않을때 까지의 좌표까지 스크롤 내려가주기
			var position =($(document).height() - $(window).height()) -5;
			
			//이동 위로 부터 position.top px 위치로 스크롤 하는 것이다. 그걸 500ms 동안 애니메이션이 이루어짐
			$('html,body').stop().animate({scrollTop : position},600,easeEffect);
		}//if : 현재 스크롤의 top 좌표가 <= 0 되는 순간
		//lastScrollTop을 현재 currentScrollTop으로 갱신해준다.
		lastScrollTop = currentScrollTop;
	}// else : 업 스크롤일 상태
}); // scroll event


</script>
</html>
</layoutTag:layout>