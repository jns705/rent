<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트 상세정보</title>
</head>
<style>
	#container label{
		text-align: left;
	}
	
	thead	 th{
		text-align: center;
	}
	
	.naum	{
		margin-left: 50px;
		padding-left: 0px;
		width: 1100px;
	}
</style>
<body>

	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>옵션, 사고이력</b></font></label><br><br>
			<div class="panel panel-default">
				<div id="container">
				<br><br><br>
				<div class="container">
				<table class="table table-bordered table-striped naum form-group">
					<thead>
						<tr>
							<th>옵션리스트</th>
							<th>가격</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${option}" var="option">
							<tr align="center">
								<td>${option.option_name}</td>
								<td>${option.option_price}</td>
								<td>${option.option_content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>		
				<form action="${path}/admin/rentInsertProc" method="get">
				<input class="hidden" name="rent_id" value="${id}">
				<div class="op col-sm-offset-1 col-sm-11" align="center"></div>
				
				<div align="center">
					<button class="btn btn-rg">옵션변경</button>
					<button type="button" class="btn btn-rg" onclick="addOption();">옵션추가</button>
				</div>
				
				</form>
				
				<br>
				<form name="accidentInsertForm">
				<table class="table table-bordered table-striped naum  form-group">
					<thead>
						<tr>
							<th>사고내용</th>
							<th>발생비용</th>
							<th>사고날짜</th>
							<th>비고</th>
							<th class="hidden showChange">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${accident}" var="accident">
							<tr align="center" class="accidentList_${accident.accident_id}">
								<td id="con${accident.accident_id}"><p class="content_${accident.accident_id}">${accident.accident_content}</p></td>
								<td id="pri${accident.accident_id}"><p class="price_${accident.accident_id}">${accident.accident_price}</p></td>
								<td id="dat${accident.accident_id}"><p class="date_${accident.accident_id}">${accident.accident_date}</p></td>
								<td id="not${accident.accident_id}"><p class="note_${accident.accident_id}">${accident.special_note}</p></td>
								<td class="hidden showChange">
									<input type="checkbox" class="accident_id" name="accident_id" value="${accident.accident_id}"/>
								</td>
							</tr>
						</c:forEach>
						<tr class="accidentList"></tr>
					</tbody>
				</table>	
				<div align=center>
					<!-- ajax str에 넣어서 할라고 했는데 onclick()이 실행이 안됨-->
					<button class="hidden" id="insertBtn" type="button" name="accidentInsertBtn">등록</button>
					<p class="hidden" id="bbb"><font color="red">수정은 1개씩만 해주세요</font></p>
					<button class="hidden" id="updateBtn" type="button" onclick="accidentUpdate();">수정</button>
					<button class="hidden" id="deleteBtn" type="button" onclick="accidentDelete();">삭제</button>
				</div>
				</form>
				
				<div align="center">
					<button type="button" class="btn btn-rg" onclick="accidentScreen();">사고추가</button>
					<button type="button" class="btn btn-rg" onclick="changeBtn();">삭제/수정</button>
				</div>
				
				
				</div>	
				
				<br><br>
				
				</div>
			</div>
	</div>

</body>
<script>

//등록버튼을 눌렀을 경우 실행한다.
$('[name=accidentInsertBtn]').click(function() {
	var accidentData = $('[name=accidentInsertForm]').serialize();
	accidentInsert(accidentData);
});
//DB등록
function accidentInsert(accidentData) {
    $.ajax({
        url : '/accident/insertProc',
        type : 'post',
        data : accidentData,
        success : function(data){
        	window.location.reload(); //새로고침
        }
    });
}

//등록하기 위한 input들과 등록버튼(hidden)클래스명을 바꾼다.
function accidentScreen(){
	str = '';
	str += '<table class="table table-bordered table-striped naum form-group">';
	str += '<tr align="center">';
	str += '<input class="hidden" name="rent_id" value="${id}">';
	str += '<td><input type="text" name="accident_content" class="col-sm-12"></td>';
	str += '<td><input type="text" name="accident_price" class="col-sm-12"></td>';
	str += '<td><input type="date" name="accident_date" class="col-sm-12"></td>';
	str += '<td><input type="text" name="special_note" class="col-sm-12"></td>';
	str += '</tr></table>';
	$('.accidentList').html(str);
	document.getElementById("insertBtn").className = "btn btn-rg";
}

function changeBtn() {
	document.getElementById("updateBtn").className = "btn btn-rg";
	document.getElementById("deleteBtn").className = "btn btn-rg";
	document.getElementById("bbb").className = "";

	//show클래스를 찾아서 hidden을 빼준다
	$('.showChange').attr('class', 'showChange');
	
}

//수정삭제버튼 누르고 체크박스 누르면 실행
$('[name=accident_id]').click(function() {
	var id=[];
	$("input[name=accident_id]:checked").each(function(i){
		id.push($(this).val());
	});
	
	for(var i = 0; i<= id.length;i++) {
		var accident_id = id[i];
		var update = '';
		var con = document.getElementById("con"+accident_id).innerText
		var pri = document.getElementById("pri"+accident_id).innerText
		var dat = document.getElementById("dat"+accident_id).innerText
		var not = document.getElementById("not"+accident_id).innerText

		update += '<input type="text" class="form-control" id="content_'+accident_id+'" name="accident_content" value="'+con+'">';
		$('.content_' + accident_id ).html(update);
		
		update = '<input type="text" class="form-control" id="price_'+accident_id+'" name="accident_price" value="'+pri+'">';
		$('.price_'+ accident_id).html(update);
		
		update = '<input type="date" class="form-control" id="date'+accident_id+'" name="accident_date" value="'+dat+'">';
		$('.date_'+ accident_id).html(update);
		
		update = '<input type="text" class="form-control" id="note'+accident_id+'" name="special_note" value="'+not+'">';
		$('.note_'+ accident_id).html(update);
	}
	

	
});
//사고이력 수정
function accidentUpdate() {
	//수정버튼을 눌렀을 경우 실행한다.
		var updateData = $('[name=accidentInsertForm]').serialize();
		alert(updateData);
		$.ajax({
			url : '/accident/update',
			type : 'post',
			data : updateData,
			success : function(data) {
				window.location.reload();
			}
		});
}

//사고이력 삭제
function accidentDelete() {
	var checkBoxArr = [];
	$("input[name=accident_id]:checked").each(function(i){
		checkBoxArr.push($(this).val());
	});
	
	$.ajax({
		url : '/accident/delete/' +checkBoxArr ,
		type : 'post',
		success: function(data) {
			window.location.reload();
		}
	});	

	
}
</script>

<script type="text/javascript">
function addOption(){
	window.open('${path}/admin/optionForm'
			,'left=200, top=170, width=900, height=250, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
}

option();

function option(){
	$.ajax({
		url 	: '/admin/optionList',
		type	: 'get',
		success : function(data){
			var str = "";
			$.each(data, function(key, value){
				str += '<div class="col-sm-3">' +
						'<input class="checkbox col-sm-1" type="checkbox" name="'+ value.option_name +'" value="'+ value.option_name +'" />' +
						'<label class="control-label col-sm-6">'+ value.option_name +'</label>'+
						'</div>';
			});
			$('.op').html(str);
		}
	});

}
</script>
</html>

</layoutTag:layout>