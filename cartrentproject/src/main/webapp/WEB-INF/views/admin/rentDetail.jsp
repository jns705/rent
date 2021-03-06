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
	#container label{text-align: left;}
	
	thead	 th{text-align: center;}
	
	.naum	{margin-left: 50px;
			padding-left: 0px;
			width: 1100px;}
</style>
<body>

	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>옵션, 사고이력</b></font></label><br><br>
			<div class="panel panel-default">
				<div id="container">
				<br><br><br>
				<div class="container">
				<form action="/admin/optionProc" class="optionForm" method="get">
				<table class="table table-bordered table-striped naum form-group">
					<thead>
						<tr>
							<th>옵션리스트</th>
							<th>가격</th>
							<th>내용</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
						<tr align="center"  style="display: none;"  id="addOption" >
							<td><input name="option_name"     placeholder="옵션 이름" class="form-control" size="2" value=""></td>
							<td><input name="option_price"    placeholder="옵션 가격" class="form-control" size="2" value="1"></td>
							<td><input name="option_content"  placeholder="옵션 내용" class="form-control" size="4" value=""><input class="hidden" name="rent_id" value="${rent_id}"></td>
							<td>비고</td>
						</tr>
							
				</table>		
				</form>

				<form action="${path}/admin/rentInsertProc" method="get">
				<input class="hidden" name="rent_id" value="${rent_id}">
				<div class="op col-sm-offset-1 col-sm-11" align="center"></div>
				
				
				<div align="center">
					<button class="btn btn-rg">옵션변경</button>
					<button type="button" class="btn btn-rg btnChange" onclick="btnSlide('addOption');">옵션추가</button>
				</div>
				
				
				<div>
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
				<input type="hidden" id="count" name="count" value="z">
				<div align=center>
					<!-- ajax str에 넣어서 할라고 했는데 onclick()이 실행이 안됨-->
					<button class="hidden" id="insertBtn" type="button" name="accidentInsertBtn">등록</button>
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
var rent_id = $('[name=rent_id]').val();
showOption();
function btnSlide(id){
        if($('#'+id).is(":visible")) {
            $('#'+id).slideUp();
 			$('.btnChange').attr('onclick', '');
        } else {
            $('#'+id).slideDown();
			$('.btnChange').html('추가하기');
			$('.btnChange').attr('onclick', 'optionForm();');
         }
}    

    function showOption(){
		$.ajax({
			url 	: '/admin/optionList',
			type	: 'get',
			data    :  {'rent_id' : rent_id},
			success : function(data){
				var str = "";
				$.each(data.list, function(key, value){
					str += '<tr align="center" class="'+key+'">';
					str += '<td class="n'+key+'">' + value.option_name + '</td>';
					str += '<td class="p'+key+'">' + value.option_price + '</td>';
					str += '<td class="c'+key+'">' + value.option_content + '</td>';
					str += '<td><a onclick="update('+key+','+value.option_id+');">수정하기</a></td></tr>';
					
				});
				$('#tbody').html(str);
			}, error : {function(data){alert("실패");}}
		});
    }

    function update(index,option_id){
        var name 	= $('.n'+index).html();
        var price 	= $('.p'+index).html();
        var content = $('.c'+index).html();
    	$('.'+index).html(
			'<td><input name="option_name'   +index+'"    value="'+name+'"  placeholder="옵션 이름" class="form-control" size="2"></td>'+
			'<td><input name="option_price'  +index+'"   value="' +price+'"   placeholder="옵션 가격" class="form-control" size="2"></td>'+
			'<td><input name="option_content'+index+'" value="'   +content+'"   placeholder="옵션 내용" class="form-control" size="4"><input class="hidden" name="option_id'+index+'" value="'+option_id+'"></td>'+
			'<td><a onclick="optionForm();">수정완료</a></td>'
    	);
    }

    function optionForm(){
        if($('[name=option_price]').val() == '')
			$('[name=option_price]').val('1');
            
		$.ajax({
			url 	: '/admin/optionProc',
			type	: 'get',
			data	:  $('.optionForm').serialize(),
			success :  function(data){
				showOption();
				option();
				$('[name=option_name]').val('');
				$('[name=option_price]').val('');
				$('[name=option_content]').val('');
			}
		});
    }
