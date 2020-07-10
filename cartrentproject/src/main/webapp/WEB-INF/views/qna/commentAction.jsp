<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
var qna_id = '${detail.qna_id}'; //qna 게시글 번호

//댓글 등록버튼을 눌렀을 경우 실행한다.
$('[name=commentInsertBtn]').click(function() {
	var insertData = $('[name=commentInsertForm]').serialize();	//commentInsertForm의 내용을 가져온다.
	if( $('[name=content]').val() == '') {
	    alert("댓글내용을 입력해주세요.");
	    return false;
	}
	if($('[name=writer]').val() == ''){
		alert("이름을 입력해주세요.");
		return false;
	}
	commentInsert(insertData);	
});

//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
                $('[name=writer]').val('');
            }
        }
    });
}

//댓글 목록 보기
function commentList() {
	$.ajax({
		url : '/comment/list/' + qna_id,
		type : 'get',
		data : {'qna_id': qna_id} ,
		success : function(data) {
			var str = '';
			//배열관리 메서드
			$.each(data, function(key, value){
				if(value.content){
				str += '<table class="table" style="font-size: 13px; padding : 20px">';
				str += '<tr>';
				str += '<td>';
				str += '<strong>'+value.writer+'</strong>';
				//대댓글달기
				str += '&nbsp;<a class="glyphicon glyphicon-comment" onclick="recommentInsert('+value.comment_id+','+qna_id+',\''+value.writer+'\','+value.recomment_id+');"></a>';
				str += '</td>';
				str += '<td class="text-right">';
				str += value.comment_date;
				//수정
				str += '/<a class="glyphicon glyphicon-pencil" onclick="commentUpdate('+value.comment_id+',\''+value.content+'\');"></a> /';
				//삭제
				str += '<a class="glyphicon glyphicon-trash" onclick="commentDelete('+value.comment_id+')"></a>';
				str += '</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td colspan="2">';
				str += '<p class="txt content'+value.comment_id +'">'+value.content+'</p></td></tr>';
				str += '</table>';
				str += '<div class="recomment_'+value.comment_id+'"></div>'
				}else{
					str += '<div>';
					str += '<span class="">　└ </span>';
					str += '<tr>';
					str += '<td>';
					str += '<strong><font color=red></font>'+value.comment_writer+'<font color=red>('+value.writer+')</font></strong>';
					str += '&nbsp;<a class="glyphicon glyphicon-comment" onclick="recommentInsert('+value.comment_id+','+qna_id+',\''+value.comment_writer+'\','+value.recomment_id+');"></a>';
					str += '</td>';
					str += '<td class="text-right">';
					str += value.comment_date;
					str += '/<a class="glyphicon glyphicon-pencil" onclick="recommentUpdate('+value.comment_id+',\''+value.comment_content+'\');"></a> /';
					str += '<a class="glyphicon glyphicon-trash" onclick="commentDelete('+value.comment_id+')"></a>';
					str += '</td>';
					str += '</tr>';
					str += '<tr>';
					str += '<td colspan="2">';
					str += '<p class="txt recontent'+value.comment_id +'">　　'+value.comment_content+'</p></td></tr>';
					str += '<div class="recomment_'+value.comment_id+'"></div>'
					str += '</div>';
				}

			});
			
			 $(".commentList").html(str);
		}
	});
}

//댓글 수정
function commentUpdate(comment_id, content) {
	str = '';
	str += '<input type="text" class="form-control" name="content_'+comment_id+'"value="'+content+'">';
	str += '<button class="form-control btn btn-danger" type="button" onclick="commentUpdateProc('+comment_id+');">수정</button>';
	$('.content' + comment_id).html(str);
}
function commentUpdateProc(comment_id) {
	//댓글 번호에 해당하는 수정된 내용을 가져온다.
	var update = $('[name=content_'+comment_id+']').val();
	$.ajax({
		url : '/comment/update' ,
		type : 'post',
		data : {'content' : update, 'comment_id' : comment_id},
		success: function(data) {
			if(data == 1) commentList(comment_id); //댓글을 수정한 후 목록을 출력한다.
		}
	});
}

//댓글 삭제
function commentDelete(comment_id) {
	$.ajax({
		url : '/comment/delete/'+ comment_id,
		type : 'post',
		success: function(data) {
			if(data == 1) commentList(comment_id);	//댓글 삭제 후에 목록을 출력한다.
			window.location.reload();
		}
	});
}

//대댓글 입력폼
function recommentInsert(comment_id, qna_id, writer, recomment_id) {
	str = '';
	str += '<div class="panel-footer panel_'+comment_id+'">';
	str += '<form name="recommentForm">';
	str += '<div class="comment-group">';
	str += '<div><label>이름</label>';
	str += '<input type="text" name="comment_writer" placeholder="이름을 입력하세요">';
	str += '<label class="col-sm-offset-8"><a onclick="commentFormClose('+comment_id+');"><span class="glyphicon glyphicon-remove"><sapn></a></label></div>';
	str += '<br><div class="write_area">';
	str += '<div><input type="hidden" name="recomment_id" value="'+recomment_id+'">';
	str += '<div><input type="hidden" name="writer" value="'+writer+'">';
    str += '<input type="hidden" name="qna_id" value="'+qna_id+'">';
    str += '<textarea class="input_write_comment" name="comment_content" placeholder="댓글을 입력하세요"></textarea>';
    str += '<button class="comment_submit" type="button" name="recommentBtn" onclick="recomment();">등록</button>';   
    str += '</div></div></div></form></div>';   
    $(".recomment_"+comment_id).html(str);
}

function commentFormClose(comment_id) {
	$('.panel_'+comment_id).remove();
}

//대댓글 등록버튼을 눌렀을 경우 실행한다.
function recomment() {
	var recommentData = $('[name=recommentForm]').serialize();
	if( $('[name=comment_content]').val() == '') {
	    alert("댓글내용을 입력해주세요.");
	    return false;
	}
	if($('[name=comment_writer]').val() == ''){
		alert("이름을 입력해주세요.");
		return false;
	}
	
    $.ajax({
        url : '/comment/commentInsert',
        type : 'post',
        data : recommentData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=comment_content]').val('');
            }
        }
    });
}
	
//대댓글 수정
function recommentUpdate(comment_id, comment_content) {
	str = '';
	str += '<input type="text" class="form-control" name="comment_content_'+comment_id+'"value="'+comment_content+'">';
	str += '<button class="form-control btn btn-danger" type="button" onclick="recommentUpdateProc('+comment_id+');">수정</button>';
	$('.recontent' + comment_id).html(str);
}
function recommentUpdateProc(comment_id) {
	//대댓글 번호에 해당하는 수정된 내용을 가져온다.
	var commentupdate = $('[name=comment_content_'+comment_id+']').val();
	$.ajax({
		url : '/comment/commentUpdate' ,
		type : 'post',
		data : {'comment_content' : commentupdate, 'comment_id' : comment_id},
		success: function(data) {
			if(data == 1) commentList(comment_id); //댓글을 수정한 후 목록을 출력한다.
		}
	});
}

//페이지 로딩시 게시글에 연결된 댓글이 있으면 무조건 댓글을 보여준다.
commentList();
</script>