//등록버튼을 눌렀을 경우 실행한다.
$('[name=accidentInsertBtn]').click(function() {
	var accidentData = $('[name=accidentInsertForm]').serialize();
	accidentInsert(accidentData);
});

//사고이력 등록 ajax
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

//사고추가버튼을 누르면 실행
//등록하기 위한 input들과 등록버튼(hidden)클래스명을 바꾼다.
function accidentScreen(){
	str = '';
	str += '<table class="table table-bordered table-striped naum form-group">';
	str += '<tr align="center">';
	str += '<input class="hidden" name="rent_id" value="${rent_id}">';
	str += '<td><input type="text" name="accident_content" class="col-sm-12"></td>';
	str += '<td><input type="text" name="accident_price" class="col-sm-12"></td>';
	str += '<td><input type="date" name="accident_date" class="col-sm-12"></td>';
	str += '<td><input type="text" name="special_note" class="col-sm-12"></td>';
	str += '</tr></table>';
	$('.accidentList').html(str);
	document.getElementById("insertBtn").className = "btn btn-rg";
}
//삭제/수정버튼 누르면 실행
function changeBtn() {
	//버튼 class에 hidden이 있는데 btn btn-rg로 바꾼다.
	document.getElementById("updateBtn").className = "btn btn-rg";
	document.getElementById("deleteBtn").className = "btn btn-rg";

	//showChange클래스를 찾아서 hidden을 빼준다
	$('.showChange').attr('class', 'showChange');
	
}

///수정삭제버튼 누르고 체크박스 누르면 실행
$('[name=accident_id]').click(function() {
	//클릭한 체크박스 값을 가져온다
	var id=[];
	$("input[name=accident_id]:checked").each(function(i){
		id.push($(this).val());
	});

	
	//체크박스 클릭시 수정할 수 있게 input창을 생성한다.
	for(var i = 0; i<= id.length;i++) {
		//리스트 id[i]번째 값을 accident_id에 넣는다
		var accident_id = id[i];
		var update = '';
		var con = document.getElementById("con"+accident_id).innerText
		var pri = document.getElementById("pri"+accident_id).innerText
		var dat = document.getElementById("dat"+accident_id).innerText
		var not = document.getElementById("not"+accident_id).innerText
		
		update += '<input type="hidden" class="form-control" id="content_'+accident_id+'" name="accident_id_'+ i +'" value="'+accident_id+'">';
		update += '<input type="text" class="form-control" id="content_'+accident_id+'" name="accident_content'+ i +'" value="'+con+'">';
		$('.content_' + accident_id ).html(update);
		
		update = '<input type="text" class="form-control" id="price_'+accident_id+'" name="accident_price'+ i +'" value="'+pri+'">';
		$('.price_'+ accident_id).html(update);
		
		update = '<input type="date" class="form-control" id="date'+accident_id+'" name="accident_date'+ i +'" value="'+dat+'">';
		$('.date_'+ accident_id).html(update);
		
		update = '<input type="text" class="form-control" id="note'+accident_id+'" name="special_note'+ i +'" value="'+not+'">';
		$('.note_'+ accident_id).html(update);
		document.getElementById('count').value = i;
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

function addOption(){
	window.open('${path}/admin/optionForm'
			,'left=200, top=170, width=900, height=250, scrollbars=no, status=no, resizable=no, fullscreen=no, channelmode=no');
}

option();

function option(){
	$.ajax({
		url 	: '/admin/optionList',
		type	: 'get',
		data    :  {'rent_id' : rent_id},
		success : function(data){
			var str = "";
			/* var dataList = $.extend(true, data.detail, data.list) */
			$.each(data.detail, function(key, value){
				str += '<div class="col-sm-3"> <input class="checkbox col-sm-1" ';
				$.each(data.list, function(key1, value1){
					if(value.option_name == value1.option_name)
						str += '  checked  ';
				});
				str +=	'type="checkbox" name="'+ value.option_name +'" value="'+ value.option_name +'" />' +
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